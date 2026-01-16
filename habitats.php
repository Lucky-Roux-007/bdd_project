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
    <p class="text-muted-inline" style="margin-bottom: 30px;">Select a region to view ecological data.</p>

    <div class="habitat-grid">
        <?php foreach ($locations as $loc): ?>
            <a href="habitat_details.php?id=<?= $loc['Habitat_ID'] ?>" class="habitat-item"
                 onmouseover="this.style.transform='scale(1.03)'"
                 onmouseout="this.style.transform='scale(1)'">
                
                <img src="assets/locations/<?= htmlspecialchars($loc['Icon']) ?>" 
                     alt="<?= htmlspecialchars($loc['Name']) ?>"
                     class="habitat-item-image">
                
                <h3 class="habitat-item-title"><?= htmlspecialchars($loc['Name']) ?></h3>
            </a>
        <?php endforeach; ?>
    </div>
</div>

</body>
</html>
