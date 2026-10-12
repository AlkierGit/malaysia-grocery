<?php
// Connect to the database
require_once "dbconfig.php";
// Select the ID of the grocery item to delete
$item_id = 1;
// Prepare the SQL deletion command
$sql = "DELETE FROM grocery_items WHERE item_id = :id";
$stmt = $conn->prepare($sql);
// Execute the deletion
$stmt->execute(['id' => $item_id]);
// Check if a record was deleted
if ($stmt->rowCount() > 0) {
   echo "Grocery item deleted successfully!";
} else {
   echo "No grocery item found with that ID.";
}
?>
