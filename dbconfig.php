<?php
// Database connection settings
$host = "localhost";
$dbname = "malaysia_grocery";
$username = "root";
$password = "";
// Create a connection using PDO
try {
   $conn = new PDO(
       "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
       $username,
       $password
   );
   // Show errors if a database problem occurs
   $conn->setAttribute(
       PDO::ATTR_ERRMODE,
       PDO::ERRMODE_EXCEPTION
   );
} catch (PDOException $e) {
   // Display a message if the connection fails
   die("Database connection failed.");
}
?>
