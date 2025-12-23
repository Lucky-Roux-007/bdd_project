<?php
// armory.php
session_start();
require 'includes/db.php';
include 'includes/navbar.php';

// Fetch Weapons
$stmt = $pdo->query("
    SELECT W.*, 
           E.Name AS Element_Name, 
           E.Icon AS Element_Icon, 
           WT.Name AS Type_Name,
           WT.Icon AS Type_Icon
    FROM Weapon W
    LEFT JOIN Element E ON W.Element_ID = E.Element_ID
    LEFT JOIN Weapon_Type WT ON W.Weapon_Type_ID = WT.Weapon_Type_ID
    ORDER BY WT.Name ASC, W.Rarity DESC
");
$weapons = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Armory - Hunter Codex</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <div class="codex-banner" style="padding: 40px 20px; min-height: auto;">
        <h1 style="font-size: 2.5rem;">GUILD ARMORY</h1>
        <p>Select a weapon to view crafting specifications.</p>
    </div>

    <div class="container">
        
        <div style="display: flex; align-items: center; padding: 10px 20px; border-bottom: 2px solid #444; color: #888; font-size: 0.8rem; text-transform: uppercase; font-family: monospace;">
            <div style="flex-grow: 1;">Weapon Name</div>
            
            <div style="width: 80px; text-align: right;">Attack</div>
            <div style="width: 80px; text-align: right;">Affinity</div>
            <div style="width: 100px; text-align: right;">Element</div>
        </div>

        <div class="weapon-list">
            <?php foreach ($weapons as $w): ?>
                
                <a href="weapon_details.php?id=<?= $w['Weapon_ID'] ?>" 
                   style="display: flex; align-items: center; padding: 12px 20px; border-bottom: 1px solid #222; text-decoration: none; color: inherit; transition: background 0.2s;"
                   onmouseover="this.style.background='#252525'" 
                   onmouseout="this.style.background='transparent'">
                    
                    <div style="flex-grow: 1; display: flex; align-items: center;">
                        <img src="assets/weapons/<?= htmlspecialchars($w['Type_Icon'] ?? 'icon_armory.png') ?>" 
                             alt="Icon"
                             style="width: 28px; height: 28px; object-fit: contain; margin-right: 15px;">
                        
                        <span class="rarity-<?= $w['Rarity'] ?>" style="font-weight: bold; font-size: 1.1rem;">
                            <?= htmlspecialchars($w['Name']) ?>
                        </span>
                    </div>

                    <div style="width: 80px; text-align: right; font-family: monospace; color: #ccc; font-size: 1rem;">
                        <?= $w['Attack_Power'] ?>
                    </div>
                    
                    <div style="width: 80px; text-align: right; font-family: monospace; font-size: 1rem; color: <?= $w['Affinity'] > 0 ? '#ffaaaa' : '#888' ?>;">
                        <?= $w['Affinity'] ?>%
                    </div>
                    
                    <div style="width: 100px; text-align: right;">
                        <?php if ($w['Element_ID']): ?>
                            <div style="display: flex; justify-content: flex-end; align-items: center; gap: 5px;">
                                <span style="color: #fff; font-weight: bold; font-family: monospace; font-size: 1rem;"><?= $w['Element_Value'] ?></span>
                                <img src="assets/elements/<?= htmlspecialchars($w['Element_Icon']) ?>" 
                                     style="width: 18px; height: 18px; object-fit: contain;">
                            </div>
                        <?php else: ?>
                            <span style="color: #444; font-family: monospace;">-</span>
                        <?php endif; ?>
                    </div>

                </a>

            <?php endforeach; ?>
        </div>

    </div>

</body>
</html>
