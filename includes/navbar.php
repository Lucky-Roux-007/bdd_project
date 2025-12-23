<?php
// includes/navbar.php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>

<nav class="navbar">
    <a href="index.php" class="nav-link" style="font-weight: 900; letter-spacing: 2px; color: var(--gold);">HUNTER CODEX</a>
    <span class="divider">|</span>
    
    <a href="monsters.php" class="nav-link">MONSTERS</a>
    <span class="divider">|</span>
    <a href="armory.php" class="nav-link">ARMORY</a>
    <span class="divider">|</span>
    <a href="habitats.php" class="nav-link">LOCATIONS</a>
    <span class="divider">|</span>
    <a href="species.php" class="nav-link">SPECIES</a>
    
    <span class="divider" style="margin-left: 50px;">|</span>
    
    <?php if (isset($_SESSION['username'])): ?>
        <a href="guild_card.php" class="nav-link" style="color: var(--gold);">
            👤 <?php echo htmlspecialchars($_SESSION['username']); ?>
        </a>
        <a href="logout.php" class="nav-link" style="font-size: 0.8em; color: var(--crimson);">(Logout)</a>
    <?php else: ?>
        <a href="login.php" class="nav-link">HUNTER LOGIN</a>
    <?php endif; ?>
</nav>
