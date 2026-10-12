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
