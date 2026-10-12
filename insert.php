<?php
// Connect to the database
require_once "dbconfig.php";
// Set the details of the new grocery item
$item_name = "White Coffee";
$brand_name = "OldTown";
$category = "Beverages";
$price = 8.50;
$stock_quantity = 20;
// Insert the new grocery item into the database
$sql = "INSERT INTO grocery_items
       (item_name, brand_name, category, price, stock_quantity)
       VALUES (:item_name, :brand_name, :category, :price, :stock)";
$stmt = $conn->prepare($sql);
// Execute the insertion using the provided values
$stmt->execute([
   'item_name' => $item_name,
   'brand_name' => $brand_name,
   'category' => $category,
   'price' => $price,
   'stock' => $stock_quantity
]);
// Display a success message
echo "Grocery item inserted successfully!";
?>

