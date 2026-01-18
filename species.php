<?php
session_start();
require 'includes/db.php';
include 'includes/navbar.php';

// Fetch all species with a count of how many monsters belong to each
$stmt = $pdo->query("
    SELECT S.*, COUNT(M.Monster_ID) as Monster_Count 
    FROM Species S
    LEFT JOIN Monster M ON S.Species_ID = M.Species_ID
    GROUP BY S.Species_ID
    ORDER BY S.Name ASC
");
$species = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ecological Classification - Hunter Codex</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<div class="container" style="margin-top: 40px;">
    <h1 class="section-title">Known Species</h1>
    <p class="text-muted-inline" style="margin-bottom: 30px;">Ecological classification of documented monsters.</p>

    <div class="weapon-list">
        <?php foreach ($species as $s): ?>
            <div class="species-item">
                <div class="species-info">
                    <h2 class="species-name">
                    <a href="species_details.php?id=<?= $s['Species_ID'] ?>">
                    <?= htmlspecialchars($s['Name']) ?>
                    </a>   
                    </h2>
                    <p class="species-description"><?= htmlspecialchars($s['Description']) ?></p>
                </div>
                <div class="species-count-section">
                    <span class="species-count"><?= $s['Monster_Count'] ?></span>
                    <br><span class="species-count-label">Registered</span>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>

</body>
</html>
