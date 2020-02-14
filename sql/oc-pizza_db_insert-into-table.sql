-- -----------------------------------------------------
-- Insert into table oc_pizza.address (PK id serial auto-increment)
-- -----------------------------------------------------
INSERT INTO oc_pizza.address (
	id_address,
	type,
	street_number,
	street_name,
	postcode,
	city,
	country,
	address_supplement) 
VALUES 
	(1,'Point de Vente', 1, 'rue du PDV1', 75000, 'Ville1', 'PAYS', 'Complément addresse du PDV1'),
	(2,'Point de Vente', 2, 'rue du PDV2', 69000, 'Ville2', 'PAYS', 'Complément addresse du PDV2'),
	(3,'Point de Vente', 3, 'rue du PDV3', 33000, 'Ville3', 'PAYS', 'Complément addresse du PDV3'),
	(4,'Client', 1, 'rue du client 1', 75000, 'VilleClient1', 'PAYS', 'Complément addresse du client 1'),
	(5,'Client', 2, 'rue du client 2', 69000, 'VilleClient2', 'PAYS', 'Complément addresse du client 2'),
	(6,'Client', 3, 'rue du client 3', 33000, 'VilleClient3', 'PAYS', 'Complément addresse du client 3'),
	(7,'Employe', 4, 'rue du Employe 1', 75001, 'VilleEmploye1', 'PAYS', 'Complément addresse Employe 1'),
	(8,'Employe', 5, 'rue du Employe 2', 69002, 'VilleEmploye2', 'PAYS', 'Complément addresse Employe 2'),
	(9,'Employe', 6, 'rue du Employe 3', 33003, 'VilleEmploye3', 'PAYS', 'Complément addresse Employe 3');
  
-- -----------------------------------------------------
-- Insert into table oc_pizza.pointofsale (PK id serial auto-increment)
-- -----------------------------------------------------
INSERT INTO oc_pizza.pointofsale (
	id_pointofsale,
	name,
	opening_date, 
	closing_date, 
	store_manager,
	phonenumber,
	address_id_address)
VALUES 
	(1,'Nom du PDV1', date_format('2018-09-24', "%Y-%m-%d"), NULL, 'Manager John Doe du PDV1', '+33 3 00 00 00 01', 1),
	(2,'Nom du PDV2', date_format('2016-09-14', "%Y-%m-%d"), NULL, 'Manager Jane Doe du PDV2', '+33 3 00 00 00 02', 2),
	(3,'Nom du PDV2', date_format('2014-09-01', "%Y-%m-%d"), NULL, 'Manager Justin Doe du PDV3', '+33 3 00 00 00 03', 3);

-- -----------------------------------------------------
-- Insert into table oc_pizza.user (PK id serial auto-increment)
-- -----------------------------------------------------
INSERT INTO oc_pizza.user (
	id_user, 
	civility, 
	name, 
	lastname, 
	login, 
	encrypted_password, 
	email,
	phone_number,
	pointofsale_id_pointofsale) 
VALUES 
	(1,'Mr', 'NomUser1', 'PrénomUser1', 'LoginUser1', 'P@SsW0rD_3|VcryPT3|)_User1', 'user1@null.fr', '+33 6 00 00 00 01', 1),
	(2,'Mrs', 'NomUser2', 'PrénomUser2', 'LoginUser2', 'P@SsW0rD_3|VcryPT3|)_User2', 'user2@null.fr', '+33 6 00 00 00 02', 2),
	(3,'Mr', 'NomUser3', 'PrénomUser3', 'LoginUser3', 'P@SsW0rD_3|VcryPT3|)_User3', 'user3@null.fr', '+33 6 00 00 00 03', 3),
	(4,'Mr', 'NomUser-Employe4', 'PrénomUser-Employe4', 'LoginUser-Employe4', 'P@SsW0rD_3|VcryPT3|)_User-Employe4', 'user4@null.fr', '+33 6 00 00 00 04', 1),
	(5,'Mrs', 'NomUser-Employe5', 'PrénomUser-Employe5', 'LoginUser-Employe5', 'P@SsW0rD_3|VcryPT3|)_User-Employe5', 'user5@null.fr', '+33 6 00 00 00 05', 2),
	(6,'Mr', 'NomUser-Employe6', 'PrénomUser-Employe6', 'LoginUser-Employe6', 'P@SsW0rD_3|VcryPT3|)_User-Employe6', 'user6@null.fr', '+33 6 00 00 00 06', 3);

