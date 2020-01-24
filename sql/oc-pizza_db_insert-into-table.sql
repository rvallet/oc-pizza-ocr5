-- -----------------------------------------------------
-- Insert into table oc_pizza.phonenumber (PK id serial auto-increment)
-- -----------------------------------------------------
INSERT INTO oc_pizza.user_phonenumber (
	user_id_user,
	phonenumber_id_phonenumber) 
VALUES (NULL, NULL);
  
-- -----------------------------------------------------
-- Insert into table oc_pizza.address (PK id serial auto-increment)
-- -----------------------------------------------------
INSERT INTO oc_pizza.address (
-- 	id_address,
	type,
	street_number,
	street_name,
	postcode,
	city,
	country,
	address_supplement) 
VALUES 
	('Point de Vente', 1, 'rue du PDV1', 75000, 'Ville1', 'PAYS', 'Complément addresse du PDV1'),
	('Point de Vente', 2, 'rue du PDV2', 69000, 'Ville2', 'PAYS', 'Complément addresse du PDV2'),
	('Point de Vente', 3, 'rue du PDV3', 33000, 'Ville3', 'PAYS', 'Complément addresse du PDV3'),
	('Client', 1, 'rue du client 1', 75000, 'VilleClient1', 'PAYS', 'Complément addresse du client 1'),
	('Client', 2, 'rue du client 2', 69000, 'VilleClient2', 'PAYS', 'Complément addresse du client 2'),
	('Client', 3, 'rue du client 3', 33000, 'VilleClient3', 'PAYS', 'Complément addresse du client 3');
  
-- -----------------------------------------------------
-- Insert into table oc_pizza.pointofsale (PK id serial auto-increment)
-- -----------------------------------------------------
INSERT INTO oc_pizza.pointofsale (
-- 	id_pointofsale,
	name,
	opening_date, 
	closing_date, 
	store_manager, 
	phonenumber_id_phonenumber, 
	address_id_address, 
	openinghours_id_openinghours) 
VALUES 
	('Nom du PDV1', date_format('2018-09-24', "%Y-%m-%d"), NULL, 'Manager John Doe du PDV1', 1, 1, 1),
	('Nom du PDV2', date_format('2016-09-14', "%Y-%m-%d"), NULL, 'Manager Jane Doe du PDV2', 2, 2, 2),
	('Nom du PDV2', date_format('2014-09-01', "%Y-%m-%d"), NULL, 'Manager Justin Doe du PDV3', 3, 3, 3);

-- -----------------------------------------------------
-- Insert into table oc_pizza.user
-- -----------------------------------------------------
INSERT INTO oc_pizza.user (
-- 	id_user, 
	civility, 
	name, 
	lastname, 
	login, 
	encrypted_password, 
	email, 
	pointofsale_id_pointofsale, 
	pointofsale_phonenumber_id_phonenumber, 
	pointofsale_address_id_address, 
	pointofsale_openinghours_id_openinghours) 
VALUES 
	('Mr', 'NomUser1', 'PrénomUser1', 'LoginUser1', 'P@SsW0rD_3|VcryPT3|)_User1', 'user1@null.fr', 1, 1, 1, 1),
	('Mrs', 'NomUser2', 'PrénomUser2', 'LoginUser2', 'P@SsW0rD_3|VcryPT3|)_User2', 'user1@null.fr', 1, 1, 1, 1),
	('Mr', 'NomUser3', 'PrénomUser3', 'LoginUser3', 'P@SsW0rD_3|VcryPT3|)_User3', 'user1@null.fr', 1, 1, 1, 1);
-- -----------------------------------------------------
-- Insert into table oc_pizza.user_address
-- -----------------------------------------------------
INSERT INTO oc_pizza.user_address (
	user_id_user, 
	address_id_address) 
VALUES (NULL, NULL);
	
-- -----------------------------------------------------
-- Insert into table oc_pizza.user_phonenumber
-- -----------------------------------------------------
INSERT INTO oc_pizza.user_phonenumber (
	user_id_user, 
	phonenumber_id_phonenumber)
VALUES (NULL, NULL);
	
-- -----------------------------------------------------
-- Insert into table oc_pizza.userrole
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
VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

  
-- -----------------------------------------------------
-- Insert into table oc_pizza.openinghours
-- -----------------------------------------------------
INSERT INTO oc_pizza.openinghours (
-- 	id_openinghours, 
	day, 
	lunchtime_opening, 
	lunchtime_closing, 
	evening_opening, 
	envening_closong) 
VALUES 
	('Lundi', '11:30', '13:30', '19:00', '21:30'),
	('Mardi', '11:30', '13:30', '19:00', '21:30'),
	('Mercredi', '11:30', '13:30', '19:00', '21:30'),
	('Jeudi', '11:30', '13:30', '19:00', '21:30'),
	('Vendredi', '11:30', '13:30', '19:00', '21:30'),
	('Samedi', '12:00', '14:30', '18:30', '22:30'),
	('Dimanche', '12:00', '14:30', '18:30', '22:30');
  
-- -----------------------------------------------------
-- Insert into table oc_pizza.invoice
-- -----------------------------------------------------
INSERT INTO oc_pizza.invoice (
-- 	id_invoice, 
	transaction_method, 
	transaction_status, 
	transaction_reference, 
	transaction_date, 
	amount) 
VALUES 
	('CB', 'Validated', '00200000614C', date_format('2020-01-20', "%Y-%m-%d"), 14.95),
	('CB', 'Aborted', 'NULL', date_format('2020-01-21', "%Y-%m-%d"), 0.00),
	('Ticket Restaurant', 'Validated', 'CAISSE_PDV1-TRANSAC1B256225599TR', date_format('2019-12-20', "%Y-%m-%d"), 21.00),
	('Espèce', 'Validated', 'CAISSE_PDV1-TRANSAC1B256225599ESP', date_format('2019-12-20', "%Y-%m-%d"), 37.50),
	('CB', 'Validated', '00200000615C', date_format('2019-12-18', "%Y-%m-%d"), 11.00),
	('CB', 'Validated', '00200000616C', date_format('2019-12-15', "%Y-%m-%d"), 14.95);
  
-- -----------------------------------------------------
-- Insert into table oc_pizza.delivery
-- -----------------------------------------------------
INSERT INTO oc_pizza.delivery (
	id_delivery, 
	date, 
	status) 
VALUES (NULL, NULL, NULL);
  
-- -----------------------------------------------------
-- Insert into table oc_pizza.order
-- -----------------------------------------------------
INSERT INTO oc_pizza.order (
	id_order, 
	splitedorder_id_splitedorder, 
	orderline_id_orderline, 
	invoice_id_invoice, 
	delivery_id_delivery, 
	user_id_user, 
	user_pointofsale_id_pointofsale, 
	user_pointofsale_phonenumber_id_phonenumber, 
	user_pointofsale_address_id_address, 
	user_pointofsale_openinghours_id_openinghours) 
VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
	
-- -----------------------------------------------------
-- Insert into table oc_pizza.pointofsale_openinghours
-- -----------------------------------------------------
INSERT INTO oc_pizza.pointofsale_openinghours (
	pointofsale_id_pointofsale, 
	pointofsale_phonenumber_id_phonenumber, 
	pointofsale_address_id_address, 
	pointofsale_openinghours_id_openinghours, 
	openinghours_id_openinghours) 
VALUES (NULL, NULL, NULL, NULL, NULL);
	
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
VALUES (NULL, NULL, NULL, NULL, NULL, NULL);
  
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
VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
	
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
VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
	
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
VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);