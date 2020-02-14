-- -----------------------------------------------------
-- Create Schema oc_pizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS oc_pizza DEFAULT CHARACTER SET utf8;
USE oc_pizza;

-- -----------------------------------------------------
-- Drop each table oc_pizza if exists before create
-- -----------------------------------------------------
DROP TABLE IF EXISTS oc_pizza.address;
DROP TABLE IF EXISTS oc_pizza.pointofsale;
DROP TABLE IF EXISTS oc_pizza.userrole;
DROP TABLE IF EXISTS oc_pizza.user_userrole;
DROP TABLE IF EXISTS oc_pizza.user;
DROP TABLE IF EXISTS oc_pizza.user_address;
DROP TABLE IF EXISTS oc_pizza.openinghours;
DROP TABLE IF EXISTS oc_pizza.invoice;
DROP TABLE IF EXISTS oc_pizza.delivery;
DROP TABLE IF EXISTS oc_pizza.order;
DROP TABLE IF EXISTS oc_pizza.product;
DROP TABLE IF EXISTS oc_pizza.orderline;
DROP TABLE IF EXISTS oc_pizza.compoundproduct;
DROP TABLE IF EXISTS oc_pizza.compoundproduct_has_product;
DROP TABLE IF EXISTS oc_pizza.pointofsale_has_openinghours;
DROP TABLE IF EXISTS oc_pizza.order_has_orderline;

