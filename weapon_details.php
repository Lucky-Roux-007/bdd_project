<?php
// weapon_details.php
session_start();
require 'includes/db.php';
include 'includes/navbar.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$stmt = $pdo->prepare("
    SELECT W.*, 
           E.Name AS Element_Name, 
           E.Icon AS Element_Icon, 
           WT.Name AS Type_Name,
           WT.Icon AS Type_Icon,
           M.Name AS Monster_Name
    FROM Weapon W
    LEFT JOIN Element E ON W.Element_ID = E.Element_ID
    LEFT JOIN Weapon_Type WT ON W.Weapon_Type_ID = WT.Weapon_Type_ID
    LEFT JOIN Monster M ON W.Monster_ID = M.Monster_ID
    WHERE W.Weapon_ID = ?
");
$stmt->execute([$id]);
$weapon = $stmt->fetch();

if (!$weapon) {
    die("<div class='container' style='padding:50px;'>Weapon not found.</div>");
}

$stmtMats = $pdo->prepare("
    SELECT I.Name, I.Rarity, WC.Quantity, I.Rank_Color
    FROM Weapon_Crafting WC
    JOIN Item I ON WC.Item_ID = I.Item_ID
    WHERE WC.Weapon_ID = ?
");
$stmtMats->execute([$id]);
$materials = $stmtMats->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($weapon['Name']) ?> - Forge</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <div class="container" style="margin-top: 40px;">
        
        <div class="detail-header">
            <div style="display: flex; align-items: center; gap: 20px;">
                <img src="assets/weapons/<?= htmlspecialchars($weapon['Type_Icon'] ?? 'icon_armory.png') ?>" 
                     style="width: 80px; height: 80px; object-fit: contain; border: 1px solid var(--gold); padding: 10px; background: #111; border-radius: 4px;">
                
                <div>
                    <div style="color: var(--gold-dim); font-family: monospace; letter-spacing: 2px;">
                        <?= htmlspecialchars($weapon['Type_Name']) ?> TREE
                    </div>
                    <h1 class="rarity-<?= $weapon['Rarity'] ?>" style="font-size: 3rem; margin: 0; line-height: 1;">
                        <?= htmlspecialchars($weapon['Name']) ?>
                    </h1>
                </div>
            </div>
            
            <div style="text-align: right;">
                <span style="font-size: 1.5rem; font-weight: bold; color: #888;">Rarity <?= $weapon['Rarity'] ?></span>
            </div>
        </div>

        <div class="two-column">
            
            <div>
                <div class="info-box">
                    <h3 class="section-title">WEAPON STATISTICS</h3>
                    
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 1.1rem; margin-top: 20px;">
                        <div>
                            <span style="color: #666; font-size: 0.8rem; text-transform: uppercase;">Attack Power</span><br>
                            <span style="color: var(--gold); font-weight: bold; font-size: 1.4rem;">
                                <?= $weapon['Attack_Power'] ?>
                            </span>
                        </div>
                        <div>
                            <span style="color: #666; font-size: 0.8rem; text-transform: uppercase;">Affinity</span><br>
                            <span style="<?= $weapon['Affinity'] > 0 ? 'color: #ffaaaa;' : 'color: #ccc;' ?>">
                                <?= $weapon['Affinity'] ?>%
                            </span>
                        </div>
                        <div>
                            <span style="color: #666; font-size: 0.8rem; text-transform: uppercase;">Element</span><br>
                            <?php if ($weapon['Element_ID']): ?>
                                <div style="display: flex; align-items: center; gap: 8px;">
                                    <img src="assets/elements/<?= htmlspecialchars($weapon['Element_Icon']) ?>" style="width: 20px;">
                                    <span style="font-weight: bold;"><?= $weapon['Element_Name'] ?> <?= $weapon['Element_Value'] ?></span>
                                </div>
                            <?php else: ?>
                                <span style="color: #444;">None</span>
                            <?php endif; ?>
                        </div>
                        <div>
                            <span style="color: #666; font-size: 0.8rem; text-transform: uppercase;">Defense Bonus</span><br>
                            <?= isset($weapon['Defense']) && $weapon['Defense'] > 0 ? "+" . $weapon['Defense'] : "-" ?>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <h3 class="section-title">FORGING MATERIALS</h3>
                <?php if ($materials): ?>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Material</th>
                            <th style="width: 80px; text-align: center;">Qty</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($materials as $mat): ?>
                        <tr>
                            <td class="rarity-<?= $mat['Rarity'] ?>" style="font-weight: bold;">
                                <?= htmlspecialchars($mat['Name']) ?>
                            </td>
                            <td style="text-align: center; color: #ccc;">
                                x<?= $mat['Quantity'] ?>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                <div style="margin-top: 15px; text-align: right; color: var(--gold);">
                    <small>Required Funds: 60,000z</small>
                </div>
                <?php else: ?>
                    <p style="color: #666; font-style: italic; padding: 20px; text-align: center; border: 1px dashed #444;">
                        No crafting recipe registered.
                    </p>
                <?php endif; ?>
            </div>

        </div>
    </div>

</body>
</html>
