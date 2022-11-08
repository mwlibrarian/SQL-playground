CREATE DATABASE Pet_Store

CREATE TABLE Purchases(
transaction_number uniqueidentifier PRIMARY KEY,
datestamp datetime NOT NULL,
item_type varchar (20) NOT NULL,
animal_type varchar (20) CHECK (animal_type IN ('Dog', 'Cat', 'Bird', 'Fish', 'Other')),
CONSTRAINT purchaseid UNIQUE(transaction_number, datestamp)
);

CREATE TABLE Customer_Data (
customerID tinyint PRIMARY KEY,
transaction_number uniqueidentifier FOREIGN KEY REFERENCES Purchases(transaction_number),
firstname varchar (25) NOT NULL,
lastname varchar (25) NOT NULL,
phone_number varchar (12),
pet_name_one varchar (20),
pet_name_two varchar (20),
pet_name_three varchar (20),
pet_name_four varchar (20),
pet_name_five varchar (20),
pet_name_six varchar (20),
);

CREATE TABLE Pet_Data(
petID tinyint PRIMARY KEY,
customerID tinyint FOREIGN KEY REFERENCES Customer_Data(customerID),
pet_name varchar (20) NOT NULL,
pet_age tinyint CHECK (pet_age <=25),
animal_type varchar (20) CHECK (animal_type IN ('Dog', 'Cat', 'Bird', 'Fish', 'Other')),
CONSTRAINT pet_customer_id UNIQUE(petID, customerID, pet_name, animal_type)
);

CREATE TABLE Dog_Info(
petID tinyint PRIMARY KEY,
transaction_number uniqueidentifier FOREIGN KEY REFERENCES Purchases(transaction_number),
item_type varchar (20) NOT NULL,
pet_name varchar (20) NOT NULL,
);

CREATE TABLE Cat_Info(
petID tinyint PRIMARY KEY,
transaction_number uniqueidentifier FOREIGN KEY REFERENCES Purchases(transaction_number),
item_type varchar (20) NOT NULL,
pet_name varchar (20) NOT NULL,
);

CREATE TABLE Fish_Info(
petID tinyint PRIMARY KEY,
transaction_number uniqueidentifier FOREIGN KEY REFERENCES Purchases(transaction_number),
item_type varchar (20) NOT NULL, 
pet_name varchar (20) NOT NULL,
);

CREATE TABLE Bird_Info(
petID tinyint PRIMARY KEY,
transaction_number uniqueidentifier FOREIGN KEY REFERENCES Purchases(transaction_number),
item_type varchar (20) NOT NULL,
pet_name varchar (20) NOT NULL,
);

CREATE TABLE Other_Info(
petID tinyint PRIMARY KEY,
transaction_number uniqueidentifier FOREIGN KEY REFERENCES Purchases(transaction_number),
item_type varchar (20) NOT NULL,
pet_name varchar (20) NOT NULL,
);

