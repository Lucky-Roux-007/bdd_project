<?php
session_start();
include 'includes/db.php';
if (!isset($_SESSION['user_id'])) { header("Location: login.php"); exit(); }

$stmt = $pdo->prepare("SELECT h.*, m.Name as MonsterName, m.Icon as MonsterIcon 
                       FROM Hunters h LEFT JOIN Monster m ON h.favorite_monster_id = m.Monster_ID 
                       WHERE h.Hunter_ID = ?");
$stmt->execute([$_SESSION['user_id']]);
$hunter = $stmt->fetch();

$join_date = date("M d, Y", strtotime($hunter['created_at']));
$avatar = "assets/uploads/" . ($hunter['profile_picture'] ?: "default_hunter.png");
$screenshot = $hunter['hunter_screenshot'] ? "assets/uploads/" . $hunter['hunter_screenshot'] : null;

// --- ICON LOGIC ---
$monster_icon = "assets/" . ($hunter['MonsterIcon'] ?: "icon_potion.png");
$palico_icon = "assets/palico.png"; 

// --- WEAPON MAPPING (Matches your filenames) ---
$weapon_map = [
    "Great Sword"      => "wep_gs.png",
    "Long Sword"       => "wep_ls.png",
    "Sword and Shield" => "wep_sns.png",
    "Dual Blades"      => "wep_db.png",
    "Hammer"           => "wep_hammer.png",
    "Hunting Horn"     => "wep_hh.png",
    "Lance"            => "wep_lance.png",
    "Gunlance"         => "wep_gl.png",
    "Switch Axe"       => "wep_sa.png",
    "Charge Blade"     => "wep_cb.png",
    "Insect Glaive"    => "wep_ig.png",
    "Light Bowgun"     => "wep_lbg.png",
    "Heavy Bowgun"     => "wep_hbg.png",
    "Bow"              => "wep_bow.png"
];

// Get the correct filename, or default to Great Sword if something breaks
$fav_wep = $hunter['favorite_weapon'];
$wep_file = isset($weapon_map[$fav_wep]) ? $weapon_map[$fav_wep] : "wep_gs.png";
$weapon_icon = "assets/weapons/" . $wep_file; // Note: Points to 'weapons' subfolder
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guild Card</title>
    <link rel="stylesheet" href="assets/style.css">
    <style>
        body { background-color: #0a0a0a; color: #c9a959; font-family: sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .guild-card { background: linear-gradient(135deg, #1a1a1a 0%, #0d0d0d 100%); border: 2px solid #b8860b; width: 450px; padding: 30px; box-shadow: 0 0 30px rgba(184, 134, 11, 0.15); text-align: center; position: relative; overflow: hidden; min-height: 600px; }
        
        .tab-container { display: flex; justify-content: center; gap: 10px; margin-bottom: 20px; }
        .tab-btn { background: transparent; border: 1px solid #444; color: #666; padding: 5px 20px; cursor: pointer; font-weight: bold; font-size: 0.8em; }
        .tab-btn.active { border-color: #c9a959; color: #c9a959; background: rgba(201,169,89, 0.1); }
        .card-section { display: none; animation: fadeIn 0.3s; }
        .card-section.active { display: block; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(5px); } to { opacity: 1; transform: translateY(0); } }

        .avatar-frame { width: 120px; height: 120px; margin: 0 auto 15px auto; border: 3px solid #c9a959; border-radius: 50%; overflow: hidden; background: #000; }
        .avatar-frame img { width: 100%; height: 100%; object-fit: cover; }
        
        .stats-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; background: rgba(0,0,0,0.5); padding: 20px; border-radius: 8px; border: 1px solid #333; margin-bottom: 25px; text-align: left; }
        .stat-label { color: #888; font-size: 0.7em; text-transform: uppercase; margin-bottom: 5px; }
        .stat-val { color: #eee; font-weight: bold; }
        
        .monster-flex { display: flex; align-items: center; gap: 10px; }
        .monster-mini-icon { width: 32px; height: 32px; object-fit: contain; }

        .screenshot-frame { width: 100%; height: 350px; border: 1px solid #333; background: #000; display: flex; align-items: center; justify-content: center; margin-bottom: 20px; }
        .screenshot-frame img { width: 100%; height: 100%; object-fit: contain; }
        .no-shot { color: #444; font-style: italic; }

        .action-btn { display: inline-block; padding: 10px 20px; text-decoration: none; color: #000; background: #c9a959; font-weight: bold; width: 200px; margin-bottom: 10px; }
        .action-btn:hover { background: #e6c670; }
        .edit-btn { background: #444; color: #fff; }
        .edit-btn:hover { background: #555; }
    </style>
</head>
<body>
    <div class="guild-card">
        <div class="tab-container">
            <button class="tab-btn active" onclick="switchTab('data')">DATA</button>
            <button class="tab-btn" onclick="switchTab('photo')">PHOTO</button>
        </div>

        <div id="tab-data" class="card-section active">
            <div class="avatar-frame"><img src="<?= $avatar; ?>"></div>
            <h2 style="margin:0; color:#fff; text-transform:uppercase;"><?= htmlspecialchars($hunter['username']); ?></h2>
            <div style="margin-bottom: 20px; font-weight: bold; font-size: 1.4em; color: #fff;">
                <span style="color:#c9a959; font-size: 1.2em;">★</span> <?= $hunter['rank_type']; ?> <?= $hunter['rank_level']; ?>
            </div>

            <div class="stats-grid">
                <div><div class="stat-label">Title</div><div class="stat-val"><?= htmlspecialchars($hunter['favorite_game']); ?></div></div>
                <div><div class="stat-label">Guild Status</div><div class="stat-val" style="color:#4caf50;">Active Duty</div></div>
                
                <div><div class="stat-label">Main Weapon</div>
                    <div class="monster-flex">
                        <img src="<?= $weapon_icon; ?>" class="monster-mini-icon" onerror="this.src='assets/icon_potion.png'">
                        <span class="stat-val" style="font-size:0.9em;"><?= htmlspecialchars($hunter['favorite_weapon']); ?></span>
                    </div>
                </div>

                <div><div class="stat-label">Palico</div>
                    <div class="monster-flex"><img src="<?= $palico_icon; ?>" class="monster-mini-icon"><span class="stat-val"><?= htmlspecialchars($hunter['palico_name']); ?></span></div>
                </div>

                <div><div class="stat-label">Favourite Monster</div>
                    <div class="monster-flex"><img src="<?= $monster_icon; ?>" class="monster-mini-icon"><span class="stat-val"><?= htmlspecialchars($hunter['MonsterName']); ?></span></div>
                </div>
                
                <div>
                    <div class="stat-label">Registration</div><div class="stat-val" style="font-size: 0.9em;"><?= $join_date; ?></div>
                </div>
            </div>
        </div>

        <div id="tab-photo" class="card-section">
            <div class="screenshot-frame">
                <?php if ($screenshot): ?> <img src="<?= $screenshot; ?>"> <?php else: ?> <div class="no-shot">No screenshot uploaded.<br>Edit profile to add one.</div> <?php endif; ?>
            </div>
            <p style="color:#888; font-size:0.9em;">"A hunter must always look their best."</p>
        </div>

        <a href="edit_profile.php" class="action-btn edit-btn">EDIT PROFILE</a><br>
        <a href="index.php" class="action-btn">RETURN TO CODEX</a>
        <a href="login.php?logout=true" style="display: block; margin-top: 15px; color: #888; font-size: 0.9em; text-decoration: underline;">Log Out</a>
    </div>

    <script>
        function switchTab(t) {
            document.querySelectorAll('.card-section').forEach(e => e.classList.remove('active'));
            document.querySelectorAll('.tab-btn').forEach(e => e.classList.remove('active'));
            document.getElementById('tab-' + t).classList.add('active');
            if(t==='data') document.querySelectorAll('.tab-btn')[0].classList.add('active');
            else document.querySelectorAll('.tab-btn')[1].classList.add('active');
        }
    </script>
</body>
</html>