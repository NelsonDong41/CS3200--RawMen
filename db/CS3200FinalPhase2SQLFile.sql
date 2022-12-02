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

create table Customer (
	id VARCHAR(2) PRIMARY KEY NOT NULL,
	last_name VARCHAR(10),
	first_name VARCHAR(7),
	budget VARCHAR(2),
	country VARCHAR(50),
	college_name VARCHAR(58),
	FOREIGN KEY (college_name)
       REFERENCES College (college_name)
);

-- BRAND
create table Brand (
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(50),
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
	name VARCHAR(50),
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
	total DECIMAL(7,2),
  order_country VARCHAR(50)
);

-- INVOICE LINE
create table InvoiceLine (
	invoice_line_id INT NOT NULL,
	unit_price DECIMAL(4,2),
	quantity INT,
	invoice_id INT NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (invoice_line_id, invoice_id, ramen_id),
	FOREIGN KEY (invoice_id) REFERENCES Invoice (invoice_id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- ALREADY TRIED
create table AlreadyTried (
	customer_id VARCHAR(2) NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- CART
create table Cart (
	customer_id VARCHAR(2) NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- FAVORITES
create table Favorites (
	customer_id VARCHAR(2) NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- WISHLIST
create table Wishlist (
	customer_id VARCHAR(2) NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- FREQUENTLY ORDERED
create table FrequentlyOrdered (
	customer_id VARCHAR(2) NOT NULL,
	ramen_id INT NOT NULL,
	PRIMARY KEY (customer_id, ramen_id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (ramen_id) REFERENCES Product (ramen_id)
);

-- PREFERRED
create table Preferred (
	customer_id VARCHAR(2) NOT NULL,
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
insert into Brand (id, name, country) values (1, 'MIT', 'Taiwan');
insert into Brand (id, name, country) values (2, 'Sapporo Ichiban', 'United States');
insert into Brand (id, name, country) values (3, 'Binh Tay', 'Vietnam');
insert into Brand (id, name, country) values (4, 'Charming Couple', 'Taiwan');
insert into Brand (id, name, country) values (5, 'immi', 'United States');
insert into Brand (id, name, country) values (6, 'Nan Chuan Dao Sheng', 'China');
insert into Brand (id, name, country) values (7, 'Naked', 'UK');
insert into Brand (id, name, country) values (8, 'Sapporo Ichiban', 'Japan');
insert into Brand (id, name, country) values (9, 'Red Chef', 'Malaysia');
insert into Brand (id, name, country) values (10, 'immi', 'United States');
insert into Brand (id, name, country) values (11, 'Acecook', 'Japan');
insert into Brand (id, name, country) values (12, 'Hi Lai Foods', 'Taiwan');
insert into Brand (id, name, country) values (13, 'Nissin', 'Japan');
insert into Brand (id, name, country) values (14, 'Myojo', 'Japan');
insert into Brand (id, name, country) values (15, 'Best Wok', 'Indonesia');
insert into Brand (id, name, country) values (16, 'Dara/Ciptarasa', 'Indonesia');
insert into Brand (id, name, country) values (17, 'Best Wok', 'Indonesia');
insert into Brand (id, name, country) values (18, 'Dara/Ciptarasa', 'Indonesia');
insert into Brand (id, name, country) values (19, 'Best Wok', 'Indonesia');
insert into Brand (id, name, country) values (20, 'Nongshim', 'United States');

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
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (1, 'Shallot Sauce Dry Noodle', 'Taiwan', 22.42, 'Pack', '3', 1, 1);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (2, 'Tonkotsu Ramen Japanese Style Noodles', 'United States', 17.14, 'Bowl', '4.5', 2, 2);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (3, 'Mi Kiwi', 'Vietnam', 12.17, 'Bowl', '3', 3, 3);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (4, 'Biang Biang Scallion Chicken Sauce', 'Taiwan', 28.09, 'Pack', '4.5', 4, 4);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (5, 'Tom Yum Shrimp Flavor Ramen Soup', 'United States', 24.56, 'Pack', '2.75', 5, 5);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (6, 'Wuhan Sesame Hot Sauce Konjac Rice Noodle', 'China', 6.99, 'Pack', '4.5', 6, 6);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (7, 'Chinese Style Orange Chicken Flavor', 'UK', 13.47, 'Pack', '3.75', 7, 7);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (8, 'Pokemon Noodle Salt & Seafood Flavor', 'Japan', 9.84, 'Cup', '2.75', 8, 8);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (9, 'Hae Bee Hiam Dried Noodles', 'Malaysia', 25.62, 'Pack', '5', 9, 9);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (10, 'Spicy Beef Flavor Ramen Soup', 'United States', 2.69, 'Pack', '3.75', 10, 10);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (11, 'Hello Kitty Kawaii Tonkotsu Noodle', 'Japan', 19.49, 'Cup', '3.75', 11, 11);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (12, 'Lai Noodle Vegan Sesame Paste Flavor', 'Taiwan', 24.77, 'Pack', '5', 12, 12);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (13, 'Menya Itto Ramen', 'Japan', 7.88, 'Bowl', '4.5', 13, 13);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (14, 'Bubuka Style Aburasoba 5th Level Spicy', 'Japan', 14.13, 'Tray', '2.5', 14, 14);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (15, 'Mi Goreng Black Pepper Seafood Flavor', 'Indonesia', 21.98, 'Pack', '5', 15, 15);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (16, 'Mi Goreng', 'Indonesia', 12.9, 'Pack', '5', 16, 16);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (17, 'Mi Goreng Original', 'Indonesia', 8.12, 'Pack', '5', 17, 17);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (18, 'Ayam Bawang', 'Indonesia', 16.78, 'Pack', '5', 18, 18);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (19, 'Mi Goreng Hot & Spicy', 'Indonesia', 29.94, 'Pack', '5', 19, 19);
insert into Product (ramen_id, name, origin_country, price, style, rating, brand_id, details_id) values (20, 'Tonkotsu Ramen With Kuromayu Black Garlic Oil', 'United States', 3.15, 'Bowl', '4', 20, 20);

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
insert into Invoice (invoice_id, date_bought, date_received, total) values (1, '2022-06-11', '2022-12-12', 67.26);
insert into Invoice (invoice_id, date_bought, date_received, total) values (2, '2022-01-22', '2022-07-20', 497.06);
insert into Invoice (invoice_id, date_bought, date_received, total) values (3, '2022-09-17', '2022-09-25', 73.02);
insert into Invoice (invoice_id, date_bought, date_received, total) values (4, '2022-03-27', '2022-06-02', 505.62);
insert into Invoice (invoice_id, date_bought, date_received, total) values (5, '2022-05-13', '2022-07-29', 319.28);

-- invoice line definitions
insert into InvoiceLine (invoice_line_id, unit_price, quantity, invoice_id, ramen_id) values (1, 22.42, 3, 1, 1);
insert into InvoiceLine (invoice_line_id, unit_price, quantity, invoice_id, ramen_id) values (2, 17.14, 29, 2, 2);
insert into InvoiceLine (invoice_line_id, unit_price, quantity, invoice_id, ramen_id) values (3, 12.17, 6, 3, 3);
insert into InvoiceLine (invoice_line_id, unit_price, quantity, invoice_id, ramen_id) values (4, 28.09, 18, 4, 4);
insert into InvoiceLine (invoice_line_id, unit_price, quantity, invoice_id, ramen_id) values (5, 24.56, 13, 5, 5);

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

-- 
