-- TO ADD DATA TO EACH TABLE, RIGHT CLICK ON DESIRED TABLE AND CLICK ‘EXECUTE COMMAND’ THEN COPY AND PASTE THE FOLLOWING SQL QUERY. RIGHT CLICK ON QUERY AND SELECT 'RUN STATEMENT.'
-- Create USERS table.

CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    name VARCHAR(100),
    password VARCHAR(255),
    gender VARCHAR(10),
    address VARCHAR(255)
);

-- Add data to USERS table.

INSERT INTO USERS(email, name, password, gender, address)
VALUES 
('user1@example.com', 'John Doe', 'password1', 'Male', '123 Main St, City, Country'),
('user2@example.com', 'Jane Smith', 'password2', 'Female', '456 Elm St, Town, Country'),
('user3@example.com', 'Michael Johnson', 'password3', 'Male', '789 Oak St, Village, Country'),
('user4@example.com', 'Emily Davis', 'password4', 'Female', '101 Pine St, Town, Country'),
('user5@example.com', 'Chris Lee', 'password5', 'Male', '111 Maple St, City, Country');

INSERT INTO USERS (EMAIL, NAME, PASSWORD, GENDER, ADDRESS) VALUES 
('john.smith@uts.edu.au', 'John Smith', 'password', 'male', '14 Rainbow Rd, Palm Beach, NSW'), 
('jane.doe@uts.edu.au', 'Jane Doe', 'wordpass', 'female', '21 Treetop Ave, North Narrabeen, NSW'),
('tim.lee@uts.edu.au', 'Tim Lee', 'swordpas', 'male', '118 Fairy St, Avalon, NSW'),
('gerald.roger@uts.edu.au', 'Gerald Roger', 'wordspas', 'male', '24 Candy Pl, Balgowlah, NSW'), 
('tiffany.topsy@uts.edu.au', 'Tiffany Topsy', 'worpassd', 'female', '101 Velvet Rd, Manly, NSW'), 
('biggie.smalls@uts.edu.au', 'Biggie Smalls', 'asspword', 'male', '69 Dee St, Nuts Beach, NSW'), 
('emily.johnson@example.com', 'Emily Johnson', 'secure123', 'female', '456 Elm Street, Springfield, USA'), 
('michael.brown@example.com', 'Michael Brown', 'password123', 'male', '789 Oak Avenue, Lakeside, USA'), 
('sarah.wilson@example.com', 'Sarah Wilson', 'qwerty', 'female', '101 Maple Drive, Riverside, USA'),
('david.lee@example.com', 'David Lee', 'letmein', 'male', '202 Pine Road, Hilltop, USA');

-- Add data to CUSTOMERS table:

-- Add data to ORDERS table:

-- Add data to ORDERLINES table:

-- Create DEVICES table:

CREATE TABLE devices (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    supplier VARCHAR(100)
);

-- Add data to DEVICES table:

INSERT INTO devices (id, name, description, price, supplier) 
VALUES 
(1, 'Smart Thermostat', 'A smart thermostat for efficient temperature control', 129.99, 'Smart Home Co.'),
(2, 'Security Camera', 'An IoT security camera with motion detection and night vision', 199.99, 'SecureTech Inc.'),
(3, 'Smart Lock', 'A smart lock for keyless entry with remote access control', 149.99, 'Tech Innovations Ltd.');

-- Add data to PAYMENTMETHODS table:

-- Add data to PRODUCTCATEGORIES table:

-- Set up FOREIGNKEYS:
