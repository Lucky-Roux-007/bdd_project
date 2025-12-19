<?php
// monsters.php
session_start();
require 'includes/db.php';
include 'includes/navbar.php';

// 1. Sorting Logic
$sort = isset($_GET['sort']) ? $_GET['sort'] : 'rank';

if ($sort === 'name') {
    $orderClause = "M.Name ASC";
    $activeRank = "";
    $activeName = "active-sort";
} else {
    $orderClause = "M.Hunter_Rank ASC";
    $activeRank = "active-sort";
    $activeName = "";
}

// 2. Fetch Data
$sql = "SELECT M.Monster_ID, M.Name, M.Title, M.Quest_Star_Rank, M.Icon, S.Name AS Species
        FROM Monster M
        LEFT JOIN Species S ON M.Species_ID = S.Species_ID
        ORDER BY $orderClause";

$stmt = $pdo->query($sql);
$monsters = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ecology - Hunter Codex</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <div class="codex-banner" style="padding: 40px 20px; min-height: auto;">
        <h1 style="font-size: 2.5rem;">MONSTER ECOLOGY</h1>
        <p>Verified records of large monsters found in the New World.</p>
    </div>

    <div class="container">
        <div class="controls-bar">
            <div style="color: var(--text-muted);">
                Records Found: <span style="color: var(--gold);"><?= count($monsters) ?></span>
            </div>
            <div class="sort-options">
                SORT BY:
                <a href="?sort=rank" class="sort-btn <?= $activeRank ?>">Threat Level</a>
                <a href="?sort=name" class="sort-btn <?= $activeName ?>">Name (A-Z)</a>
            </div>
        </div>

        <div class="monster-grid">
            <?php foreach ($monsters as $m): ?>
                <a href="monster_details.php?id=<?= $m['Monster_ID'] ?>" class="monster-card">
                    
                    <img src="assets/<?= htmlspecialchars($m['Icon'] ?? 'icon_monster.png') ?>" 
                         alt="Icon" class="monster-icon">

                    <div style="flex-grow: 1;">
                        <span class="rank-badge" style="position: static; float: right; margin-left: 10px;">
                            <?= htmlspecialchars($m['Quest_Star_Rank']) ?>
                        </span>
                        
                        <h3 class="monster-name" style="border: none; margin-bottom: 2px;">
                            <?= htmlspecialchars($m['Name']) ?>
                        </h3>
                        <div class="monster-title"><?= htmlspecialchars($m['Title']) ?></div>
                        <div style="font-size: 0.8rem; color: var(--gold-dim); margin-top: 5px;">
                            <?= htmlspecialchars($m['Species']) ?>
                        </div>
                    </div>
                </a>
            <?php endforeach; ?>
        </div>
    </div>
</body>
</html>
