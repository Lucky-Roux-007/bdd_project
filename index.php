<?php
session_start(); 
include 'includes/navbar.php'; 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hunter Codex - Home</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
            <div class="codex-banner codex-banner-sm">
                <h1 class="codex-banner-h3">HUNTER CODEX</h1>
                <p>The comprehensive database of the New World. Authorized access for Guild Hunters only.</p>
            </div>
    <div class="container">

        <div class="portal-grid">
            
            <a href="monsters.php" class="portal-card">
                <img src="assets/icon_monster.png" alt="Monsters" class="portal-icon-img">
                <h3>MONSTERS</h3>
                <p class="text-muted-inline">Physiology, weaknesses, and drop rates.</p>
            </a>

            <a href="armory.php" class="portal-card">
                <img src="assets/icon_armory.png" alt="Armory" class="portal-icon-img">
                <h3>ARMORY</h3>
                <p class="text-muted-inline">Weapon trees, attack stats, and crafting recipes.</p>
            </a>

            <a href="habitats.php" class="portal-card">
                <img src="assets/icon_map.png" alt="Locations" class="portal-icon-img">
                <h3>LOCATIONS</h3>
                <p class="text-muted-inline">Ecological maps, Shrine Ruins, and hunting grounds.</p>
            </a>

            <a href="species.php" class="portal-card">
                <img src="assets/icon_book.png" alt="Species" class="portal-icon-img">
                <h3>SPECIES</h3>
                <p class="text-muted-inline">Biological classification (Wyverns, Elder Dragons, etc).</p>
            </a>

        </div>
    </div>

</body>
</html>