-- -----------------------------------------------------
-- Insert into table oc_pizza.user_address
-- -----------------------------------------------------
INSERT INTO oc_pizza.user_address (
	user_id_user, 
	address_id_address) 
VALUES 
	(1, 4),
	(2, 5),
	(3, 6),
	(4, 7),
	(5, 8),
	(6, 9);

-- -----------------------------------------------------
-- Insert into table oc_pizza.userrole
-- -----------------------------------------------------
INSERT INTO oc_pizza.userrole (
	id_userrole, 
	role_name) 
VALUES 
	(1, 'Client'),
	(2, 'Employé'),
	(3, 'Gérant');

-- -----------------------------------------------------
-- Insert into table oc_pizza.user_userrole
-- -----------------------------------------------------
INSERT INTO oc_pizza.user_userrole (
	user_id_user,
	typedecontrat,
	start_date,
	end_date,
	userrole_id_userrole)
VALUES 
	(1, NULL, NULL, NULL, 1),
	(2, NULL, NULL, NULL, 1),
	(3, NULL, NULL, NULL, 1),
	(4, 'CDI', date_format('2016-01-01', "%Y-%m-%d"), NULL, 2),
	(5, 'CDI', date_format('2018-03-24', "%Y-%m-%d"), NULL, 2),
	(6, 'CDD', date_format('2019-09-30', "%Y-%m-%d"), date_format('2020-09-30', "%Y-%m-%d"), 2);
  
-- -----------------------------------------------------
-- Insert into table oc_pizza.openinghours
-- -----------------------------------------------------
INSERT INTO oc_pizza.openinghours (
	id_openinghours, 
	day, 
	lunchtime_opening, 
	lunchtime_closing, 
	evening_opening, 
	envening_closong) 
VALUES 
	(1,'Lundi', '11:30', '13:30', '19:00', '21:30'),
	(2,'Mardi', '11:30', '13:30', '19:00', '21:30'),
	(3,'Mercredi', '11:30', '13:30', '19:00', '21:30'),
	(4,'Jeudi', '11:30', '13:30', '19:00', '21:30'),
	(5,'Vendredi', '11:30', '13:30', '19:00', '21:30'),
	(6,'Samedi', '12:00', '14:30', '18:30', '22:30'),
	(7,'Dimanche', '12:00', '14:30', '18:30', '22:30'),
	(8,'Lundi', '12:00', '13:30', '19:30', '21:00'),
	(9,'Mardi', '12:00', '13:30', '19:30', '21:00'),
	(10,'Mercredi', '12:00', '13:30', '19:30', '21:00'),
	(11,'Jeudi', '12:00', '13:30', '19:30', '21:00'),
	(12,'Vendredi', '12:00', '13:30', '19:30', '21:00'),
	(13,'Samedi', null, null, null, null),
	(14,'Dimanche', null, null, null, null);
  
-- -----------------------------------------------------
-- Insert into table oc_pizza.pointofsale_has_openinghours
-- -----------------------------------------------------
INSERT INTO oc_pizza.pointofsale_has_openinghours (
	pointofsale_id_pointofsale, 
	openinghours_id_openinghours) 
VALUES 
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 4),
	(2, 5),
	(2, 13),
	(2, 14),
	(3, 8),
	(3, 9),
	(3, 10),
	(3, 11),
	(3, 12),
	(3, 13),
	(3, 14);
	
