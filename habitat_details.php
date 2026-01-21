<?php
session_start();
require 'includes/db.php';
include 'includes/navbar.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$stmt = $pdo->prepare("SELECT * FROM Habitat WHERE Habitat_ID = ?");
$stmt->execute([$id]);
$habitat = $stmt->fetch();

if (!$habitat) {
    die("<div class='container' style='padding:50px;'>Habtiat not found.</div>");
}

$stmtMonsters = $pdo->prepare("
    SELECT M.Monster_ID, M.Name, M.Title, M.Icon, M.Quest_Star_Rank, S.Name AS Species
    FROM Monster M
    LEFT JOIN Species S ON M.Species_ID = S.Species_ID
    WHERE M.Habitat_ID = ?
    ORDER BY M.Hunter_Rank ASC
");
$stmtMonsters->execute([$id]);
$residents = $stmtMonsters->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($habitat['Name']) ?> - Hunter Codex</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <div class="container habitat-details-wrapper">

        <div class="detail-header">
            <div style="display: flex; align-items: center; gap: 20px;">
                <img src="assets/locations/<?= htmlspecialchars($habitat['Icon'] ?? 'icon_map.png') ?>" 
                     class="detail-icon-large" style="border-color: #eee;">
                
                <div>
                    <div class="text-muted-inline" style="font-family: monospace; letter-spacing: 2px;">LOCALE</div>
                    <h1 class="codex-banner-h3" style="font-size: 3.5rem;">
                        <?= htmlspecialchars($habitat['Name']) ?>
                    </h1>
                </div>
            </div>
        </div>

        <div class="two-column">
            
            <div>
                <div class="info-box">
                    <h3 class="section-title">ECOLOGICAL REPORT</h3>
                    <p class="habitat-description-text">
                        "<?= nl2br(htmlspecialchars($habitat['Description'] ?? 'No data available for this region.')) ?>"
                    </p>
                </div>
            </div>

            <div>
                <h3 class="section-title inhabitants-title">KNOWN INHABITANTS</h3>
                
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
                    <p class="no-residents">No large monsters currently tracked in this region.</p>
                <?php endif; ?>
            </div>

        </div>
    </div>

</body>
</html>
