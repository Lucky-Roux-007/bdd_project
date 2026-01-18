<?php
// species_details.php
session_start();
require 'includes/db.php';
include 'includes/navbar.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

// 1. Fetch Species Details
$stmt = $pdo->prepare("SELECT * FROM Species WHERE Species_ID = ?");
$stmt->execute([$id]);
$species = $stmt->fetch();

if (!$species) {
    die("<div class='container' style='padding:50px; text-align:center;'>Species not found.</div>");
}

// 2. Fetch Monsters belonging to this Species
$stmtMonsters = $pdo->prepare("
    SELECT Monster_ID, Name, Title, Icon, Quest_Star_Rank 
    FROM Monster 
    WHERE Species_ID = ?
    ORDER BY Hunter_Rank ASC
");
$stmtMonsters->execute([$id]);
$residents = $stmtMonsters->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($species['Name']) ?> - Hunter Codex</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <div class="container" style="margin-top: 40px;">

        <div class="detail-header">
            <div style="display: flex; align-items: center; gap: 20px;">
                <img src="assets/icon_book.png" 
                     class="detail-icon-large" style="border-color: #eee;">
                
                <div>
                    <div class="text-muted-inline" style="font-family: monospace; letter-spacing: 2px;">CLASSIFICATION</div>
                    <h1 class="codex-banner-h3" style="font-size: 3.5rem;">
                        <?= htmlspecialchars($species['Name']) ?>
                    </h1>
                </div>
            </div>
        </div>

        <div class="two-column">
            
            <div>
                <div class="info-box">
                    <h3 class="section-title">ECOLOGICAL REPORT</h3>
                    <p class="habitat-description-text" style="font-style: italic; color: #ccc; line-height: 1.8;">
                        "<?= nl2br(htmlspecialchars($species['Description'] ?? 'No data available.')) ?>"
                    </p>
                </div>
            </div>

            <div>
                <h3 class="section-title inhabitants-title">REGISTERED SPECIMENS</h3>
                
                <?php if (count($residents) > 0): ?>
                    <div class="monster-grid" style="grid-template-columns: 1fr;"> 
                        <?php foreach ($residents as $m): ?>
                            <a href="monster_details.php?id=<?= $m['Monster_ID'] ?>" class="monster-card">
                                <img src="assets/<?= htmlspecialchars($m['Icon'] ?? 'icon_monster.png') ?>" 
                                     alt="Icon" class="monster-icon">
                                
                                <div style="flex-grow: 1;">
                                    <span class="rank-badge">
                                        <?= htmlspecialchars($m['Quest_Star_Rank']) ?>
                                    </span>
                                    <h3 class="monster-name" style="margin-bottom: 0;">
                                        <?= htmlspecialchars($m['Name']) ?>
                                    </h3>
                                    <div class="monster-title"><?= htmlspecialchars($m['Title']) ?></div>
                                </div>
                            </a>
                        <?php endforeach; ?>
                        
                    </div>
                <?php else: ?>
                    <p class="no-residents" style="color:#666; font-style:italic;">
                        No monsters of this species are currently tracked in the database.
                    </p>
                <?php endif; ?>
            </div>

        </div>
    </div>

</body>
</html>