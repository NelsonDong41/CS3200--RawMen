CREATE DATABASE ramen_db;
GRANT ALL PRIVILEGES ON ramen_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE ramen_db;

-- COLLEGE (state values are null cause not every country has states)
create table College(
	college_name VARCHAR(58) PRIMARY KEY,
	city VARCHAR(30),
	state VARCHAR(30),
	country VARCHAR(50)
);


-- CUSTOMERS
create table Customer (
	id INT PRIMARY KEY NOT NULL,
	last_name VARCHAR(50),
	first_name VARCHAR(50),
	budget VARCHAR(2),
	country VARCHAR(50),
	college_name VARCHAR(58),
	FOREIGN KEY (college_name)
       REFERENCES College (college_name)
);

-- BRAND
create table Brand (
	id INT PRIMARY KEY NOT NULL,
	brand_name VARCHAR(50),
	country VARCHAR(50)
);

-- RAMEN DETAILS
create table RamenDetails (
	details_id INT PRIMARY KEY NOT NULL,
	spice_level INT,
	broth_type VARCHAR(8),
	noodle_type VARCHAR(12),
	sodium_level INT
);

-- PRODUCT
create table Product (
	ramen_id INT PRIMARY KEY NOT NULL,
	name VARCHAR(100),
	origin_country VARCHAR(50),
	price DECIMAL(4,2),
	style VARCHAR(50),
	rating VARCHAR(50),
	brand_id INT,
	details_id INT,
	FOREIGN KEY (brand_id) REFERENCES Brand (id),
	FOREIGN KEY (details_id) REFERENCES RamenDetails (details_id)
);

-- COMPETES
create table Competes (
	brand_id INT,
	competitor_id INT,
	PRIMARY KEY (brand_id, competitor_id),
	FOREIGN KEY (brand_id) REFERENCES Brand (id),
	FOREIGN KEY (competitor_id) REFERENCES Brand (id)
);

-- CRITIC
create table Critic (
	critic_id INT PRIMARY KEY NOT NULL,
	last_name VARCHAR(50),
	first_name VARCHAR(50)
);

