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
    <p style="color: #ccc; margin-bottom: 30px;">Ecological classification of documented monsters.</p>

    <div class="weapon-list"> <?php foreach ($species as $s): ?>
            <div style="display: flex; align-items: center; justify-content: space-between; padding: 20px; border-bottom: 1px solid #333;">
                <div>
                    <h2 style="color: var(--gold); margin: 0 0 5px 0;"><?= htmlspecialchars($s['Name']) ?></h2>
                    <p style="color: #aaa; margin: 0; font-size: 0.9rem;"><?= htmlspecialchars($s['Description']) ?></p>
                </div>
                <div style="text-align: right;">
                    <span style="font-size: 1.5rem; font-weight: bold; color: #fff;"><?= $s['Monster_Count'] ?></span>
                    <br><span style="color: #666; font-size: 0.8rem; text-transform: uppercase;">Registered</span>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>

</body>
</html>
