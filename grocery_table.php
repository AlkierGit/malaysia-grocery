<?php
// Connect to the database
require_once "dbconfig.php";
// Retrieve all grocery items, sorted by name
$sql = "SELECT * FROM grocery_items ORDER BY item_name ASC";
$stmt = $conn->prepare($sql);
$stmt->execute();
// Store the query results
$items = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
   <title>Malaysia Grocery Items</title>
</head>
<body>
<h2>Malaysia Grocery Items</h2>
<!-- Display the query results in an HTML table -->
<table border="1" cellpadding="8">
   <tr>
       <th>ID</th>
       <th>Item Name</th>
       <th>Brand</th>
       <th>Category</th>
       <th>Price</th>
       <th>Stock</th>
   </tr>
   <?php foreach ($items as $item): ?>
   <tr>
       <td><?= htmlspecialchars($item['item_id']) ?></td>
       <td><?= htmlspecialchars($item['item_name']) ?></td>
       <td><?= htmlspecialchars($item['brand_name']) ?></td>
       <td><?= htmlspecialchars($item['category']) ?></td>
       <td><?= htmlspecialchars($item['price']) ?></td>
       <td><?= htmlspecialchars($item['stock_quantity']) ?></td>
   </tr>
   <?php endforeach; ?>
</table>
</body>
</html>