-- CRITIQUE
create table Critique (
	critique_id INT NOT NULL,
	rating INT,
	review TEXT,
	publication_company VARCHAR(50),
	critic_id INT NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (critique_id, critic_id, ramen_id),
	FOREIGN KEY (critic_id) REFERENCES Critic (critic_id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- INVOICE
create table Invoice (
	invoice_id INT PRIMARY KEY NOT NULL,
	date_bought DATE,
	date_received DATE,
    order_country VARCHAR(50),
	total DECIMAL(7,2)
);

-- INVOICE LINE
create table InvoiceLine (
	invoice_line_id INT NOT NULL,
	quantity INT,
	invoice_id INT NOT NULL,
	ramen_id INT NOT NULL,
	unit_price DECIMAL(4,2),
	PRIMARY KEY (invoice_line_id, invoice_id, ramen_id),
	FOREIGN KEY (invoice_id) REFERENCES Invoice (invoice_id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- ALREADY TRIED
create table AlreadyTried (
	customer_id INT NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- CART
create table Cart (
	customer_id INT NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- FAVORITES
create table Favorites (
	customer_id INT NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- WISHLIST
create table Wishlist (
	customer_id INT NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- FREQUENTLY ORDERED
create table FrequentlyOrdered (
	customer_id INT NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- PREFERRED
create table Preferred (
	customer_id INT NOT NULL,
	details_id INT NOT NULL,
	PRIMARY KEY (customer_id, details_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (details_id) REFERENCES RamenDetails (details_id)
);

-- college definitions
insert into College (college_name, city, state, country) values ('King Mongkut''s University of Technology North Bangkok', 'Pong', null, 'Thailand');
insert into College (college_name, city, state, country) values ('Universidad de la República', 'Nueva Helvecia', null, 'Uruguay');
insert into College (college_name, city, state, country) values ('Universitas Komputer Indonesia', 'Desa Nasol', null, 'Indonesia');
insert into College (college_name, city, state, country) values ('Music Academy "Fryderyk Chopin" in Warszaw', 'Kolsko', null, 'Poland');
insert into College (college_name, city, state, country) values ('Dubna International University for Nature, Society and Man', 'Omsukchan', null, 'Russia');
insert into College (college_name, city, state, country) values ('Embry Riddle Aeronautical University, Prescott', 'Fairbanks', 'Alaska', 'United States');
insert into College (college_name, city, state, country) values ('Coker College', 'El Paso', 'Texas', 'United States');
insert into College (college_name, city, state, country) values ('Universidad Regiomontana', 'Lazaro Cardenas', 'Guerrero', 'Mexico');
insert into College (college_name, city, state, country) values ('Shanghai Lixin University of Commerce', 'Anju', null, 'China');
insert into College (college_name, city, state, country) values ('Universitas Negeri Gorontalo', 'Toroy', null, 'Indonesia');
insert into College (college_name, city, state, country) values ('Kokand State Pedagogical Institute', 'Toshloq', null, 'Uzbekistan');
insert into College (college_name, city, state, country) values ('Université de La Rochelle', 'Tarbes', 'Midi-Pyrénées', 'France');
insert into College (college_name, city, state, country) values ('Instituto Superior de Ciências do Trabalho e da Empresa', 'Ortiga', 'Santarém', 'Portugal');
insert into College (college_name, city, state, country) values ('Universitas Brawijaya', 'Ngamba', null, 'Indonesia');
insert into College (college_name, city, state, country) values ('Central Luzon State University', 'Wañgan', null, 'Philippines');
insert into College (college_name, city, state, country) values ('Ivanovo State Textile Academy', 'Surkhakhi', null, 'Russia');
insert into College (college_name, city, state, country) values ('Ittihad Private University', 'Al Ḩarāk', null, 'Syria');
insert into College (college_name, city, state, country) values ('Universidade Lusiada', 'Mucifal', 'Lisboa', 'Portugal');
insert into College (college_name, city, state, country) values ('Tay Nguyen University', 'Đống Đa', null, 'Vietnam');
insert into College (college_name, city, state, country) values ('Aarhus University', 'København', 'Region Hovedstaden', 'Denmark');

-- customer definitions
insert into Customer (id, last_name, first_name, budget, country, college_name) values (1, 'Meenehan', 'Reamonn', 10, 'Azerbaijan', 'King Mongkut''s University of Technology North Bangkok');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (2, 'Cornwell', 'Joyann', 43, 'Japan', 'Universidad de la República');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (3, 'Bergen', 'Magda', 92, 'China', 'Universitas Komputer Indonesia');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (4, 'Lonsdale', 'Patsy', 15, 'Russia', 'Music Academy "Fryderyk Chopin" in Warszaw');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (5, 'Caress', 'Kenneth', 2, 'South Africa', 'Dubna International University for Nature, Society and Man');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (6, 'Jagielski', 'Karee', 58, 'China', 'Embry Riddle Aeronautical University, Prescott');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (7, 'Kildahl', 'Eddy', 12, 'Poland', 'Coker College');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (8, 'Biddle', 'Coleman', 15, 'Russia', 'Universidad Regiomontana');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (9, 'Hofton', 'Benjy', 74, 'United States', 'Shanghai Lixin University of Commerce');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (10, 'Fosken', 'Ramon', 85, 'Thailand', 'Universitas Negeri Gorontalo');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (11, 'Kernoghan', 'Jorry', 11, 'Yemen', 'Kokand State Pedagogical Institute');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (12, 'Burkart', 'Rebeka', 67, 'Indonesia', 'Université de La Rochelle');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (13, 'Bulstrode', 'Phineas', 67, 'Brazil', 'Instituto Superior de Ciências do Trabalho e da Empresa');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (14, 'Aslett', 'Siffre', 45, 'Egypt', 'Universitas Brawijaya');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (15, 'Kagan', 'Dick', 2, 'Sweden', 'Central Luzon State University');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (16, 'Lawrinson', 'Larine', 44, 'Portugal', 'Ivanovo State Textile Academy');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (17, 'McNaughton', 'Auroora', 91, 'China', 'Ittihad Private University');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (18, 'Kipling', 'Dorri', 42, 'Indonesia', 'Universidade Lusiada');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (19, 'Hirsch', 'Chet', 26, 'China', 'Tay Nguyen University');
insert into Customer (id, last_name, first_name, budget, country, college_name) values (20, 'Dinsale', 'Corry', 88, 'China', 'Aarhus University');

-- brand definitions
insert into Brand (id, brand_name, country) values (1, 'MIT', 'Taiwan');
insert into Brand (id, brand_name, country) values (2, 'Sapporo Ichiban', 'United States');
insert into Brand (id, brand_name, country) values (3, 'Binh Tay', 'Vietnam');
insert into Brand (id, brand_name, country) values (4, 'Charming Couple', 'Taiwan');
insert into Brand (id, brand_name, country) values (5, 'immi', 'United States');
insert into Brand (id, brand_name, country) values (6, 'Nan Chuan Dao Sheng', 'China');
insert into Brand (id, brand_name, country) values (7, 'Naked', 'UK');
insert into Brand (id, brand_name, country) values (8, 'Mr. HOO', 'United States');
insert into Brand (id, brand_name, country) values (9, 'Red Chef', 'Malaysia');
insert into Brand (id, brand_name, country) values (10, 'J-Basket', 'United States');
insert into Brand (id, brand_name, country) values (11, 'Acecook', 'Japan');
insert into Brand (id, brand_name, country) values (12, 'Hi Lai Foods', 'Taiwan');
insert into Brand (id, brand_name, country) values (13, 'Nissin', 'Japan');
insert into Brand (id, brand_name, country) values (14, 'Myojo', 'Japan');
insert into Brand (id, brand_name, country) values (15, 'Best Wok', 'Indonesia');
insert into Brand (id, brand_name, country) values (16, 'Dara/Ciptarasa', 'Indonesia');
insert into Brand (id, brand_name, country) values (17, 'Vite Ramen', 'United States');
insert into Brand (id, brand_name, country) values (18, 'MAMA', 'Thailand');
insert into Brand (id, brand_name, country) values (19, 'iNoodle', 'Taiwan');
insert into Brand (id, brand_name, country) values (20, 'Nongshim', 'United States');

-- ramen details definitions
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (1, 2, 'pork', 'ramen', 114);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (2, 4, 'chicken', 'ramen', 155);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (3, 1, 'shoyu', 'rice noodles', 954);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (4, 1, 'miso', 'udon', 660);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (5, 4, 'shoyu', 'rice noodles', 301);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (6, 2, 'shio', 'udon', 915);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (7, 3, 'tonkotsu', 'udon', 128);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (8, 1, 'miso', 'udon', 1842);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (9, 4, 'shoyu', 'udon', 126);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (10, 4, 'shio', 'ramen', 189);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (11, 2, 'shoyu', 'rice noodles', 659);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (12, 3, 'miso', 'ramen', 606);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (13, 4, 'tonkotsu', 'udon', 1417);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (14, 5, 'tonkotsu', 'rice noodles', 1359);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (15, 5, 'shoyu', 'rice noodles', 56);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (16, 3, 'shio', 'udon', 1021);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (17, 5, 'tonkotsu', 'ramen', 1272);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (18, 4, 'miso', 'ramen', 269);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (19, 2, 'chicken', 'rice noodles', 1880);
insert into RamenDetails (details_id, spice_level, broth_type, noodle_type, sodium_level) values (20, 5, 'miso', 'rice noodles', 1918);

-- product definitions
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (1, 'Shallot Sauce Dry Noodle', 'Taiwan', 12.54, 'Pack', '3', 2, 3);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (2, 'Tonkotsu Ramen Japanese Style Noodles', 'United States', 7.88, 'Bowl', '4.5', 11, 2);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (3, 'Mi Kiwi', 'Vietnam', 13.5, 'Bowl', '3', 17, 20);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (4, 'Biang Biang Scallion Chicken Sauce', 'Taiwan', 28.89, 'Pack', '4.5', 14, 8);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (5, 'Tom Yum Shrimp Flavor Ramen Soup', 'United States', 5.36, 'Pack', '2.75', 17, 7);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (6, 'Wuhan Sesame Hot Sauce Konjac Rice Noodle', 'China', 13.1, 'Pack', '4.5', 10, 10);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (7, 'Chinese Style Orange Chicken Flavor', 'UK', 28.79, 'Pack', '3.75', 15, 18);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (8, 'Pokemon Noodle Salt & Seafood Flavor', 'Japan', 17.25, 'Cup', '2.75', 19, 2);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (9, 'Hae Bee Hiam Dried Noodles', 'Malaysia', 22.66, 'Pack', '5', 11, 18);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (10, 'Spicy Beef Flavor Ramen Soup', 'United States', 22.53, 'Pack', '3.75', 17, 11);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (11, 'Hello Kitty Kawaii Tonkotsu Noodle', 'Japan', 3.63, 'Cup', '3.75', 2, 18);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (12, 'Lai Noodle Vegan Sesame Paste Flavor', 'Taiwan', 17.78, 'Pack', '5', 7, 10);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (13, 'Menya Itto Ramen', 'Japan', 11.87, 'Bowl', '4.5', 5, 1);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (14, 'Bubuka Style Aburasoba 5th Level Spicy', 'Japan', 20.13, 'Tray', '2.5', 7, 15);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (15, 'Mi Goreng Black Pepper Seafood Flavor', 'Indonesia', 10.79, 'Pack', '5', 3, 17);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (16, 'Mi Goreng', 'Indonesia', 22.51, 'Pack', '5', 11, 1);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (17, 'Mi Goreng Original', 'Indonesia', 1.53, 'Pack', '5', 12, 2);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (18, 'Ayam Bawang', 'Indonesia', 15.08, 'Pack', '5', 19, 7);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (19, 'Mi Goreng Hot & Spicy', 'Indonesia', 26.3, 'Pack', '5', 16, 18);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (20, 'Tonkotsu Ramen With Kuromayu Black Garlic Oil', 'United States', 23.41, 'Bowl', '4', 12, 17);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (21, 'Vegan White Miso v1.3 Prototype', 'United States', 5.73, 'Pack', '3.75', 7, 6);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (22, 'Nomihosu Ippai Miso Butter Ramen', 'Japan', 6.44, 'Cup', '2.25', 18, 11);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (23, 'Cold Ramen - Soy Sauce Vinaigrette', 'United States', 25.51, 'Pack', '5', 1, 10);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (24, 'Sriracha Ramen Noodle Soup - Extra Spicy', 'United States', 28.01, 'Bowl', '3.75', 20, 12);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (25, 'Instant Noodles Artificial Beef Flavor', 'China', 14.95, 'Cup', '3.5', 9, 8);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (26, 'Chow Mein Teiyaki Chicken Chow Mein Noodles', 'United States', 19.12, 'Tray', '3.75', 20, 5);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (27, 'Garlic Pork Tonkotsu v1.3 Prototype', 'United States', 22.61, 'Pack', '5', 18, 15);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (28, 'Menzukuri Awase Miso', 'Japan', 10.82, 'Bowl', '3.25', 19, 20);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (29, 'Super Gattai Original Cup Noodle & Shio', 'Japan', 6.89, 'Cup', '3.75', 20, 1);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (30, 'Black Garlic Chicken Flavor Ramen Soup', 'United States', 29.38, 'Pack', '0.25', 14, 7);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (31, 'Wakame Soba Aojiso Dressing Flavor', 'Japan', 10.08, 'Cup', '3.5', 5, 7);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (32, 'Rice Noodle Soup Spicy Shrimp Flavor', 'United States', 5.99, 'Tray', '3.5', 11, 10);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (33, 'Roasted Soy Sauce Chicken v1.3 Prototype', 'United States', 11.58, 'Pack', '5', 9, 1);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (34, 'Rice Noodles Classic Flavor', 'China', 3.87, 'Box', '3.25', 10, 19);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (35, 'Charumera Donburi Kumamoto Ma-Yu Tonkotsu Ramen', 'Japan', 9.24, 'Bowl', '4', 15, 10);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (36, 'Premium/Myojo Ryu Shanghai Spicy Miso Ramen', 'Japan', 24.73, 'Bowl', '5', 19, 19);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (37, 'Fukuoka Hen Hakata Yaki Ramen', 'Japan', 26.81, 'Tray', '4.75', 5, 9);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (38, 'Shigoku No Ippai Koku Koebi Tensoba', 'Japan', 15.4, 'Cup', '3.5', 5, 13);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (39, 'Instant Rice Vermicelli Chicken & Abalone Flavor', 'Thailand', 14.52, 'Pack', '3.75', 1, 9);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (40, 'Small Soy Sauce Nyumen', 'Japan', 27.45, 'Bowl', '3.25', 6, 8);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (41, 'Artificial Peppered Beef Flavor', 'Taiwan', 7.67, 'Pack', '3.5', 16, 11);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (42, 'Germinated Brown Rice Ramen', 'Japan', 19.45, 'Pack', '5', 15, 6);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (43, 'Cup Nyumen Japanese Style Soup', 'Japan', 8.25, 'Bowl', '3.5', 17, 8);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (44, 'Shoyu Ramen', 'Japan', 15.04, 'Pack', '4.5', 18, 17);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (45, 'Cup Noodles Stir Fry Rice With Noodles Thai Yellow Curry Flavor', 'United States', 26.2, 'Cup', '5', 14, 15);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (46, 'Donbei Tori Paitan Udon', 'Japan', 17.76, 'Bowl', '4.75', 15, 15);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (47, 'Tonkotsu Irresistible Ramen', 'United States', 22.81, 'Cup', '4', 2, 19);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (48, 'Baby Star Pirikara Chicken Ramen', 'Japan', 16.12, 'Cup', '3', 5, 17);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (49, 'Flat Noodle Soy Sauce Flavor', 'Taiwan', 26.62, 'Pack', '3.25', 16, 4);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (50, 'Chongqing Style Noodles', 'China', 21.75, 'Cup', '4', 8, 19);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (51, 'Curry Seafood Fried Noodles', 'Malaysia', 16.86, 'Pack', '5', 19, 14);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (52, 'Kuroi Buta Curry Yakisoba', 'Japan', 28.51, 'Tray', '4.75', 5, 6);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (53, 'Rabokki Ganjang Stir Fried Noodles With Korean Style Teriyaki Sauce', 'South Korea', 11.98, 'Cup', '4.5', 10, 20);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (54, 'Smoky Garlic Irresistible Ramen', 'United States', 2.56, 'Cup', '0.25', 17, 2);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (55, 'Noodle With Scallion Sauce', 'United States', 24.12, 'Box', '3', 12, 18);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (56, 'Aji Yokatai Kagoshima Tonkotsu Ramen', 'Japan', 10.4, 'Bowl', '3.25', 5, 1);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (57, 'Hotter & Spicier Chili Ramen', 'United States', 10.04, 'Pack', '5', 7, 20);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (58, 'Tokyo Abura Soba', 'Japan', 3.54, 'Bowl', '5', 4, 8);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (59, 'Mi Kari Laksa Curry Laksa Noodle', 'Malaysia', 15.69, 'Pack', '5', 3, 1);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (60, 'Japanese Ramen - Spicy Sesame', 'United States', 10.2, 'Bowl', '3.75', 13, 12);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (61, 'Raoh Miso Flavor Ramen Noodle Soup', 'United States', 12.41, 'Pack', '4.5', 2, 13);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (62, 'Japanese Style Noodle Soup Curry Flavor', 'United States', 6.3, 'Bowl', '4.5', 2, 14);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (63, 'Mamak Fried Noodles', 'Malaysia', 15.9, 'Pack', '3.75', 17, 10);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (64, 'Kagoshima Kibinago & Soy Sauce Ramen', 'Japan', 27.4, 'Pack', '5', 15, 17);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (65, 'Nohara Hiroshi Addictive Bean Sprout Miso Ramen', 'Japan', 4.69, 'Cup', '3.75', 3, 4);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (66, 'Garlic Black Pepper Fried Noodles', 'Malaysia', 17.31, 'Pack', '5', 5, 20);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (67, 'Hell Curry Yakisoba', 'Japan', 16.57, 'Tray', '0.5', 1, 1);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (68, 'Yuzu Flavor Maru Uma Somen Noodle', 'Japan', 5.98, 'Cup', '0.5', 14, 10);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (69, 'Pot Burn Noodles Taiwanese Minced Pork Flavor', 'Taiwan', 12.11, 'Pack', '2.25', 15, 11);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (70, 'Ramen Noodlies', 'United States', 16.95, 'Pack', '5', 1, 2);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (71, 'Korean Spicy Chicken Mi Goreng', 'Indonesia', 10.19, 'Pack', '5', 16, 8);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (72, 'Chicken Shio Ramen', 'Japan', 28.91, 'Bowl', '5', 13, 13);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (73, 'Instant Noodles Chicken Flavour', 'China', 10.95, 'Bowl', '1', 9, 2);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (74, 'Charumera Cup Noodle - Aomori Stamina Sauce With Garlic & Sweet Soy Sauce', 'Japan', 27.31, 'Cup', '3', 7, 5);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (75, 'True Love Spicy Beef Noodles', 'Hong Kong', 26.33, 'Box', '5', 2, 16);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (76, 'Shrimp Tom Yum Flavor', 'Thailand', 5.88, 'Cup', '3.75', 19, 9);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (77, 'Gomoku Yasai Ramen', 'Japan', 8.15, 'Bowl', '1.5', 14, 11);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (78, 'Vegan White Miso v1.2', 'United States', 22.81, 'Pack', '4', 20, 11);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (79, 'Chickn Mami (Export)', 'Philippines', 17.83, 'Cup', '4', 14, 15);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (80, 'Cold Niku Udon', 'Japan', 2.16, 'Bowl', '3.5', 20, 13);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (81, 'Fly By Jing Sichuan Chili Edition v1.2', 'United States', 22.16, 'Pack', '5', 7, 4);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (82, 'Minimaru Somen', 'Japan', 21.87, 'Cup', '2.75', 5, 4);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (83, 'Instant Noodles', 'Japan', 25.49, 'Bowl', '3.75', 16, 14);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (84, 'First Love Beef Noodles', 'Hong Kong', 7.95, 'Box', '5', 5, 5);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (85, 'Selection Chanpon de Sky', 'Japan', 2.9, 'Cup', '4.5', 17, 16);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (86, 'Congee - Chicken Congee Rice Porridge', 'United States', 21.92, 'Cup', '5', 10, 3);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (87, 'Congee - Original Congee Rice Porridge', 'United States', 23.76, 'Cup', '5', 18, 3);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (88, 'Peanut Chili Irresistible Ramen', 'United States', 28.74, 'Cup', '5', 17, 18);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (89, 'Instant Lunch Select Chicken Flavor', 'United States', 23.32, 'Cup', '3.5', 17, 3);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (90, 'Devil Of Fire Buldak', 'South Korea', 17.11, 'Pack', '3.5', 3, 5);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (91, 'Spiciest Ramen In The World', 'South Korea', 11.6, 'Pack', '4', 9, 20);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (92, 'Tokyo Charumera Abura Soba', 'Japan', 14.57, 'Tray', '3', 13, 13);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (93, 'Mocchichi Chicken Salty Lemon Yakisoba', 'Japan', 26.05, 'Cup', '3.5', 15, 7);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (94, 'Green Tea Soba', 'Japan', 23.84, 'Pack', '3.75', 18, 16);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (95, 'Cup Noodle BIG Fried Chicken & Lemon', 'Japan', 11.13, 'Cup', '4', 14, 7);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (96, 'Nagasaki Champon - Creamy Tonkotsu', 'United States', 14.68, 'Pack', '5', 7, 9);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (97, 'Shoyu Ramen', 'Japan', 19.51, 'Box', '5', 16, 8);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (98, 'Miso Ramen', 'Japan', 13.48, 'Box', '5', 8, 18);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (99, 'Night Market Chow Mein - Soy Sauce Flavor', 'China', 7.38, 'Box', '3.5', 11, 2);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (100, 'Yakisoba - Original Sauce', 'United States', 19.46, 'Pack', '5', 13, 18);

-- competes definitions
insert into Competes (brand_id, competitor_id) values (8, 20);
insert into Competes (brand_id, competitor_id) values (7, 6);
insert into Competes (brand_id, competitor_id) values (7, 14);
insert into Competes (brand_id, competitor_id) values (14, 19);
insert into Competes (brand_id, competitor_id) values (4, 16);
insert into Competes (brand_id, competitor_id) values (8, 6);
insert into Competes (brand_id, competitor_id) values (17, 5);
insert into Competes (brand_id, competitor_id) values (9, 17);
insert into Competes (brand_id, competitor_id) values (20, 14);
insert into Competes (brand_id, competitor_id) values (13, 12);
insert into Competes (brand_id, competitor_id) values (14, 9);
insert into Competes (brand_id, competitor_id) values (16, 15);
insert into Competes (brand_id, competitor_id) values (18, 19);
insert into Competes (brand_id, competitor_id) values (11, 8);
insert into Competes (brand_id, competitor_id) values (3, 11);
insert into Competes (brand_id, competitor_id) values (7, 16);
insert into Competes (brand_id, competitor_id) values (15, 11);
insert into Competes (brand_id, competitor_id) values (18, 10);
insert into Competes (brand_id, competitor_id) values (11, 9);

-- critic definitions
insert into Critic (critic_id, last_name, first_name) values (1, 'Bienvenu', 'Omar');
insert into Critic (critic_id, last_name, first_name) values (2, 'Couper', 'Hollyanne');
insert into Critic (critic_id, last_name, first_name) values (3, 'Skermer', 'Lucian');
insert into Critic (critic_id, last_name, first_name) values (4, 'Mourbey', 'Vail');
insert into Critic (critic_id, last_name, first_name) values (5, 'Lembcke', 'Gilburt');
insert into Critic (critic_id, last_name, first_name) values (6, 'Dennant', 'Stevy');
insert into Critic (critic_id, last_name, first_name) values (7, 'Hussy', 'Ricki');
insert into Critic (critic_id, last_name, first_name) values (8, 'Warland', 'Tommie');
insert into Critic (critic_id, last_name, first_name) values (9, 'Tarte', 'Brucie');
insert into Critic (critic_id, last_name, first_name) values (10, 'Fowler', 'Roland');
insert into Critic (critic_id, last_name, first_name) values (11, 'Mebius', 'Flossi');
insert into Critic (critic_id, last_name, first_name) values (12, 'Fordy', 'Cornie');
insert into Critic (critic_id, last_name, first_name) values (13, 'Swayton', 'Madelle');
insert into Critic (critic_id, last_name, first_name) values (14, 'Spurge', 'Tatiania');
insert into Critic (critic_id, last_name, first_name) values (15, 'Glasner', 'Tonnie');
insert into Critic (critic_id, last_name, first_name) values (16, 'Thoumasson', 'Jerrilee');
insert into Critic (critic_id, last_name, first_name) values (17, 'Terbruggen', 'Lurlene');
insert into Critic (critic_id, last_name, first_name) values (18, 'Doel', 'Abram');
insert into Critic (critic_id, last_name, first_name) values (19, 'Nurden', 'Lynea');
insert into Critic (critic_id, last_name, first_name) values (20, 'Ellum', 'Iris');

-- critique definitions
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (1, 5, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Ruecker-Ortiz', 18, 16);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (2, 3, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'Koss LLC', 3, 3);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (3, 5, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Cassin-Klocko', 14, 7);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (4, 3, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Simonis-Marquardt', 15, 2);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (5, 5, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'Streich, Torp and Herzog', 13, 15);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (6, 5, 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Pollich-Johnson', 15, 11);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (7, 5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'Donnelly-Pollich', 3, 2);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (8, 4, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Prohaska Inc', 4, 5);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (9, 3, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Wisoky Group', 8, 10);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (10, 5, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'Stiedemann-Prohaska', 15, 7);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (11, 3, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Schmitt Inc', 20, 5);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (12, 2, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Terry and Sons', 20, 6);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (13, 3, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Volkman-Fahey', 16, 16);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (14, 3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'West, Gaylord and Altenwerth', 7, 9);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (15, 2, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Fadel-Harber', 2, 11);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (16, 4, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'Kihn-Witting', 5, 6);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (17, 2, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Legros, Bailey and Smith', 19, 2);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (18, 2, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'DuBuque Inc', 15, 6);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (19, 2, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'Abshire and Sons', 11, 14);
insert into Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) values (20, 1, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Effertz and Sons', 16, 18);

-- invoice definitions
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (1, '2022-08-27', '2022-04-11', 'Uruguay', 38.04);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (2, '2022-11-25', '2022-01-09', 'Yemen', 357.57);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (3, '2022-01-05', '2022-08-09', 'China', 44.52);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (4, '2022-07-26', '2022-10-09', 'Russia', 438.12);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (5, '2022-10-01', '2022-11-25', 'China', 298.35);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (6, '2022-09-19', '2022-03-07', 'Northern Mariana Islands', 383.58);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (7, '2021-12-29', '2022-07-09', 'Italy', 801.6);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (8, '2022-03-21', '2022-06-04', 'Sweden', 13.99);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (9, '2022-10-07', '2022-11-23', 'China', 515.52);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (10, '2022-05-12', '2022-05-28', 'Argentina', 177.52);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (11, '2022-05-19', '2022-02-25', 'Argentina', 254.5);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (12, '2022-07-17', '2021-12-23', 'North Korea', 29.68);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (13, '2022-09-12', '2022-07-28', 'United States', 832.01);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (14, '2021-12-29', '2022-03-07', 'France', 318.08);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (15, '2022-09-20', '2022-03-31', 'Philippines', 603.02);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (16, '2022-11-18', '2022-01-09', 'Egypt', 322.14);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (17, '2022-11-15', '2022-09-30', 'Brazil', 56.2);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (18, '2021-12-23', '2022-06-11', 'Brazil', 408.12);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (19, '2022-04-08', '2022-03-29', 'Philippines', 490.8);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (20, '2022-06-11', '2022-06-06', 'Saudi Arabia', 380.55);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (21, '2022-03-16', '2022-08-01', 'Brazil', 58.59);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (22, '2022-07-02', '2022-01-22', 'Palestinian Territory', 243.02);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (23, '2022-04-26', '2021-12-31', 'China', 61.08);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (24, '2022-03-27', '2021-12-21', 'South Africa', 426.06);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (25, '2022-10-31', '2022-11-02', 'Czech Republic', 40.3);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (26, '2022-06-11', '2021-12-22', 'Nigeria', 62.82);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (27, '2022-10-14', '2022-10-09', 'Japan', 860.7);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (28, '2022-03-03', '2021-12-23', 'Ivory Coast', 21.16);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (29, '2022-02-05', '2022-02-03', 'Brazil', 468.72);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (30, '2022-09-18', '2022-02-22', 'South Africa', 48.58);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (31, '2022-02-26', '2022-10-18', 'Russia', 532.75);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (32, '2022-07-06', '2022-06-11', 'Bosnia and Herzegovina', 22.8);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (33, '2022-04-28', '2022-02-24', 'Indonesia', 359.31);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (34, '2022-03-26', '2022-11-04', 'Cameroon', 301.56);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (35, '2022-02-01', '2022-04-18', 'Russia', 330.66);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (36, '2021-12-05', '2022-08-05', 'Syria', 31.2);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (37, '2021-12-26', '2022-06-18', 'Philippines', 159.2);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (38, '2022-09-30', '2022-05-01', 'Honduras', 409.26);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (39, '2021-12-26', '2022-10-11', 'Latvia', 634.8);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (40, '2022-11-14', '2022-10-31', 'Sweden', 344.1);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (41, '2022-03-29', '2022-01-15', 'Cyprus', 43.44);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (42, '2021-12-24', '2022-01-11', 'Sweden', 101.21);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (43, '2022-02-27', '2022-01-29', 'China', 47.76);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (44, '2022-01-20', '2022-02-25', 'China', 251.82);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (45, '2022-09-26', '2022-05-27', 'Cambodia', 325.91);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (46, '2021-12-31', '2022-02-16', 'Russia', 21.6);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (47, '2022-07-26', '2022-04-21', 'Russia', 761.1);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (48, '2022-02-21', '2022-10-13', 'Philippines', 21.48);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (49, '2022-10-05', '2022-11-17', 'Uzbekistan', 191.04);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (50, '2022-06-19', '2022-02-23', 'Philippines', 307.3);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (51, '2022-09-07', '2022-09-19', 'Colombia', 536.75);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (52, '2022-01-09', '2022-02-24', 'Indonesia', 61.52);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (53, '2022-06-21', '2022-08-01', 'Brazil', 831.14);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (54, '2022-06-28', '2022-10-29', 'Japan', 173.46);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (55, '2022-09-22', '2022-06-16', 'Poland', 543.18);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (56, '2022-07-11', '2022-04-06', 'Indonesia', 504.66);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (57, '2022-01-06', '2022-08-29', 'Mexico', 219.5);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (58, '2022-07-10', '2022-06-08', 'Peru', 463.03);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (59, '2022-10-30', '2022-03-09', 'China', 745.5);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (60, '2022-05-09', '2022-07-05', 'Russia', 345.3);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (61, '2022-11-05', '2022-09-04', 'Brazil', 35.16);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (62, '2022-09-08', '2022-03-17', 'Brazil', 794.02);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (63, '2022-11-21', '2022-05-12', 'France', 6.42);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (64, '2021-12-31', '2022-08-17', 'Israel', 210.96);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (65, '2022-11-04', '2022-06-29', 'Egypt', 96.46);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (66, '2022-02-25', '2022-06-26', 'Finland', 368.28);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (67, '2022-10-02', '2022-09-07', 'American Samoa', 490.8);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (68, '2021-12-30', '2022-02-20', 'Philippines', 11.67);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (69, '2022-07-27', '2022-04-08', 'Libya', 83.76);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (70, '2022-02-19', '2022-10-24', 'Philippines', 172.62);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (71, '2022-11-16', '2021-12-25', 'Indonesia', 537);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (72, '2022-03-25', '2022-08-01', 'Indonesia', 59.68);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (73, '2022-07-09', '2022-03-06', 'Democratic Republic of the Congo', 336.4);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (74, '2022-01-09', '2022-09-16', 'France', 383.32);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (75, '2022-03-18', '2022-02-06', 'Russia', 123.64);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (76, '2022-11-08', '2022-04-02', 'Russia', 299);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (77, '2022-10-27', '2022-10-11', 'China', 146.6);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (78, '2022-07-05', '2022-08-02', 'United States', 482.03);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (79, '2022-02-10', '2022-09-10', 'Uzbekistan', 869.1);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (80, '2022-08-03', '2022-08-10', 'China', 411.15);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (81, '2022-04-06', '2022-03-07', 'France', 61.38);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (82, '2022-05-05', '2022-06-22', 'Sweden', 391.5);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (83, '2022-05-23', '2022-10-21', 'Ukraine', 124.08);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (84, '2022-04-18', '2022-10-07', 'Indonesia', 408.96);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (85, '2021-12-12', '2022-02-26', 'Bulgaria', 304.33);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (86, '2022-07-21', '2022-10-31', 'France', 115.02);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (87, '2022-08-10', '2022-03-10', 'China', 690.6);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (88, '2022-11-08', '2022-07-03', 'Philippines', 1.07);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (89, '2022-05-07', '2022-03-16', 'Russia', 210);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (90, '2022-05-30', '2022-01-26', 'Portugal', 345.66);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (91, '2022-07-25', '2022-09-21', 'Russia', 337.5);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (92, '2022-08-20', '2022-06-09', 'Philippines', 40.72);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (93, '2022-09-27', '2022-10-11', 'Czech Republic', 622.63);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (94, '2022-06-03', '2022-11-18', 'Ukraine', 160.3);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (95, '2022-08-27', '2022-03-21', 'United States', 454.74);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (96, '2022-06-27', '2021-12-30', 'Madagascar', 504.66);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (97, '2022-01-29', '2022-02-25', 'Peru', 117.2);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (98, '2022-11-11', '2022-04-29', 'Philippines', 407.93);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (99, '2022-11-23', '2022-02-09', 'Brazil', 573.9);
insert into Invoice (invoice_id, date_bought, date_received, order_country, total) values (100, '2022-11-12', '2022-09-30', 'Philippines', 355.05);

-- invoice line definitions
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (1, 3, 1, 55, 12.68);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (2, 29, 2, 26, 12.33);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (3, 6, 3, 91, 7.42);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (4, 18, 4, 27, 24.34);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (5, 13, 5, 79, 22.95);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (6, 18, 6, 13, 21.31);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (7, 30, 7, 87, 26.72);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (8, 1, 8, 4, 13.99);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (9, 24, 9, 58, 21.48);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (10, 14, 10, 2, 12.68);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (11, 25, 11, 70, 10.18);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (12, 4, 12, 88, 7.42);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (13, 29, 13, 92, 28.69);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (14, 14, 14, 62, 22.72);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (15, 22, 15, 16, 27.41);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (16, 26, 16, 28, 12.39);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (17, 10, 17, 7, 5.62);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (18, 19, 18, 1, 21.48);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (19, 30, 19, 44, 16.36);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (20, 15, 20, 87, 25.37);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (21, 3, 21, 92, 19.53);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (22, 29, 22, 52, 8.38);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (23, 6, 23, 95, 10.18);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (24, 18, 24, 18, 23.67);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (25, 13, 25, 38, 3.1);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (26, 18, 26, 40, 3.49);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (27, 30, 27, 13, 28.69);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (28, 1, 28, 32, 21.16);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (29, 24, 29, 88, 19.53);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (30, 14, 30, 7, 3.47);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (31, 25, 31, 75, 21.31);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (32, 4, 32, 85, 5.7);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (33, 29, 33, 71, 12.39);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (34, 14, 34, 37, 21.54);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (35, 22, 35, 79, 15.03);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (36, 26, 36, 25, 1.2);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (37, 10, 37, 36, 15.92);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (38, 19, 38, 96, 21.54);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (39, 30, 39, 57, 21.16);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (40, 15, 40, 5, 22.94);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (41, 3, 41, 32, 14.48);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (42, 29, 42, 10, 3.49);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (43, 6, 43, 57, 7.96);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (44, 18, 44, 19, 13.99);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (45, 13, 45, 88, 25.07);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (46, 18, 46, 94, 1.2);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (47, 30, 47, 77, 25.37);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (48, 1, 48, 65, 21.48);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (49, 24, 49, 36, 7.96);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (50, 14, 50, 24, 21.95);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (51, 25, 51, 87, 21.47);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (52, 4, 52, 14, 15.38);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (53, 29, 53, 2, 28.66);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (54, 14, 54, 50, 12.39);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (55, 22, 55, 75, 24.69);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (56, 26, 56, 13, 19.41);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (57, 10, 57, 52, 21.95);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (58, 19, 58, 27, 24.37);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (59, 30, 59, 62, 24.85);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (60, 15, 60, 31, 23.02);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (61, 3, 61, 64, 11.72);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (62, 29, 62, 7, 27.38);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (63, 6, 63, 68, 1.07);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (64, 18, 64, 72, 11.72);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (65, 13, 65, 74, 7.42);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (66, 18, 66, 15, 20.46);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (67, 30, 67, 56, 16.36);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (68, 1, 68, 43, 11.67);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (69, 24, 69, 55, 3.49);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (70, 14, 70, 6, 12.33);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (71, 25, 71, 9, 21.48);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (72, 4, 72, 49, 14.92);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (73, 29, 73, 84, 11.6);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (74, 14, 74, 74, 27.38);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (75, 22, 75, 4, 5.62);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (76, 26, 76, 77, 11.5);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (77, 10, 77, 38, 14.66);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (78, 19, 78, 100, 25.37);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (79, 30, 79, 62, 28.97);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (80, 15, 80, 44, 27.41);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (81, 3, 81, 9, 20.46);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (82, 29, 82, 69, 13.5);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (83, 6, 83, 24, 20.68);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (84, 18, 84, 42, 22.72);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (85, 13, 85, 61, 23.41);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (86, 18, 86, 68, 6.39);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (87, 30, 87, 28, 23.02);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (88, 1, 88, 79, 1.07);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (89, 24, 89, 12, 8.75);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (90, 14, 90, 85, 24.69);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (91, 25, 91, 73, 13.5);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (92, 4, 92, 8, 10.18);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (93, 29, 93, 32, 21.47);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (94, 14, 94, 69, 11.45);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (95, 22, 95, 74, 20.67);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (96, 26, 96, 60, 19.41);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (97, 10, 97, 82, 11.72);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (98, 19, 98, 82, 21.47);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (99, 30, 99, 7, 19.13);
insert into InvoiceLine (invoice_line_id, quantity, invoice_id, ramen_id, unit_price) values (100, 15, 100, 10, 23.67);

-- already tried definitions
insert into AlreadyTried(customer_id, ramen_id) values (14,6);
insert into AlreadyTried(customer_id, ramen_id) values (1,16);
insert into AlreadyTried(customer_id, ramen_id) values (2,8);
insert into AlreadyTried(customer_id, ramen_id) values (19,2);
insert into AlreadyTried(customer_id, ramen_id) values (2,4);
insert into AlreadyTried(customer_id, ramen_id) values (14,16);
insert into AlreadyTried(customer_id, ramen_id) values (14,1);
insert into AlreadyTried(customer_id, ramen_id) values (1,9);
insert into AlreadyTried(customer_id, ramen_id) values (19,20);
insert into AlreadyTried(customer_id, ramen_id) values (11,19);
insert into AlreadyTried(customer_id, ramen_id) values (1,14);
insert into AlreadyTried(customer_id, ramen_id) values (17,9);
insert into AlreadyTried(customer_id, ramen_id) values (3,8);
insert into AlreadyTried(customer_id, ramen_id) values (4,18);
insert into AlreadyTried(customer_id, ramen_id) values (2,1);
insert into AlreadyTried(customer_id, ramen_id) values (20,11);
insert into AlreadyTried(customer_id, ramen_id) values (3,15);
insert into AlreadyTried(customer_id, ramen_id) values (2,12);
insert into AlreadyTried(customer_id, ramen_id) values (15,17);

-- cart definitions
insert into Cart(customer_id, ramen_id) values (10,1);
insert into Cart(customer_id, ramen_id) values (19,14);
insert into Cart(customer_id, ramen_id) values (11,7);
insert into Cart(customer_id, ramen_id) values (8,8);
insert into Cart(customer_id, ramen_id) values (1,14);
insert into Cart(customer_id, ramen_id) values (11,20);
insert into Cart(customer_id, ramen_id) values (2,16);
insert into Cart(customer_id, ramen_id) values (18,5);
insert into Cart(customer_id, ramen_id) values (12,18);
insert into Cart(customer_id, ramen_id) values (9,13);
insert into Cart(customer_id, ramen_id) values (11,6);
insert into Cart(customer_id, ramen_id) values (12,11);
insert into Cart(customer_id, ramen_id) values (16,13);
insert into Cart(customer_id, ramen_id) values (5,16);
insert into Cart(customer_id, ramen_id) values (2,3);
insert into Cart(customer_id, ramen_id) values (20,2);
insert into Cart(customer_id, ramen_id) values (13,15);
insert into Cart(customer_id, ramen_id) values (10,10);
insert into Cart(customer_id, ramen_id) values (14,17);
insert into Cart(customer_id, ramen_id) values (14,9);

-- favorites definition
insert into Favorites(customer_id, ramen_id) values (16,12);
insert into Favorites(customer_id, ramen_id) values (9,11);
insert into Favorites(customer_id, ramen_id) values (17,18);
insert into Favorites(customer_id, ramen_id) values (10,20);
insert into Favorites(customer_id, ramen_id) values (11,20);
insert into Favorites(customer_id, ramen_id) values (10,17);
insert into Favorites(customer_id, ramen_id) values (3,15);
insert into Favorites(customer_id, ramen_id) values (16,14);
insert into Favorites(customer_id, ramen_id) values (2,17);
insert into Favorites(customer_id, ramen_id) values (6,16);
insert into Favorites(customer_id, ramen_id) values (19,10);
insert into Favorites(customer_id, ramen_id) values (4,14);
insert into Favorites(customer_id, ramen_id) values (10,19);
insert into Favorites(customer_id, ramen_id) values (4,2);
insert into Favorites(customer_id, ramen_id) values (9,5);
insert into Favorites(customer_id, ramen_id) values (3,17);
insert into Favorites(customer_id, ramen_id) values (5,15);
insert into Favorites(customer_id, ramen_id) values (12,15);
insert into Favorites(customer_id, ramen_id) values (17,3);
insert into Favorites(customer_id, ramen_id) values (1,17);
insert into Favorites(customer_id, ramen_id) values (1,1);
insert into Favorites(customer_id, ramen_id) values (1,15);

-- wishlist definitions
insert into Wishlist(customer_id, ramen_id) values (15,7);
insert into Wishlist(customer_id, ramen_id) values (10,14);
insert into Wishlist(customer_id, ramen_id) values (10,2);
insert into Wishlist(customer_id, ramen_id) values (12,20);
insert into Wishlist(customer_id, ramen_id) values (9,4);
insert into Wishlist(customer_id, ramen_id) values (18,1);
insert into Wishlist(customer_id, ramen_id) values (18,2);
insert into Wishlist(customer_id, ramen_id) values (11,15);
insert into Wishlist(customer_id, ramen_id) values (2,11);
insert into Wishlist(customer_id, ramen_id) values (20,1);
insert into Wishlist(customer_id, ramen_id) values (9,20);
insert into Wishlist(customer_id, ramen_id) values (14,13);
insert into Wishlist(customer_id, ramen_id) values (5,20);
insert into Wishlist(customer_id, ramen_id) values (19,5);
insert into Wishlist(customer_id, ramen_id) values (18,16);
insert into Wishlist(customer_id, ramen_id) values (15,9);
insert into Wishlist(customer_id, ramen_id) values (6,3);
insert into Wishlist(customer_id, ramen_id) values (11,18);
insert into Wishlist(customer_id, ramen_id) values (13,8);
insert into Wishlist(customer_id, ramen_id) values (10,11);

-- frequently ordered definitions
insert into FrequentlyOrdered(customer_id, ramen_id) values (6,20);
insert into FrequentlyOrdered(customer_id, ramen_id) values (4,13);
insert into FrequentlyOrdered(customer_id, ramen_id) values (20,16);
insert into FrequentlyOrdered(customer_id, ramen_id) values (16,13);
insert into FrequentlyOrdered(customer_id, ramen_id) values (2,9);
insert into FrequentlyOrdered(customer_id, ramen_id) values (19,2);
insert into FrequentlyOrdered(customer_id, ramen_id) values (7,19);
insert into FrequentlyOrdered(customer_id, ramen_id) values (20,12);
insert into FrequentlyOrdered(customer_id, ramen_id) values (12,17);
insert into FrequentlyOrdered(customer_id, ramen_id) values (11,15);
insert into FrequentlyOrdered(customer_id, ramen_id) values (2,8);
insert into FrequentlyOrdered(customer_id, ramen_id) values (6,11);
insert into FrequentlyOrdered(customer_id, ramen_id) values (7,20);
insert into FrequentlyOrdered(customer_id, ramen_id) values (14,2);
insert into FrequentlyOrdered(customer_id, ramen_id) values (8,3);
insert into FrequentlyOrdered(customer_id, ramen_id) values (6,5);
insert into FrequentlyOrdered(customer_id, ramen_id) values (9,2);
insert into FrequentlyOrdered(customer_id, ramen_id) values (6,16);
insert into FrequentlyOrdered(customer_id, ramen_id) values (12,13);
insert into FrequentlyOrdered(customer_id, ramen_id) values (20,10);

-- preferrred definitions
insert into Preferred(customer_id, details_id) values (13,16);
insert into Preferred(customer_id, details_id) values (10,20);
insert into Preferred(customer_id, details_id) values (5,12);
insert into Preferred(customer_id, details_id) values (5,11);
insert into Preferred(customer_id, details_id) values (6,17);
insert into Preferred(customer_id, details_id) values (3,6);
insert into Preferred(customer_id, details_id) values (17,16);
insert into Preferred(customer_id, details_id) values (11,18);
insert into Preferred(customer_id, details_id) values (14,19);
insert into Preferred(customer_id, details_id) values (18,4);
insert into Preferred(customer_id, details_id) values (19,8);
insert into Preferred(customer_id, details_id) values (16,8);
insert into Preferred(customer_id, details_id) values (20,6);
insert into Preferred(customer_id, details_id) values (17,15);
insert into Preferred(customer_id, details_id) values (2,1);
insert into Preferred(customer_id, details_id) values (15,4);
insert into Preferred(customer_id, details_id) values (11,5);
insert into Preferred(customer_id, details_id) values (10,1);
insert into Preferred(customer_id, details_id) values (5,14);

