BEGIN;

CREATE SCHEMA IF NOT EXISTS da_sales;

CREATE TABLE IF NOT EXISTS da_sales.customers (
        id INTEGER PRIMARY KEY,
        name VARCHAR(50),
        birthyear INTEGER,
        city VARCHAR(50),
        state VARCHAR(2)
        );

        CREATE TABLE IF NOT EXISTS da_sales.products (
        id INTEGER PRIMARY KEY,
        name VARCHAR(50),
        price NUMERIC(6, 2)
        );

        
CREATE TABLE IF NOT EXISTS da_sales.purchases (
        id INTEGER PRIMARY KEY,
        custid INTEGER REFERENCES da_sales.customers(id),
        prodid INTEGER REFERENCES da_sales.products(id),
        quantity INTEGER,
        date DATE
        );

DELETE FROM da_sales.customers;
DELETE FROM da_sales.purchases;
DELETE FROM da_sales.products;

INSERT INTO da_sales.customers VALUES
        (1001, 'Polly', 1952, 'San Francisco', 'CA'),
        (1003, 'Chiron', 1980, 'Seattle', 'WA'),
        (1004, 'Petra', 1992, 'New York', 'NY'),
        (1005, 'Arvind', 1974, 'Phoenix', 'AZ');

INSERT INTO da_sales.customers (id, name, city, state) VALUES
        (1006, 'Pei', 'Austin', 'TX'),
        (1002, 'Juan', 'Denver', 'CO');

INSERT INTO da_sales.customers (id, name, birthyear, state) VALUES
        (1007, 'Pira', 1977, 'CA');

COPY da_sales.products FROM 'C:\Users\blindsey\Downloads\products.csv'
WITH DELIMITER ',' CSV;

COPY da_sales.purchases FROM 'C:\Users\blindsey\Downloads\purchases.txt'
WITH DELIMITER E'\t' ;

COMMIT; 