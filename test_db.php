<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

echo "<h2>Database Connection Test</h2>";

if (!file_exists('includes/db.php')) {
    die("Error: Could not find <b>includes/db.php</b>. Check your folder structure.");
}
require 'includes/db.php';

echo "<p style='color: green; font-weight: bold;'>Connection Successful!</p>";

try {
    $stmt = $pdo->query("SELECT Name, Title FROM Monster WHERE Name LIKE '%Valstrax%' LIMIT 1");
    $monster = $stmt->fetch();

    if ($monster) {
        echo "<div style='border: 1px solid #ccc; padding: 10px; background: #f9f9f9;'>";
        echo "Found Monster: <b>" . htmlspecialchars($monster['Name']) . "</b><br>";
        echo "Title: " . htmlspecialchars($monster['Title']);
        echo "</div>";
    } else {
        echo "<p style='color: orange;'>Connection works, but 'Crimson Glow Valstrax' was not found in the table.</p>";
    }
} catch (Exception $e) {
    echo "<p style='color: red;'>SQL Error: " . $e->getMessage() . "</p>";
}
?>
