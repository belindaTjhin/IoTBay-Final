-- TO CREATE EACH TABLE IN THE IOTBAY DATABASE, RIGHT CLICK ON 'TABLES' AND CLICK ‘EXECUTE COMMAND’ THEN COPY AND PASTE THE FOLLOWING SQL QUERIES:

-- Create USERS table:
CREATE TABLE USERS (EMAIL VARCHAR(50) NOT NULL, 
  "NAME" VARCHAR(50), 
  PASSWORD VARCHAR(20), 
  GENDER VARCHAR(20), 
  ADDRESS VARCHAR(50), 
  PRIMARY KEY (EMAIL));

-- Create ACCESS_LOG table:
CREATE TABLE ACCESS_LOG(
ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
LOGIN_TIME TIMESTAMP, 
LOGOUT_TIME TIMESTAMP);

-- Create CUSTOMERS table:

-- Create ORDERS table:

-- Create ORDERLINES table:

-- Create DEVICES table:
CREATE TABLE devices (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    supplier VARCHAR(100)
    stock INT;
);

-- Create PAYMENTMETHODS table:

-- Create PRODUCTCATEGORIES table:

-- Set up FOREIGNKEYS