-- -----------------------------------------------------
-- Insert into table oc_pizza.product
-- -----------------------------------------------------
INSERT INTO oc_pizza.product (
	id_product, 
	internal_reference, 
	sku, 
	ean13, 
	name, 
	pvht, 
	paht, 
	tva100) 
VALUES 
	(1, 'base_tomate', 'TOMAT-6510790', '1234567890123', 'Base pizza tomate concentré', 0.50, 0.12, 5.5),
	(2, 'base_creme', 'CREME-6510790', '1234567890123', 'Base pizza crème', 0.50, 0.12, 5.5),
	(3, 'basilic', 'BASILIC-6510790', '1234567890123', 'Basilic frais', 0.50, 0.12, 5.5),
	(4, 'mozzarella', 'MOZZA-6510790', '1234567890123', 'Mozzarella B.', 0.50, 0.12, 5.5),
	(5, 'oeuf', 'OEUF-6510790', '1234567890123', 'Oeuf Calibre M', 0.50, 0.12, 5.5),
	(6, 'champignon', 'CHAMP-6510790', '1234567890123', 'Champignons de Paris', 0.50, 0.12, 5.5),
	(7, 'olives', 'OLIVE-6510790', '1234567890123', 'Olives noire dénoyautées', 0.50, 0.12, 5.5),
	(8, 'jus_orange', 'JDF_Orange-6510790', '1234567890123', 'Jus orange (briquette de 25cl)', 2.50, 0.80, 5.5);

-- -----------------------------------------------------
-- Insert into table oc_pizza.compoundproduct
-- -----------------------------------------------------
INSERT INTO oc_pizza.compoundproduct (
	id_compoundproduct, 
	name, 
	pvht) 
VALUES 
	(1, 'Pizza1', 9.45),
	(2, 'Pizza2', 11.15);

-- -----------------------------------------------------
-- Insert into table oc_pizza.compoundproduct_has_product
-- -----------------------------------------------------
INSERT INTO oc_pizza.compoundproduct_has_product (
	compoundproduct_id_compoundproduct,
	product_id_product,
	quantity)
VALUES
	(1, 1, 0.125),
	(1, 4, 5),
	(1, 5, 1),
	(1, 6, 5),
	(1, 7, 5),
	(2, 2, 0.125),
	(2, 4, 5),
	(2, 5, 1),
	(2, 6, 7),
	(2, 7, 5);

-- -----------------------------------------------------
-- Insert into table oc_pizza.stock
-- -----------------------------------------------------
INSERT INTO oc_pizza.stock (
	id_stock,
	pointofsale_id_pointofsale,
	product_id_product,
	mesureunit,
	stock)
VALUES 
	(1, 1, 1, 'L', 100),
	(2, 1, 2, 'L', 50),
	(3, 1, 3, 'g', 100),
	(4, 1, 4, 'g', 150),
	(5, 1, 5, 'unit', 40),
	(6, 1, 6, 'g', 400),
	(7, 1, 7, 'g', 100),
	(8, 1, 8, 'unit', 50),
	(9, 2, 1, 'L', 89),
	(10, 2, 2, 'L', 112),
	(11, 2, 3, 'g', 50),
	(12, 2, 4, 'g', 62),
	(13, 2, 5, 'unit', 25),
	(14, 2, 6, 'g', 250),
	(15, 2, 7, 'g', 300),
	(16, 2, 8, 'unit', 42),
	(17, 3, 1, 'L', 67),
	(18, 3, 2, 'L', 42),
	(19, 3, 3, 'g', 250),
	(20, 3, 4, 'g', 40),
	(21, 3, 5, 'unit', 15),
	(22, 3, 6, 'g', 325),
	(23, 3, 7, 'g', 150),
	(24, 3, 8, 'unit', 12);

