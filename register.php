<?php
session_start();
include 'includes/db.php';

$monsters = $pdo->query("SELECT Monster_ID, Name FROM Monster ORDER BY Name ASC")->fetchAll();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']); 
    $password = $_POST['password'];
    $rank_type = $_POST['rank_type'];
    $rank_level = $_POST['rank_level'];
    $fav_game = $_POST['fav_game'];
    $fav_monster = $_POST['fav_monster'];
    $fav_weapon = $_POST['favorite_weapon'];
    $palico_name = trim($_POST['palico_name']);

    $profile_pic = "default_hunter.png"; 
    
    if (isset($_FILES['profile_pic']) && $_FILES['profile_pic']['error'] == 0) {
        $upload_dir = 'assets/uploads/';
        $file_ext = strtolower(pathinfo($_FILES['profile_pic']['name'], PATHINFO_EXTENSION));
        $new_filename = "hunter_" . preg_replace('/[^a-zA-Z0-9]/', '', $username) . "_" . time() . "." . $file_ext;
        
        if (in_array($file_ext, ['jpg', 'jpeg', 'png', 'gif'])) {
            if (move_uploaded_file($_FILES['profile_pic']['tmp_name'], $upload_dir . $new_filename)) {
                $profile_pic = $new_filename;
            }
        }
    }

    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    $sql = "INSERT INTO Hunters (username, password, rank_type, rank_level, favorite_game, favorite_monster_id, favorite_weapon, palico_name, profile_picture) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    
    try {
        if ($stmt->execute([$username, $hashed_password, $rank_type, $rank_level, $fav_game, $fav_monster, $fav_weapon, $palico_name, $profile_pic])) {
            header("Location: login.php"); 
            exit();
        }
    } catch (PDOException $e) {
        $error = "Error: That name is taken!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guild Registration</title>
    <link rel="stylesheet" href="assets/style.css">
    <style>
        body { background-color: #0a0a0a; color: #c9a959; font-family: sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        form { background: rgba(0,0,0, 0.9); border: 1px solid #c9a959; padding: 40px; border-radius: 5px; width: 350px; text-align: left; margin-top: 20px;}
        input, select { width: 100%; padding: 10px; margin: 5px 0 15px 0; background: #222; border: 1px solid #555; color: white; box-sizing: border-box; }
        label { font-size: 0.9em; color: #ccc; }
        button { width: 100%; padding: 10px; background: #c9a959; color: black; font-weight: bold; border: none; cursor: pointer; margin-top: 10px; }
        .rank-container { display: flex; gap: 10px; }
    </style>
</head>
<body>
    <form action="register.php" method="POST" enctype="multipart/form-data">
        <h2 style="text-align:center; color:#fff; text-transform:uppercase;">New Hunter</h2>
        
        <label>Hunter Name:</label>
        <input type="text" name="username" required>
        <label>Password:</label>
        <input type="password" name="password" required>

        <label>Hunter Rank:</label>
        <div class="rank-container">
            <select name="rank_type" style="width: 40%;"><option value="LR">Low Rank</option><option value="HR">High Rank</option><option value="MR">Master Rank</option></select>
            <input type="number" name="rank_level" placeholder="Level" required style="width: 60%;">
        </div>

        <label>Main Weapon:</label>
        <select name="favorite_weapon">
            <?php 
            $weapons = [
                "Great Sword", "Long Sword", "Sword and Shield", "Dual Blades", 
                "Hammer", "Hunting Horn", "Lance", "Gunlance", "Switch Axe", 
                "Charge Blade", "Insect Glaive", "Light Bowgun", "Heavy Bowgun", "Bow"
            ];
            foreach ($weapons as $w) { echo "<option value='$w'>$w</option>"; }
            ?>
        </select>

        <label>Palico Name:</label>
        <input type="text" name="palico_name" placeholder="e.g. Mittens" required>

        <label>Profile Picture:</label>
        <input type="file" name="profile_pic" accept="image/*">

        <label>Favorite Game:</label>
        <select name="fav_game">
            <option value="MH Wilds">MH Wilds</option><option value="MH Rise: Sunbreak">MH Rise: Sunbreak</option><option value="MH World: Iceborne">MH World: Iceborne</option><option value="MH Generations">MH Generations</option>
        </select>

        <label>Favorite Monster:</label>
        <select name="fav_monster">
            <?php foreach($monsters as $m): ?>
                <option value="<?= $m['Monster_ID']; ?>"><?= htmlspecialchars($m['Name']); ?></option>
            <?php endforeach; ?>
        </select>

        <button type="submit">Mint Guild Card</button>
    </form>
</body>
</html>