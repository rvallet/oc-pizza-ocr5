-- -----------------------------------------------------
-- Create Schema oc_pizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS oc_pizza DEFAULT CHARACTER SET utf8 ;
USE oc_pizza;

-- -----------------------------------------------------
-- Drop each table oc_pizza if exists before create
-- -----------------------------------------------------
DROP TABLE IF EXISTS oc_pizza.phonenumber;
DROP TABLE IF EXISTS oc_pizza.address;
DROP TABLE IF EXISTS oc_pizza.pointofsale;
DROP TABLE IF EXISTS oc_pizza.user;
DROP TABLE IF EXISTS oc_pizza.user_address;
DROP TABLE IF EXISTS oc_pizza.user_phonenumber;
DROP TABLE IF EXISTS oc_pizza.userrole;
DROP TABLE IF EXISTS oc_pizza.openinghours;
DROP TABLE IF EXISTS oc_pizza.invoice;
DROP TABLE IF EXISTS oc_pizza.delivery;
DROP TABLE IF EXISTS oc_pizza.order;
DROP TABLE IF EXISTS oc_pizza.pointofsale_openinghours;
DROP TABLE IF EXISTS oc_pizza.compoundproduct;
DROP TABLE IF EXISTS oc_pizza.product;
DROP TABLE IF EXISTS oc_pizza.orderline;
DROP TABLE IF EXISTS oc_pizza.user_userrole;

-- -----------------------------------------------------
-- Create table oc_pizza.phonenumber
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.phonenumber (
  id_phonenumber SERIAL NOT NULL,
  type VARCHAR(45) NOT NULL,
  phone_number VARCHAR(45) NULL,
  is_default TINYINT NULL DEFAULT 0,
  PRIMARY KEY (id_phonenumber))
  
-- -----------------------------------------------------
-- Create table oc_pizza.address
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.address (
  id_address SERIAL NOT NULL,
  type VARCHAR(15) NULL,
  street_number INT NULL,
  street_name VARCHAR(70) NULL,
  postcode VARCHAR(10) NULL,
  city VARCHAR(20) NULL,
  country VARCHAR(20) NULL,
  address_supplement VARCHAR(70) NULL,
  PRIMARY KEY (id_address))
  