-- -----------------------------------------------------
-- Insert into table oc_pizza.order
-- -----------------------------------------------------
INSERT INTO oc_pizza.order (
	id_order, 
	invoice_id_invoice, 
	delivery_id_delivery,
	user_id_user,
	user_pointofsale_id_pointofsale)
VALUES 
	(1, 1, 1, 1, 1),
	(2, 2, 2, 2, 2),
	(3, 3, 3, 3, 3),
	(4, 4, 4, 1, 1),
	(5, 5, 5, 2, 2),
	(6, 6, 6, 3, 3);

-- -----------------------------------------------------
-- Insert into table oc_pizza.orderline
-- -----------------------------------------------------
INSERT INTO oc_pizza.orderline (
	id_orderline, 
	product_quantity, 
	order_line_status, 
	product_id_product,
	compoundproduct_id_compoundproduct) 
VALUES 
	(1, 1, 'En cours de Préparation', null, 1),
	(2, 1, 'En cours de Préparation', 8, null),
	(3, 1, 'Annulation', null, 2),
	(4, 1, 'Annulation', 8, null),
	(5, 1, 'En cours de Préparation', null, 1),
	(6, 1, 'En cours de Préparation', 8, null),
	(7, 1, 'En cours de Préparation', null, 1),
	(8, 1, 'En cours de Préparation', 8, null),
	(9, 1, 'En cours de Préparation', null, 1),
	(10, 1, 'En cours de Préparation', 8, null),
	(11, 1, 'En cours de Préparation', null, 2);

-- -----------------------------------------------------
-- Insert into table oc_pizza.order_has_orderline
-- -----------------------------------------------------
INSERT INTO oc_pizza.order_has_orderline (
	order_id_order, 
	orderline_id_orderline)
VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 5),
	(3, 6),
	(4, 7),
	(4, 8),
	(5, 9),
	(5, 10),
	(6, 11);

-- -----------------------------------------------------
-- Insert into table oc_pizza.invoice
-- -----------------------------------------------------
INSERT INTO oc_pizza.invoice (
	id_invoice, 
	transaction_method, 
	transaction_status, 
	transaction_reference, 
	transaction_date, 
	amount) 
VALUES 
	(1,'CB', 'Validated', '00200000614C', date_format('2020-01-20', "%Y-%m-%d"), 14.95),
	(2,'CB', 'Aborted', 'NULL', date_format('2020-01-21', "%Y-%m-%d"), 0.00),
	(3,'Ticket Restaurant', 'Validated', 'CAISSE_PDV1-TRANSAC1B256225599TR', date_format('2019-12-20', "%Y-%m-%d"), 21.00),
	(4,'Espèce', 'Validated', 'CAISSE_PDV1-TRANSAC1B256225599ESP', date_format('2019-12-20', "%Y-%m-%d"), 37.50),
	(5,'CB', 'Validated', '00200000615C', date_format('2019-12-18', "%Y-%m-%d"), 11.00),
	(6,'CB', 'Validated', '00200000616C', date_format('2019-12-15', "%Y-%m-%d"), 14.95);
  
-- -----------------------------------------------------
-- Insert into table oc_pizza.delivery
-- -----------------------------------------------------
INSERT INTO oc_pizza.delivery (
	id_delivery, 
	date, 
	status) 
VALUES 
	(1, date_format('2020-01-20', "%Y-%m-%d"), 'Delivered'),
	(2, date_format('2019-12-20', "%Y-%m-%d"), 'Aborted'),
	(3, date_format('2019-12-20', "%Y-%m-%d"), 'Delivered'),
	(4, date_format('2019-12-18', "%Y-%m-%d"), 'Delivered'),
	(5, date_format('2019-12-18', "%Y-%m-%d"), 'Delivered'),
	(6, date_format('2019-12-18', "%Y-%m-%d"), 'In Progress');

