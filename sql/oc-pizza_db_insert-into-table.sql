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
	tva100, 
	mesureunit, 
	stock, 
	compoundproduct_id_compoundproduct, 
	compoundproduct_orderline_id_orderline, 
	compoundproduct_orderline_product_id_product) 
VALUES 
	(1, 'base_tomate', 'TOMAT-6510790', '1234567890123', 'Base pizza tomate concentré', 0.50, 0.12, 0.012, 'L', 100, 1, 1, 1),
	(2, 'base_creme', 'CREME-6510790', '1234567890123', 'Base pizza crème', 0.50, 0.12, 0.012, 'L', 50, 1, 1, 1),
	(3, 'basilic', 'BASILIC-6510790', '1234567890123', 'Basilic frais', 0.50, 0.12, 0.012, 'g', 100, 1, 1, 1),
	(4, 'mozzarella', 'MOZZA-6510790', '1234567890123', 'Mozzarella B.', 0.50, 0.12, 0.012, 'g', 100, 1, 1, 1),
	(5, 'oeuf', 'OEUF-6510790', '1234567890123', 'Oeuf Calibre M', 0.50, 0.12, 0.012, 'unit', 100, 1, 1, 1),
	(6, 'champignon', 'CHAMP-6510790', '1234567890123', 'Base pizza tomate concentré', 0.50, 0.12, 0.012, 'g', 100, 1, 1, 1),
	(7, 'olives', 'OLIVE-6510790', '1234567890123', 'Base pizza tomate concentré', 0.50, 0.12, 0.012, 'g', 100, 1, 1, 1);

-- -----------------------------------------------------
-- Insert into table oc_pizza.compoundproduct
-- -----------------------------------------------------
INSERT INTO oc_pizza.compoundproduct (
	id_compoundproduct, 
	quantity, 
	name, 
	pvht, 
	orderline_id_orderline, 
	orderline_product_id_product) 
VALUES (1, 1, 'Pizza1', 13.71, 1, 1);

-- -----------------------------------------------------
-- Insert into table oc_pizza.orderline
-- -----------------------------------------------------
INSERT INTO oc_pizza.orderline (
	id_orderline, 
	product_quantity, 
	pvht, 
	order_line_status, 
	product_id_product, 
	order_id_order, 
	order_splitedorder_id_splitedorder, 
	order_orderline_id_orderline, 
	order_invoice_id_invoice, 
	order_delivery_id_delivery, 
	order_user_id_user, 
	order_user_pointofsale_id_pointofsale, 
	order_user_pointofsale_phonenumber_id_phonenumber, 
	order_user_pointofsale_address_id_address, 
	order_user_pointofsale_openinghours_id_openinghours, 
	compoundproduct_id_compoundproduct, 
	compoundproduct_orderline_id_orderline, 
	compoundproduct_orderline_product_id_product) 
VALUES (1, 1, 12.45, 'En cours de Préparation', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
	
-- -----------------------------------------------------
-- Insert into table oc_pizza.user_userrole
-- -----------------------------------------------------
INSERT INTO oc_pizza.user_userrole (
	user_id_user, 
	user_pointofsale_id_pointofsale, 
	user_pointofsale_phonenumber_id_phonenumber, 
	user_pointofsale_address_id_address, 
	user_pointofsale_openinghours_id_openinghours, 
	userrole_id_userrole, 
	typedecontrat, 
	start_date, 
	end_date) 
VALUES (1, 1, 1, 1, 1, 1, 'CDI', date_format('2019-01-01', "%Y-%m-%d"), NULL);