-- -----------------------------------------------------
-- Create table oc_pizza.address
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.address (
  id_address INT NOT NULL,
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
  id_pointofsale INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  opening_date DATE NULL,
  closing_date DATE NULL,
  store_manager VARCHAR(45) NULL,
  phonenumber VARCHAR(45) NULL,
  address_id_address INT NOT NULL,
  PRIMARY KEY (id_pointofsale, address_id_address),
  CONSTRAINT fk_pointofsale_address1
    FOREIGN KEY (address_id_address)
    REFERENCES oc_pizza.address (id_address)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.user
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.user (
  id_user INT NOT NULL,
  civility VARCHAR(5) NULL,
  name VARCHAR(255) NULL,
  lastname VARCHAR(255) NULL,
  login VARCHAR(255) NOT NULL,
  encrypted_password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NULL,
  phone_number VARCHAR(45) NULL,
  pointofsale_id_pointofsale INT NOT NULL,
  PRIMARY KEY (id_user, pointofsale_id_pointofsale),
  CONSTRAINT fk_user_pointofsale1
    FOREIGN KEY (pointofsale_id_pointofsale)
    REFERENCES oc_pizza.pointofsale (id_pointofsale)
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
-- Create table oc_pizza.userrole
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.userrole (
  id_userrole INT NOT NULL,
  role_name VARCHAR(255) NULL,
  PRIMARY KEY (id_userrole))
  
  
-- -----------------------------------------------------
-- Create table oc_pizza.openinghours
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.openinghours (
  id_openinghours INT NOT NULL,
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
  id_invoice INT NOT NULL,
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
  id_delivery INT NOT NULL,
  date DATETIME NOT NULL,
  status VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_delivery))
  
-- -----------------------------------------------------
-- Create table oc_pizza.order
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.order (
  id_order INT NOT NULL,
  invoice_id_invoice INT NOT NULL,
  delivery_id_delivery INT NOT NULL,
  user_id_user INT NOT NULL,
  user_pointofsale_id_pointofsale INT NOT NULL,
  PRIMARY KEY (id_order, invoice_id_invoice, delivery_id_delivery, user_id_user, user_pointofsale_id_pointofsale),
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
    FOREIGN KEY (user_id_user , user_pointofsale_id_pointofsale)
    REFERENCES oc_pizza.user (id_user , pointofsale_id_pointofsale)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table oc_pizza.order_has_orderline
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.order_has_orderline (
  order_id_order INT NOT NULL,
  orderline_id_orderline INT NOT NULL,
  PRIMARY KEY (order_id_order, orderline_id_orderline),
  CONSTRAINT fk_order_has_orderline_order1
    FOREIGN KEY (order_id_order)
    REFERENCES oc_pizza.order (id_order)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_order_has_orderline_orderline1
    FOREIGN KEY (orderline_id_orderline)
    REFERENCES oc_pizza.orderline (id_orderline)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Table oc_pizza.pointofsale_has_openinghours
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.pointofsale_has_openinghours (
  openinghours_id_openinghours INT NOT NULL,
  pointofsale_id_pointofsale INT NOT NULL,
  PRIMARY KEY (openinghours_id_openinghours, pointofsale_id_pointofsale),
  CONSTRAINT fk_openinghours_has_pointofsale_openinghours1
    FOREIGN KEY (openinghours_id_openinghours)
    REFERENCES oc_pizza.openinghours (id_openinghours)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_openinghours_has_pointofsale_pointofsale1
    FOREIGN KEY (pointofsale_id_pointofsale)
    REFERENCES oc_pizza.pointofsale (id_pointofsale)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)	

-- -----------------------------------------------------
-- Create table oc_pizza.product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.product (
  id_product INT NOT NULL,
  internal_reference VARCHAR(45) NULL,
  sku VARCHAR(45) NULL,
  ean13 VARCHAR(45) NULL,
  name VARCHAR(255) NULL,
  pvht DECIMAL(5,2) NOT NULL,
  paht DECIMAL(5,2) NOT NULL,
  tva100 DECIMAL(5,2) NULL,
  mesureunit VARCHAR(45) NULL,
  PRIMARY KEY (id_product))
  
-- -----------------------------------------------------
-- Create table oc_pizza.compoundproduct
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.compoundproduct (
  id_compoundproduct INT NOT NULL,
  name VARCHAR(255) NULL,
  pvht DECIMAL(5,2) NULL,
  PRIMARY KEY (id_compoundproduct))
  
-- -----------------------------------------------------
-- Table oc_pizza.compoundproduct_has_product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.compoundproduct_has_product (
  compoundproduct_id_compoundproduct INT NOT NULL,
  product_id_product INT NOT NULL,
  quantity DECIMAL(5,2) NULL,
  PRIMARY KEY (compoundproduct_id_compoundproduct, product_id_product),
  CONSTRAINT fk_compoundproduct_has_product_compoundproduct1
    FOREIGN KEY (compoundproduct_id_compoundproduct)
    REFERENCES oc_pizza.compoundproduct (id_compoundproduct)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_compoundproduct_has_product_product1
    FOREIGN KEY (product_id_product)
    REFERENCES oc_pizza.product (id_product)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    
-- -----------------------------------------------------
-- Table oc_pizza.stock
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.stock (
  `id_stock` INT NOT NULL,
  `pointofsale_id_pointofsale` INT NOT NULL,
  `product_id_product` INT NOT NULL,
  `stock` DECIMAL(5,2) NULL,
  `mesureunit` VARCHAR(45) NULL,
  PRIMARY KEY (`id_stock`),
  CONSTRAINT `fk_stock_pointofsale1`
    FOREIGN KEY (`pointofsale_id_pointofsale`)
    REFERENCES `oc_pizza`.`pointofsale` (`id_pointofsale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `oc_pizza`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
	
-- -----------------------------------------------------
-- Create table oc_pizza.orderline
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.orderline (
  id_orderline INT NOT NULL,
  product_quantity INT NULL,
  order_line_status VARCHAR(45) NOT NULL,
  product_id_product INT NULL,
  compoundproduct_id_compoundproduct INT NULL,
  PRIMARY KEY (id_orderline),
  CONSTRAINT fk_orderline_product1
    FOREIGN KEY (product_id_product)
    REFERENCES oc_pizza.product (id_product)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_orderline_compoundproduct1
    FOREIGN KEY (compoundproduct_id_compoundproduct)
    REFERENCES oc_pizza.compoundproduct (id_compoundproduct)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Create table oc_pizza.user_userrole
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS oc_pizza.user_userrole (
  user_id_user INT NOT NULL,
  typedecontrat VARCHAR(45) NULL,
  start_date DATE NULL,
  end_date DATE NULL,
  userrole_id_userrole INT NOT NULL,
PRIMARY KEY (user_id_user, userrole_id_userrole),
  CONSTRAINT fk_user_has_userrole_userrole1
    FOREIGN KEY (userrole_id_userrole)
    REFERENCES oc_pizza.userrole (id_userrole)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_user_userrole_user1
    FOREIGN KEY (user_id_user)
    REFERENCES oc_pizza.user (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)   
