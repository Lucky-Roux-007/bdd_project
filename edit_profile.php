<?php
session_start();
include 'includes/db.php';
if (!isset($_SESSION['user_id'])) { header("Location: login.php"); exit(); }
$user_id = $_SESSION['user_id'];

$monsters = $pdo->query("SELECT Monster_ID, Name FROM Monster ORDER BY Name ASC")->fetchAll();
$stmt = $pdo->prepare("SELECT * FROM Hunters WHERE Hunter_ID = ?");
$stmt->execute([$user_id]);
$current_user = $stmt->fetch();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $rank_type = $_POST['rank_type'];
    $rank_level = $_POST['rank_level'];
    $fav_game = $_POST['fav_game'];
    $fav_monster = $_POST['fav_monster'];
    $fav_weapon = $_POST['favorite_weapon'];
    $palico_name = trim($_POST['palico_name']);

    $sql_set = "rank_type=?, rank_level=?, favorite_game=?, favorite_monster_id=?, favorite_weapon=?, palico_name=?";
    $params = [$rank_type, $rank_level, $fav_game, $fav_monster, $fav_weapon, $palico_name];

    function handleUpload($fileInputName, $prefix, $userId) {
        if (isset($_FILES[$fileInputName]) && $_FILES[$fileInputName]['error'] == 0) {
            // Use absolute path first for Docker/server environments, but also support relative paths
            $upload_dir = __DIR__ . '/assets/uploads/';
            if (!is_dir($upload_dir)) { @mkdir($upload_dir, 0755, true); }
            if (!is_writable($upload_dir)) {
                $upload_dir = 'assets/uploads/';
                if (!is_dir($upload_dir)) { @mkdir($upload_dir, 0755, true); }
            }
            if (!is_writable($upload_dir)) { error_log('Upload dir not writable: ' . $rel_dir . ' / ' . $upload_dir); return false; }
            $ext = strtolower(pathinfo($_FILES[$fileInputName]['name'], PATHINFO_EXTENSION));
            if (in_array($ext, ['jpg', 'jpeg', 'png', 'gif'])) {
                $newName = $prefix . "_" . $userId . "_" . time() . "." . $ext;
                $target = $upload_dir . $newName;
                if (@move_uploaded_file($_FILES[$fileInputName]['tmp_name'], $target)) { return $newName; }
                error_log('move_uploaded_file failed for: ' . $target);
            }
        }
        return false;
    }

    if ($new_pic = handleUpload('profile_pic', 'hunter', $user_id)) {
        $sql_set .= ", profile_picture=?";
        $params[] = $new_pic;
    }
    if ($new_shot = handleUpload('hunter_screenshot', 'shot', $user_id)) {
        $sql_set .= ", hunter_screenshot=?";
        $params[] = $new_shot;
    }

    $params[] = $user_id;
    $stmt = $pdo->prepare("UPDATE Hunters SET $sql_set WHERE Hunter_ID=?");
    $stmt->execute($params);
    header("Location: guild_card.php"); exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="assets/style.css">
    <style>
        body { background: #0a0a0a; color: #c9a959; font-family: sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        form { background: rgba(0,0,0, 0.9); border: 1px solid #c9a959; padding: 40px; width: 400px; text-align: left; margin-top: 20px;}
        input, select { width: 100%; padding: 10px; margin: 5px 0 15px 0; background: #222; border: 1px solid #555; color: white; box-sizing: border-box; }
        label { font-size: 0.9em; color: #ccc; }
        button { width: 100%; padding: 10px; background: #c9a959; color: black; font-weight: bold; border: none; cursor: pointer; margin-top: 10px; }
        .section-title { color: #fff; border-bottom: 1px solid #333; margin-top: 20px; margin-bottom: 10px; padding-bottom: 5px;}
    </style>
</head>
<body>
    <form action="edit_profile.php" method="POST" enctype="multipart/form-data">
        <h2 style="text-align:center; color:#fff;">UPDATE CARD</h2>
        
        <div class="section-title">HUNTER INFO</div>
        <label>Hunter Rank:</label>
        <div style="display:flex; gap:10px;">
            <select name="rank_type" style="width:40%;">
                <option value="LR" <?= $current_user['rank_type']=='LR'?'selected':'' ?>>Low Rank</option>
                <option value="HR" <?= $current_user['rank_type']=='HR'?'selected':'' ?>>High Rank</option>
                <option value="MR" <?= $current_user['rank_type']=='MR'?'selected':'' ?>>Master Rank</option>
            </select>
            <input type="number" name="rank_level" value="<?= $current_user['rank_level']; ?>" style="width:60%;">
        </div>

        <label>Main Weapon:</label>
        <select name="favorite_weapon">
            <?php 
            $weapons = [
                "Great Sword", "Long Sword", "Sword and Shield", "Dual Blades", 
                "Hammer", "Hunting Horn", "Lance", "Gunlance", "Switch Axe", 
                "Charge Blade", "Insect Glaive", "Light Bowgun", "Heavy Bowgun", "Bow"
            ];
            foreach ($weapons as $w) {
                $sel = ($current_user['favorite_weapon'] == $w) ? 'selected' : '';
                echo "<option value='$w' $sel>$w</option>";
            }
            ?>
        </select>

        <label>Palico Name:</label>
        <input type="text" name="palico_name" value="<?= htmlspecialchars($current_user['palico_name'] ?? ''); ?>" required>

        <label>Favorite Game:</label>
        <select name="fav_game">
            <?php 
            $games = ["MH Wilds", "MH Rise: Sunbreak", "MH World: Iceborne", "MH Generations"];
            foreach ($games as $g) {
                $sel = ($current_user['favorite_game'] == $g) ? 'selected' : '';
                echo "<option value='$g' $sel>$g</option>";
            }
            ?>
        </select>
        <label>Favorite Monster:</label>
        <select name="fav_monster">
            <?php foreach($monsters as $m): ?>
                <?php $sel = ($current_user['favorite_monster_id'] == $m['Monster_ID']) ? 'selected' : ''; ?>
                <option value="<?= $m['Monster_ID']; ?>" <?= $sel; ?>><?= htmlspecialchars($m['Name']); ?></option>
            <?php endforeach; ?>
        </select>

        <div class="section-title">MEDIA</div>
        <label>Profile Icon:</label> <input type="file" name="profile_pic" accept="image/*">
        <label>Showcase Screenshot:</label> <input type="file" name="hunter_screenshot" accept="image/*">

        <button type="submit">Save Changes</button>
        <a href="guild_card.php" style="display:block; text-align:center; margin-top:15px; color:#666;">Cancel</a>
    </form>
</body>
</html>