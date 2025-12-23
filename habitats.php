<?php
session_start();
require 'includes/db.php';
include 'includes/navbar.php';

// Fetch all locations
$stmt = $pdo->query("SELECT * FROM Habitat ORDER BY Habitat_ID ASC");
$locations = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Locations - Hunter Codex</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<div class="container" style="margin-top: 40px;">
    <h1 class="section-title">Expedition Locales</h1>
    <p style="color: #ccc; margin-bottom: 30px;">Select a region to view ecological data.</p>

    <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 20px;">
        <?php foreach ($locations as $loc): ?>
            <div class="info-box" style="text-align: center; padding: 20px; transition: transform 0.2s; cursor: pointer;"
                 onmouseover="this.style.transform='scale(1.03)'"
                 onmouseout="this.style.transform='scale(1)'">
                
                <img src="assets/locations/<?= htmlspecialchars($loc['Icon']) ?>" 
                     alt="<?= htmlspecialchars($loc['Name']) ?>"
                     style="width: 100%; max-width: 200px; height: 120px; object-fit: cover; border-radius: 4px; border: 1px solid #444;">
                
                <h3 style="margin-top: 15px; color: var(--gold);"><?= htmlspecialchars($loc['Name']) ?></h3>
            </div>
        <?php endforeach; ?>
    </div>
</div>

</body>
</html>
