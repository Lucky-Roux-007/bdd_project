<?php
session_start();
include 'includes/db.php';

// --- NEW LOGIC: Handle Logout ---
// If the URL contains ?logout=true, destroy the session
if (isset($_GET['logout'])) {
    session_unset();
    session_destroy();
    
    // Redirect to self to clear the URL parameters and show clean login form
    header("Location: login.php");
    exit();
}
// --------------------------------

// Normal Login Logic
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = $_POST['password'];

    $stmt = $pdo->prepare("SELECT * FROM Hunters WHERE username = ?");
    $stmt->execute([$username]);
    $hunter = $stmt->fetch();

    if ($hunter && password_verify($password, $hunter['password'])) {
        $_SESSION['user_id'] = $hunter['Hunter_ID'];
        $_SESSION['username'] = $hunter['username'];
        $_SESSION['rank'] = $hunter['rank_type'] . " " . $hunter['rank_level']; // Combine them for easier display
        
        header("Location: index.php");
        exit();
    } else {
        $error = "Invalid Hunter Name or Password!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guild Login</title>
    <link rel="stylesheet" href="assets/style.css">
    <style>
        body { background-color: #0a0a0a; color: #c9a959; font-family: sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; flex-direction: column; }
        form { background: rgba(0,0,0, 0.8); border: 1px solid #c9a959; padding: 40px; border-radius: 5px; width: 300px; text-align: left; box-shadow: 0 0 15px rgba(201, 169, 89, 0.2); }
        input { width: 100%; padding: 10px; margin: 10px 0 20px 0; background: #222; border: 1px solid #555; color: white; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #c9a959; color: black; font-weight: bold; border: none; cursor: pointer; transition: background 0.3s; }
        button:hover { background: #e6c670; }
        a { color: #fff; text-decoration: underline; }
    </style>
</head>
<body>

    <h2 style="margin-bottom: 20px; text-transform: uppercase; letter-spacing: 2px;">Hunter Login</h2>

    <?php if(isset($error)) echo "<p style='color: #ff4d4d; margin-bottom:15px; text-align:center;'>$error</p>"; ?>

    <form action="login.php" method="POST">
        <label>Hunter Name:</label>
        <input type="text" name="username" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>

        <p style="text-align: center; margin-top: 15px; font-size: 0.9em; color: #aaa;">
            New here? <a href="register.php">Register</a>
        </p>
    </form>

</body>
</html>