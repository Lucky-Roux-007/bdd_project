<?php
// monster_details.php
session_start();
require 'includes/db.php';
include 'includes/navbar.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

// 1. Fetch Monster Info (Joined with Habitat and Species)
$stmt = $pdo->prepare("
    SELECT M.*, S.Name AS Species, H.Name AS Habitat, M.Habitat_ID 
    FROM Monster M
    LEFT JOIN Species S ON M.Species_ID = S.Species_ID
    LEFT JOIN Habitat H ON M.Habitat_ID = H.Habitat_ID
    WHERE M.Monster_ID = ?
");
$stmt->execute([$id]);
$monster = $stmt->fetch();

if (!$monster) {
    die("<div class='container' style='text-align:center; padding:50px;'><h2>RECORD NOT FOUND</h2></div>");
}

// 2. Fetch Drops
$stmtDrops = $pdo->prepare("
    SELECT I.Name, I.Rarity, D.Drop_Rate 
    FROM Drops D
    JOIN Item I ON D.Item_ID = I.Item_ID
    WHERE D.Monster_ID = ?
    ORDER BY I.Rarity DESC, D.Drop_Rate DESC
");
$stmtDrops->execute([$id]);
$drops = $stmtDrops->fetchAll();

// 3. Fetch Weaknesses
$stmtWeak = $pdo->prepare("
    SELECT E.Name, E.Icon 
    FROM Monster_Weakness MW
    JOIN Element E ON MW.Element_ID = E.Element_ID
    WHERE MW.Monster_ID = ?
");
$stmtWeak->execute([$id]);
$weaknesses = $stmtWeak->fetchAll();

// 4. Fetch Elements Used
$stmtElements = $pdo->prepare("
    SELECT E.Name, E.Icon 
    FROM Monster_Dmg_Element MDE
    JOIN Element E ON MDE.Element_ID = E.Element_ID
    WHERE MDE.Monster_ID = ?
");
$stmtElements->execute([$id]);
$elementsUsed = $stmtElements->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($monster['Name']) ?> - Hunter Codex</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <div class="container monster-details-wrapper">
        
        <div class="detail-header">
            <div style="display: flex; align-items: center; gap: 20px;">
                <img src="assets/<?= htmlspecialchars($monster['Icon'] ?? 'icon_monster.png') ?>" 
                     class="detail-icon-large">
                
                <div>
                    <div class="text-muted-inline" style="font-family: monospace; letter-spacing: 2px;">
                        <?= htmlspecialchars($monster['Title']) ?>
                    </div>
                    <h1 class="codex-banner-h3" style="font-size: 3.5rem;">
                        <?= htmlspecialchars($monster['Name']) ?>
                    </h1>
                </div>
            </div>
            
            <div style="text-align: right;">
                <span style="background: var(--gold); color: black; padding: 5px 15px; font-weight: bold; font-family: sans-serif;">
                    <?= htmlspecialchars($monster['Quest_Star_Rank']) ?>
                </span>
            </div>
        </div>

        <div class="two-column">
            
            <div>
                <div class="info-box">
                    <h3 class="section-title">PHYSIOLOGY</h3>
                    <p><strong>Species:</strong> 
                    <a href="species_details.php?id=<?= $monster['Species_ID'] ?>" class="text-link">
                      <?= htmlspecialchars($monster['Species']) ?>
                     </a>
                    </p>
                    
                    <p>
                        <strong>Main Habitat:</strong> 
                        <?php if ($monster['Habitat_ID']): ?>
                            <a href="habitat_details.php?id=<?= $monster['Habitat_ID'] ?>" class="text-link">
                                <?= htmlspecialchars($monster['Habitat']) ?>
                            </a>
                        <?php else: ?>
                            <span style="color: #666;">Unknown</span>
                        <?php endif; ?>
                    </p>
                    
                    <p><strong>Size Range:</strong> <?= $monster['min_Size'] ?> ~ <?= $monster['max_Size'] ?> cm</p>
                    
                    <hr style="border: 0; border-top: 1px solid #333; margin: 20px 0;">
                    
                    <p style="font-style: italic; color: #ccc;">
                        "<?= nl2br(htmlspecialchars($monster['Description'])) ?>"
                    </p>
                </div>

                <div class="info-box">
                    <h3 class="section-title">ELEMENTAL DAMAGE</h3>
                    <?php if ($elementsUsed): ?>
                        <div style="display: flex; flex-wrap: wrap;">
                        <?php foreach ($elementsUsed as $el): ?>
                            <div class="weakness-badge" style="border-color: var(--crimson);">
                                <img src="assets/elements/<?= htmlspecialchars($el['Icon'] ?? 'icon_question.png') ?>" 
                                     class="element-icon-small" 
                                     alt="<?= htmlspecialchars($el['Name']) ?>">
                                <span class="monster-element-text"><?= htmlspecialchars($el['Name']) ?></span>
                            </div>
                        <?php endforeach; ?>
                        </div>
                    <?php else: ?>
                        <p class="text-muted-inline">Non-elemental / Physical only.</p>
                    <?php endif; ?>
                </div>

                <div class="info-box">
                    <h3 class="section-title">WEAKNESSES</h3>
                    <?php if ($weaknesses): ?>
                        <div style="display: flex; flex-wrap: wrap;">
                        <?php foreach ($weaknesses as $w): ?>
                            <div class="weakness-badge">
                                <img src="assets/elements/<?= htmlspecialchars($w['Icon'] ?? 'icon_question.png') ?>" 
                                     class="element-icon-small" 
                                     alt="<?= htmlspecialchars($w['Name']) ?>">
                                <span class="monster-element-text"><?= htmlspecialchars($w['Name']) ?></span>
                            </div>
                        <?php endforeach; ?>
                        </div>
                    <?php else: ?>
                        <p class="text-muted-inline">No major weaknesses recorded.</p>
                    <?php endif; ?>
                </div>
            </div>

            <div>
                <h3 class="section-title">MATERIAL DROPS</h3>
                <?php if ($drops): ?>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Material Name</th>
                            <th>Rarity</th>
                            <th>Rate</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($drops as $drop): ?>
                        <tr>
                            <td class="rarity-<?= $drop['Rarity'] ?>">
                                <?= htmlspecialchars($drop['Name']) ?>
                            </td>
                            <td class="text-muted-inline"><?= $drop['Rarity'] ?></td>
                            <td style="font-family: monospace; color: var(--text-main);">
                                <?= number_format($drop['Drop_Rate'] * 100, 0) ?>%
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                <?php else: ?>
                    <p class="crafting-recipe-none">
                        No drop data available for this monster.
                    </p>
                <?php endif; ?>
            </div>

        </div>
    </div>
</body>
</html>