-- -----------------------------------------------------
-- Create view list_point_of_sales
-- -----------------------------------------------------
CREATE OR REPLACE VIEW list_point_of_sales AS
SELECT
	pointofsale.name AS 'Nom du PDV',
	pointofsale.store_manager AS 'Manager du PDV',
	address.street_number AS 'N°',
	address.street_name AS 'Rue',
	address.postcode AS 'Code Postale',
	address.city AS 'Ville'
FROM 
	oc_pizza.pointofsale pointofsale,
	oc_pizza.address address
WHERE
	pointofsale.address_id_address = address.id_address;

-- -----------------------------------------------------
-- Create view list_users (use the commented 'where' clause to list customer only)
-- -----------------------------------------------------
CREATE OR REPLACE VIEW list_users AS
SELECT
	u.id_user AS 'ID Client',
	u.civility AS 'Civ.',
	u.name AS 'Nom',
	u.lastname AS 'Prénom',
	u.email AS 'e-Mail',
	address.type AS 'Type adresse',
	address.street_number AS 'N°',
	address.street_name AS 'Rue',
	address.postcode AS 'Code Postale',
	address.city AS 'Ville'
FROM 
	oc_pizza.user u
LEFT OUTER JOIN oc_pizza.user_address user_address
	ON user_address.user_id_user = u.id_user 
LEFT OUTER JOIN oc_pizza.address address
	ON user_address.address_id_address = address.id_address;
-- WHERE
-- 	address.TYPE = 'Client';

-- -----------------------------------------------------
-- Create view list_orders 
-- -----------------------------------------------------
CREATE OR REPLACE VIEW list_orders AS
SELECT 
	o.id_order AS 'ID Commande',
	invoice.id_invoice AS 'ID Facture',
	u.name AS 'Nom',
	u.lastname AS 'Prénom',
	delivery.date AS 'Date de livraison',
	delivery.status AS 'Etat Livraison',
	count(orderline.id_orderline) AS 'Nb ligne cmd',
	invoice.amount AS 'Total facturé'
FROM oc_pizza.order o
INNER JOIN oc_pizza.invoice invoice 
	ON invoice.id_invoice = o.invoice_id_invoice 
INNER JOIN oc_pizza.user u 
	ON u.id_user = o.user_id_user
INNER JOIN oc_pizza.delivery delivery 
	ON delivery.id_delivery = o.delivery_id_delivery
LEFT OUTER JOIN oc_pizza.order_has_orderline order_orderline
	ON  order_orderline.order_id_order = o.id_order 
LEFT OUTER JOIN oc_pizza.orderline orderline
	ON orderline.id_orderline = order_orderline.orderline_id_orderline
GROUP BY o.id_order;

-- -----------------------------------------------------
-- Display Recipes (exemple)
-- -----------------------------------------------------
SELECT 
	compoundproduct.name AS 'Nom',
	p.id_product AS 'ID Product',
	p.sku AS 'Ref Frs',
	p.internal_reference AS 'Ref OCP',
	CONCAT(produt.quantity, ' ',stock.mesureunit)  AS 'Quantité',
	p.name AS 'Libellé',
	stock.stock AS 'Stock PDV',
	stock.mesureunit AS 'Unit',
	pointofsale.name AS 'Point de Vente',
	stock.stock >= produt.quantity AS 'Dispo'
FROM oc_pizza.product p
LEFT OUTER JOIN oc_pizza.compoundproduct_has_product produt
	ON  produt.product_id_product = p.id_product 
LEFT OUTER JOIN oc_pizza.compoundproduct compoundproduct
	ON compoundproduct.id_compoundproduct = produt.compoundproduct_id_compoundproduct
LEFT OUTER JOIN oc_pizza.stock stock
	ON stock.product_id_product = p.id_product 
LEFT OUTER JOIN oc_pizza.pointofsale pointofsale 
	ON pointofsale.id_pointofsale = stock.pointofsale_id_pointofsale 
WHERE
	compoundproduct.id_compoundproduct = '1' AND stock.pointofsale_id_pointofsale = '2';