-- -----------------------------------------------------
-- Create table oc_pizza.pointofsale
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.pointofsale (
  id_pointofsale SERIAL NOT NULL,
  name VARCHAR(45) NOT NULL,
  opening_date DATE NULL,
  closing_date DATE NULL,
  store_manager VARCHAR(45) NULL,
  phonenumber_id_phonenumber INT NOT NULL,
  address_id_address INT NOT NULL,
  openinghours_id_openinghours INT NOT NULL,
  PRIMARY KEY (id_pointofsale, phonenumber_id_phonenumber, address_id_address, openinghours_id_openinghours),
  CONSTRAINT fk_pointofsale_phonenumber1
    FOREIGN KEY (phonenumber_id_phonenumber)
    REFERENCES oc_pizza.phonenumber (id_phonenumber)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_pointofsale_address1
    FOREIGN KEY (address_id_address)
    REFERENCES oc_pizza.address (id_address)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.user
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.user (
  id_user SERIAL NOT NULL,
  civility VARCHAR(5) NULL,
  name VARCHAR(255) NULL,
  lastname VARCHAR(255) NULL,
  login VARCHAR(255) NOT NULL,
  encrypted_password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NULL,
  pointofsale_id_pointofsale INT NOT NULL,
  pointofsale_phonenumber_id_phonenumber INT NOT NULL,
  pointofsale_address_id_address INT NOT NULL,
  pointofsale_openinghours_id_openinghours INT NOT NULL,
  PRIMARY KEY (id_user, pointofsale_id_pointofsale, pointofsale_phonenumber_id_phonenumber, pointofsale_address_id_address, pointofsale_openinghours_id_openinghours),
  CONSTRAINT fk_user_pointofsale1
    FOREIGN KEY (pointofsale_id_pointofsale , pointofsale_phonenumber_id_phonenumber , pointofsale_address_id_address , pointofsale_openinghours_id_openinghours)
    REFERENCES oc_pizza.pointofsale (id_pointofsale , phonenumber_id_phonenumber , address_id_address , openinghours_id_openinghours)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.user_address
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.user_address (
  user_id_user INT NOT NULL,
  address_id_address INT NOT NULL,
  PRIMARY KEY (user_id_user, address_id_address),
  CONSTRAINT fk_user_has_address_user
    FOREIGN KEY (user_id_user)
    REFERENCES oc_pizza.user (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_user_has_address_address1
    FOREIGN KEY (address_id_address)
    REFERENCES oc_pizza.address (id_address)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.user_phonenumber
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.user_phonenumber (
  user_id_user INT NOT NULL,
  phonenumber_id_phonenumber INT NOT NULL,
  PRIMARY KEY (user_id_user, phonenumber_id_phonenumber),
  CONSTRAINT fk_user_has_phonenumber_user1
    FOREIGN KEY (user_id_user)
    REFERENCES oc_pizza.user (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_user_has_phonenumber_phonenumber1
    FOREIGN KEY (phonenumber_id_phonenumber)
    REFERENCES oc_pizza.phonenumber (id_phonenumber)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.userrole
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.userrole (
  id_userrole SERIAL NOT NULL,
  role_name VARCHAR(255) NULL,
  PRIMARY KEY (id_userrole))
  
-- -----------------------------------------------------
-- Create table oc_pizza.openinghours
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.openinghours (
  id_openinghours SERIAL NOT NULL,
  day VARCHAR(70) NULL,
  lunchtime_opening TIME NULL,
  lunchtime_closing TIME NULL,
  evening_opening TIME NULL,
  envening_closong TIME NULL,
  PRIMARY KEY (id_openinghours))
  
-- -----------------------------------------------------
-- Create table oc_pizza.invoice
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.invoice (
  id_invoice SERIAL NOT NULL,
  transaction_method VARCHAR(255) NULL,
  transaction_status VARCHAR(45) NULL,
  transaction_reference VARCHAR(255) NOT NULL,
  transaction_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  amount DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (id_invoice))
  
-- -----------------------------------------------------
-- Create table oc_pizza.delivery
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.delivery (
  id_delivery SERIAL NOT NULL,
  date DATETIME NOT NULL,
  status VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_delivery))
  
-- -----------------------------------------------------
-- Create table oc_pizza.order
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.order (
  id_order SERIAL NOT NULL,
  splitedorder_id_splitedorder INT NOT NULL,
  orderline_id_orderline INT NOT NULL,
  invoice_id_invoice INT NOT NULL,
  delivery_id_delivery INT NOT NULL,
  user_id_user INT NOT NULL,
  user_pointofsale_id_pointofsale INT NOT NULL,
  user_pointofsale_phonenumber_id_phonenumber INT NOT NULL,
  user_pointofsale_address_id_address INT NOT NULL,
  user_pointofsale_openinghours_id_openinghours INT NOT NULL,
  PRIMARY KEY (id_order, splitedorder_id_splitedorder, orderline_id_orderline, invoice_id_invoice, delivery_id_delivery, user_id_user, user_pointofsale_id_pointofsale, user_pointofsale_phonenumber_id_phonenumber, user_pointofsale_address_id_address, user_pointofsale_openinghours_id_openinghours),
  CONSTRAINT fk_order_invoice1
    FOREIGN KEY (invoice_id_invoice)
    REFERENCES oc_pizza.invoice (id_invoice)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_order_delivery1
    FOREIGN KEY (delivery_id_delivery)
    REFERENCES oc_pizza.delivery (id_delivery)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_order_user1
    FOREIGN KEY (user_id_user , user_pointofsale_id_pointofsale , user_pointofsale_phonenumber_id_phonenumber , user_pointofsale_address_id_address , user_pointofsale_openinghours_id_openinghours)
    REFERENCES oc_pizza.user (id_user , pointofsale_id_pointofsale , pointofsale_phonenumber_id_phonenumber , pointofsale_address_id_address , pointofsale_openinghours_id_openinghours)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.pointofsale_openinghours
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.pointofsale_openinghours (
  pointofsale_id_pointofsale INT NOT NULL,
  pointofsale_phonenumber_id_phonenumber INT NOT NULL,
  pointofsale_address_id_address INT NOT NULL,
  pointofsale_openinghours_id_openinghours INT NOT NULL,
  openinghours_id_openinghours INT NOT NULL,
  PRIMARY KEY (pointofsale_id_pointofsale, pointofsale_phonenumber_id_phonenumber, pointofsale_address_id_address, pointofsale_openinghours_id_openinghours, openinghours_id_openinghours),
  CONSTRAINT fk_pointofsale_has_openinghours_pointofsale1
    FOREIGN KEY (pointofsale_id_pointofsale , pointofsale_phonenumber_id_phonenumber , pointofsale_address_id_address , pointofsale_openinghours_id_openinghours)
    REFERENCES oc_pizza.pointofsale (id_pointofsale , phonenumber_id_phonenumber , address_id_address , openinghours_id_openinghours)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_pointofsale_has_openinghours_openinghours1
    FOREIGN KEY (openinghours_id_openinghours)
    REFERENCES oc_pizza.openinghours (id_openinghours)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.compoundproduct
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.compoundproduct (
  id_compoundproduct SERIAL NOT NULL,
  quantity INT NULL,
  name VARCHAR(255) NULL,
  pvht FLOAT NULL,
  orderline_id_orderline INT NOT NULL,
  orderline_product_id_product INT NOT NULL,
  PRIMARY KEY (id_compoundproduct, orderline_id_orderline, orderline_product_id_product))
  
-- -----------------------------------------------------
-- Create table oc_pizza.product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.product (
  id_product SERIAL NOT NULL,
  internal_reference VARCHAR(45) NULL,
  sku VARCHAR(45) NULL,
  ean13 INT(13) NULL,
  name VARCHAR(255) NULL,
  pvht FLOAT NOT NULL,
  paht FLOAT NOT NULL,
  tva100 FLOAT NULL,
  mesureunit VARCHAR(45) NULL,
  stock FLOAT NULL,
  compoundproduct_id_compoundproduct INT NOT NULL,
  compoundproduct_orderline_id_orderline INT NOT NULL,
  compoundproduct_orderline_product_id_product INT NOT NULL,
  PRIMARY KEY (id_product, compoundproduct_id_compoundproduct, compoundproduct_orderline_id_orderline, compoundproduct_orderline_product_id_product),
  CONSTRAINT fk_product_compoundproduct1
    FOREIGN KEY (compoundproduct_id_compoundproduct , compoundproduct_orderline_id_orderline , compoundproduct_orderline_product_id_product)
    REFERENCES oc_pizza.compoundproduct (id_compoundproduct , orderline_id_orderline , orderline_product_id_product)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.orderline
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.orderline (
  id_orderline SERIAL NOT NULL,
  product_quantity INT NULL,
  pvht FLOAT NULL,
  order_line_status VARCHAR(45) NOT NULL,
  product_id_product INT NOT NULL,
  order_id_order INT NOT NULL,
  order_splitedorder_id_splitedorder INT NOT NULL,
  order_orderline_id_orderline INT NOT NULL,
  order_invoice_id_invoice INT NOT NULL,
  order_delivery_id_delivery INT NOT NULL,
  order_user_id_user INT NOT NULL,
  order_user_pointofsale_id_pointofsale INT NOT NULL,
  order_user_pointofsale_phonenumber_id_phonenumber INT NOT NULL,
  order_user_pointofsale_address_id_address INT NOT NULL,
  order_user_pointofsale_openinghours_id_openinghours INT NOT NULL,
  compoundproduct_id_compoundproduct INT NOT NULL,
  compoundproduct_orderline_id_orderline INT NOT NULL,
  compoundproduct_orderline_product_id_product INT NOT NULL,
  PRIMARY KEY (id_orderline, product_id_product, order_id_order, order_splitedorder_id_splitedorder, order_orderline_id_orderline, order_invoice_id_invoice, order_delivery_id_delivery, order_user_id_user, order_user_pointofsale_id_pointofsale, order_user_pointofsale_phonenumber_id_phonenumber, order_user_pointofsale_address_id_address, order_user_pointofsale_openinghours_id_openinghours, compoundproduct_id_compoundproduct, compoundproduct_orderline_id_orderline, compoundproduct_orderline_product_id_product),
  CONSTRAINT fk_orderline_product1
    FOREIGN KEY (product_id_product)
    REFERENCES oc_pizza.product (id_product)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_orderline_order1
    FOREIGN KEY (order_id_order , order_splitedorder_id_splitedorder , order_orderline_id_orderline , order_invoice_id_invoice , order_delivery_id_delivery , order_user_id_user , order_user_pointofsale_id_pointofsale , order_user_pointofsale_phonenumber_id_phonenumber , order_user_pointofsale_address_id_address , order_user_pointofsale_openinghours_id_openinghours)
    REFERENCES oc_pizza.order (id_order , splitedorder_id_splitedorder , orderline_id_orderline , invoice_id_invoice , delivery_id_delivery , user_id_user , user_pointofsale_id_pointofsale , user_pointofsale_phonenumber_id_phonenumber , user_pointofsale_address_id_address , user_pointofsale_openinghours_id_openinghours)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_orderline_compoundproduct1
    FOREIGN KEY (compoundproduct_id_compoundproduct , compoundproduct_orderline_id_orderline , compoundproduct_orderline_product_id_product)
    REFERENCES oc_pizza.compoundproduct (id_compoundproduct , orderline_id_orderline , orderline_product_id_product)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.user_userrole
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.user_userrole (
  user_id_user SERIAL NOT NULL,
  user_pointofsale_id_pointofsale INT NOT NULL,
  user_pointofsale_phonenumber_id_phonenumber INT NOT NULL,
  user_pointofsale_address_id_address INT NOT NULL,
  user_pointofsale_openinghours_id_openinghours INT NOT NULL,
  userrole_id_userrole INT NOT NULL,
  typedecontrat VARCHAR(45) NULL,
  start_date DATE NULL,
  end_date DATE NULL,
  PRIMARY KEY (user_id_user, user_pointofsale_id_pointofsale, user_pointofsale_phonenumber_id_phonenumber, user_pointofsale_address_id_address, user_pointofsale_openinghours_id_openinghours, userrole_id_userrole),
  CONSTRAINT fk_user_has_userrole_user1
    FOREIGN KEY (user_id_user , user_pointofsale_id_pointofsale , user_pointofsale_phonenumber_id_phonenumber , user_pointofsale_address_id_address , user_pointofsale_openinghours_id_openinghours)
    REFERENCES oc_pizza.user (id_user , pointofsale_id_pointofsale , pointofsale_phonenumber_id_phonenumber , pointofsale_address_id_address , pointofsale_openinghours_id_openinghours)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_user_has_userrole_userrole1
    FOREIGN KEY (userrole_id_userrole)
    REFERENCES oc_pizza.userrole (id_userrole)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)