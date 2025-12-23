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

    <div class="codex-banner codex-banner-sm">
        <h1 class="codex-banner-h3">GUILD ARMORY</h1>
        <p>Select a weapon to view crafting specifications.</p>
    </div>

    <div class="container">
        
        <div class="armory-header">
            <div>Name</div>
            <div>Attack</div>
            <div>Affinity</div>
            <div>Element</div>
        </div>

        <div class="weapon-list">
            <?php foreach ($weapons as $w): ?>
                
                <a href="weapon_details.php?id=<?= $w['Weapon_ID'] ?>" class="weapon-row">
                    
                    <div class="list-item-name">
                        <img src="assets/weapons/<?= htmlspecialchars($w['Type_Icon'] ?? 'icon_armory.png') ?>" 
                             alt="Icon"
                             class="list-item-icon">
                        
                        <span class="rarity-<?= $w['Rarity'] ?> weapon-name">
                            <?= htmlspecialchars($w['Name']) ?>
                        </span>
                    </div>

                    <div class="list-stat col-right">
                        <?= $w['Attack_Power'] ?>
                    </div>
                    
                    <div class="list-stat col-right <?= $w['Affinity'] > 0 ? 'positive' : 'neutral' ?>">
                        <?= $w['Affinity'] ?>%
                    </div>
                    
                    <div class="col-right">
                        <?php if ($w['Element_ID']): ?>
                            <div class="weapon-element-container">
                                <span class="weapon-element-value"><?= $w['Element_Value'] ?></span>
                                <img src="assets/elements/<?= htmlspecialchars($w['Element_Icon']) ?>" 
                                     class="weapon-element-icon">
                            </div>
                        <?php else: ?>
                            <span class="weapon-element-none">-</span>
                        <?php endif; ?>
                    </div>

                </a>

            <?php endforeach; ?>
        </div>

    </div>

</body>
</html>
