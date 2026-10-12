CREATE DATABASE IF NOT EXISTS malaysia_grocery;
USE malaysia_grocery;
CREATE TABLE IF NOT EXISTS grocery_items (
   item_id INT AUTO_INCREMENT PRIMARY KEY,
   item_name VARCHAR(100) NOT NULL,
   brand_name VARCHAR(100) NOT NULL,
   category VARCHAR(50) NOT NULL,
   price DECIMAL(10,2) NOT NULL,
   stock_quantity INT NOT NULL DEFAULT 0,
   manufacture_date DATE,
   expiry_date DATE
);
INSERT INTO grocery_items
(item_name, brand_name, category, price, stock_quantity, manufacture_date, expiry_date)
VALUES
('Milo Malt Drink 400g', 'Milo', 'Beverages', 12.50, 30, '2026-01-10', '2027-01-10'),
('Maggi Curry Noodles 5 Pack', 'Maggi', 'Instant Noodles', 6.50, 50, '2026-02-01', '2026-10-01'),
('Julie''s Peanut Butter Sandwich', 'Julies', 'Biscuits', 8.90, 20, '2026-01-15', '2026-07-15'),
('Adabi Curry Powder 250g', 'Adabi', 'Spices', 5.20, 25, '2026-02-05', '2027-02-05'),
('Brahim''s Chicken Curry Paste', 'Brahims', 'Cooking Paste', 7.50, 18, '2026-01-20', '2027-01-20'),
('Mamee Monster Snack', 'Mamee', 'Snacks', 2.00, 60, '2026-02-10', '2026-08-10'),
('Gardenia Original Classic Bread', 'Gardenia', 'Bakery', 3.80, 15, '2026-03-01', '2026-03-08'),
('F&N Orange Drink', 'F&N', 'Beverages', 4.50, 24, '2026-02-12', '2026-08-12'),
('Ayam Brand Sardines 155g', 'Ayam Brand', 'Canned Food', 6.80, 22, '2026-01-25', '2028-01-25'),
('Beryl''s Dark Chocolate', 'Beryl''s', 'Chocolate', 9.90, 12, '2026-02-15', '2027-02-15');
-- Add 90 more grocery records using Malaysian brands.
-- Each product has 9 package-size variants.
-- Prices are sample values for this school project.
INSERT INTO grocery_items
(item_name, brand_name, category, price, stock_quantity,
manufacture_date, expiry_date)
SELECT
   CONCAT(p.item_name, ' - ', v.pack_size),
   p.brand_name,
   p.category,
   ROUND(p.base_price * v.price_factor, 2),
   10 + (v.variant_no * 3),
   DATE_ADD('2026-01-01', INTERVAL v.variant_no DAY),
   DATE_ADD('2026-01-01', INTERVAL (180 + v.variant_no) DAY)
FROM
(
   SELECT 'Curry Powder' AS item_name, 'Adabi' AS brand_name,
          'Spices' AS category, 3.50 AS base_price
   UNION ALL
   SELECT 'Instant Noodles', 'Mamee', 'Instant Noodles', 1.50
   UNION ALL
   SELECT 'Peanut Butter Sandwich Biscuits', 'Julies', 'Biscuits', 4.00
   UNION ALL
   SELECT 'Cream Crackers', 'Hup Seng', 'Biscuits', 3.00
   UNION ALL
   SELECT 'Chicken Curry Paste', 'Brahims', 'Cooking Paste', 4.50
   UNION ALL
   SELECT 'Dark Chocolate', 'Beryls', 'Chocolate', 5.00
   UNION ALL
   SELECT 'Chicken Sausage', 'Ramly', 'Frozen Food', 6.00
   UNION ALL
   SELECT 'Chili Sauce', 'Life', 'Sauces', 3.00
   UNION ALL
   SELECT 'Frozen Roti Paratha', 'Kawan', 'Frozen Food', 5.50
   UNION ALL
   SELECT 'Black Tea', 'BOH', 'Beverages', 4.00
) AS p
CROSS JOIN
(
   SELECT 1 AS variant_no, 'Small Pack' AS pack_size,
          0.75 AS price_factor
   UNION ALL SELECT 2, 'Regular Pack', 1.00
   UNION ALL SELECT 3, 'Large Pack', 1.50
   UNION ALL SELECT 4, '100g Pack', 0.80
   UNION ALL SELECT 5, '200g Pack', 1.20
   UNION ALL SELECT 6, '250g Pack', 1.40
   UNION ALL SELECT 7, 'Family Pack', 2.00
   UNION ALL SELECT 8, 'Value Pack', 2.50
   UNION ALL SELECT 9, 'Jumbo Pack', 3.00
) AS v;

