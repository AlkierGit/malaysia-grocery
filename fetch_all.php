<?php
// Include the database connection file
require_once "dbconfig.php";
// Get all grocery items from the database
$sql = "SELECT * FROM grocery_items";
$stmt = $conn->prepare($sql);
$stmt->execute();
// Fetch all records and store them in an array
$items = $stmt->fetchAll(PDO::FETCH_ASSOC);
// Display all records in readable format
echo "<pre>";
print_r($items);
echo "</pre>";
?>

