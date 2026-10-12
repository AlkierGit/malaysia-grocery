<?php
// Connect to the database
require_once "dbconfig.php";
// Choose the grocery item to update
$item_id = 2;
// Set the new price and stock quantity
$new_price = 15.50;
$new_stock = 35;
// Prepare the SQL update command
$sql = "UPDATE grocery_items
       SET price = :price, stock_quantity = :stock
       WHERE item_id = :id";
$stmt = $conn->prepare($sql);
// Execute the update using the new values
$stmt->execute([
   'price' => $new_price,
   'stock' => $new_stock,
   'id' => $item_id
]);
// Show the result
if ($stmt->rowCount() > 0) {
   echo "Grocery item updated successfully!";
} else {
   echo "No changes made, or the item was not found.";
}
?>
