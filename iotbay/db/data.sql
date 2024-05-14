-- TO ADD DATA TO EACH TABLE, RIGHT CLICK ON DESIRED TABLE AND CLICK ‘EXECUTE COMMAND’ THEN COPY AND PASTE THE FOLLOWING SQL QUERY. RIGHT CLICK ON QUERY AND SELECT 'RUN STATEMENT.'
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

INSERT INTO USERS (EMAIL, NAME, PASSWORD, GENDER, ADDRESS) VALUES 
('aaa@aaa.com', 'Liam Anderson', 'aaaa', 'male', '118 Park Road, St Kilda, VIC'),
('mia.thompson@example.com', 'Mia Thompson', 'letmein123', 'female', '24 Ocean Drive, Byron Bay, NSW'),
('ethan.harris@example.com', 'Ethan Harris', 'qwerty123', 'male', '101 Harbour Street, Darling Harbour, NSW'),
('ava.jackson@example.com', 'Ava Jackson', 'password456', 'female', '69 Hillside Avenue, Noosa Heads, QLD'),
('noah.martin@example.com', 'Noah Martin', 'welcome123', 'male', '456 Lakeside Drive, Lake Macquarie, NSW');

-- Add data to ADMIN table:
INSERT INTO ADMIN(email, name, password, gender, address) VALUES
('john.doe@example.com', 'John Doe', 'john123', 'Male', '123 Main St'),
('jane_smith12@gmail.com', 'Jane Smith', 'smith2020', 'Female', '456 Elm St'),
('mike_smith@gmail.com', 'Mike Smith', 'mike1234', 'Male', '789 Oak St'),
('sara_jones22@hotmail.com', 'Sara Jones', 'jones456', 'Female', '101 Pine St'),
('chris123@yahoo.com', 'Chris Brown', 'chris789', 'Male', '234 Maple St'),
('amy.roberts34@gmail.com', 'Amy Roberts', 'amy2021', 'Female', '567 Cedar St'),
('mark.thomas@example.com', 'Mark Thomas', 'mark456', 'Male', '890 Birch St'),
('lisa_johnson@gmail.com', 'Lisa Johnson', 'lisa1234', 'Female', '111 Oak St'),
('kevin_smith23@yahoo.com', 'Kevin Smith', 'kevin2021', 'Male', '222 Elm St'),
('emily.davis@example.com', 'Emily Davis', 'emily456', 'Female', '333 Cedar St'),
('matt.robinson@gmail.com', 'Matt Robinson', 'matt789', 'Male', '444 Pine St'),
('sophia.james@yahoo.com', 'Sophia James', 'sophia2022', 'Female', '555 Maple St'),
('david.brown@example.com', 'David Brown', 'david1234', 'Male', '666 Elm St'),
('olivia_wilson@hotmail.com', 'Olivia Wilson', 'olivia567', 'Female', '777 Oak St'),
('jason.smith@example.com', 'Jason Smith', 'jason2023', 'Male', '888 Cedar St'),
('mia_johnson@gmail.com', 'Mia Johnson', 'mia1234', 'Female', '999 Pine St'),
('ryan.miller@yahoo.com', 'Ryan Miller', 'ryan567', 'Male', '1010 Birch St'),
('kelly_williams@example.com', 'Kelly Williams', 'kelly2024', 'Female', '1111 Maple St'),
('steven_taylor@gmail.com', 'Steven Taylor', 'steven789', 'Male', '1212 Elm St'),
('jessica_adams@example.com', 'Jessica Adams', 'jessica1234', 'Female', '1313 Cedar St');


-- Add data to SYSTEM table:
INSERT INTO SYSTEMADMIN(email, password)
VALUES 
('admin@admin.com', 'admin');

-- Add data to ORDERS table:
INSERT INTO ORDERS (ORDERID, useremail, orderdate, price, shippingaddress)
VALUES
  (1, 'user1@example.com', '2024-05-15', 25.99, '123 Main St, City, Country'),
  (2, 'user2@example.com', '2024-05-16', 35.99, '456 Elm St, Town, Country'),
  (3, 'user3@example.com', '2024-05-17', 45.99, '789 Oak St, Village, Country'),
  (4, 'user4@example.com', '2024-05-18', 55.99, '101 Pine St, Town, Country'),
  (5, 'user5@example.com', '2024-05-19', 65.99, '111 Maple St, City, Country'),
  (6, 'john.smith@uts.edu.au', '2024-05-20', 75.99, '14 Rainbow Rd, Palm Beach, NSW'),
  (7, 'jane.doe@uts.edu.au', '2024-05-21', 85.99, '21 Treetop Ave, North Narrabeen, NSW'),
  (8, 'tim.lee@uts.edu.au', '2024-05-22', 95.99, '118 Fairy St, Avalon, NSW'),
  (9, 'gerald.roger@uts.edu.au', '2024-05-23', 105.99, '24 Candy Pl, Balgowlah, NSW'),
  (10, 'tiffany.topsy@uts.edu.au', '2024-05-24', 115.99, '101 Velvet Rd, Manly, NSW'),
  (11, 'biggie.smalls@uts.edu.au', '2024-05-25', 125.99, '69 Dee St, Nuts Beach, NSW'),
  (12, 'emily.johnson@example.com', '2024-05-26', 135.99, '456 Elm Street, Springfield, USA'),
  (13, 'michael.brown@example.com', '2024-05-27', 145.99, '789 Oak Avenue, Lakeside, USA'),
  (14, 'sarah.wilson@example.com', '2024-05-28', 155.99, '101 Maple Drive, Riverside, USA'),
  (15, 'david.lee@example.com', '2024-05-29', 165.99, '202 Pine Road, Hilltop, USA'),
  (16, 'aaa@aaa.com', '2024-05-30', 175.99, '118 Park Road, St Kilda, VIC'),
  (17, 'mia.thompson@example.com', '2024-06-01', 185.99, '24 Ocean Drive, Byron Bay, NSW'),
  (18, 'ethan.harris@example.com', '2024-06-02', 195.99, '101 Harbour Street, Darling Harbour, NSW'),
  (19, 'ava.jackson@example.com', '2024-06-03', 205.99, '69 Hillside Avenue, Noosa Heads, QLD'),
  (20, 'noah.martin@example.com', '2024-06-04', 215.99, '456 Lakeside Drive, Lake Macquarie, NSW');

-- Add data to ORDERLINES table:
INSERT INTO ORDERLINE (ORDERLINEID, orderid, quantity, productid, productname, totalprice, price)
VALUES
  (1, 1, 2, 1, 'Smart Thermostat', 259.98, 129.99),
  (2, 1, 1, 2, 'Security Camera', 199.99, 199.99),
  (3, 2, 3, 3, 'Smart Lock', 449.97, 149.99),
  (4, 2, 4, 4, 'Smart Bulb', 79.96, 19.99),
  (5, 3, 2, 5, 'Smart Plug', 49.98, 24.99),
  (6, 3, 1, 6, 'Smart Speaker', 99.99, 99.99),
  (7, 4, 1, 7, 'Fitness Tracker', 79.99, 79.99),
  (8, 5, 2, 8, 'Smartwatch', 399.98, 199.99),
  (9, 6, 1, 9, 'Smart Scale', 49.99, 49.99),
  (10, 7, 1, 10, 'Robot Vacuum', 299.99, 299.99),
  (11, 7, 2, 11, 'Smart Mirror', 299.98, 149.99),
  (12, 8, 1, 12, 'Smart Garden', 79.99, 79.99),
  (13, 8, 1, 13, 'Smart Coffee Maker', 69.99, 69.99),
  (14, 9, 1, 14, 'Smart Refrigerator', 999.99, 999.99),
  (15, 9, 2, 15, 'Air Quality Monitor', 119.98, 59.99),
  (16, 10, 1, 16, 'Smart Doorbell', 129.99, 129.99),
  (17, 11, 3, 17, 'Smart Pet Feeder', 269.97, 89.99),
  (18, 11, 1, 18, 'Smart Humidifier', 79.99, 79.99),
  (19, 12, 2, 19, 'Smart Air Purifier', 299.98, 149.99),
  (20, 12, 1, 20, 'Smart Ceiling Fan', 129.99, 129.99);

-- Add data to DEVICES table:

INSERT INTO devices (id, name, description, price, supplier, stock)
VALUES
(1, 'Smart Thermostat', 'A smart thermostat for efficient temperature control', 129.99, 'Smart Home Co.', 120),
(2, 'Security Camera', 'An IoT security camera with motion detection and night vision', 199.99, 'SecureTech Inc.', 50),
(3, 'Smart Lock', 'A smart lock for keyless entry with remote access control', 149.99, 'Tech Innovations Ltd.', 80),
(4, 'Smart Bulb', 'A WiFi-enabled smart bulb with adjustable brightness and color', 19.99, 'IlluminateTech', 100),
(5, 'Smart Plug', 'A plug that turns any device into a smart device', 24.99, 'PowerTech Solutions', 150),
(6, 'Smart Speaker', 'A voice-controlled smart speaker with built-in virtual assistant', 99.99, 'SoundTech Inc.', 75),
(7, 'Fitness Tracker', 'A wearable device that tracks fitness metrics like steps and heart rate', 79.99, 'FitTech Ltd.', 200),
(8, 'Smartwatch', 'A wearable device with touchscreen display and various smart features', 199.99, 'TechWear', 50),
(9, 'Smart Scale', 'A scale that measures weight and body composition and syncs with mobile apps', 49.99, 'HealthTech Solutions', 120),
(10, 'Robot Vacuum', 'An autonomous vacuum cleaner with mapping and scheduling capabilities', 299.99, 'CleanTech Robotics', 30),
(11, 'Smart Mirror', 'A mirror with built-in display for showing weather, news, and calendar', 149.99, 'Reflective Technologies', 60),
(12, 'Smart Garden', 'An automated system for monitoring and watering indoor plants', 79.99, 'GreenTech Innovations', 90),
(13, 'Smart Coffee Maker', 'A coffee maker that can be controlled remotely via smartphone', 69.99, 'BrewTech Co.', 80),
(14, 'Smart Refrigerator', 'A refrigerator with touchscreen display and food inventory management', 999.99, 'ColdTech Appliances', 15),
(15, 'Air Quality Monitor', 'A device that measures indoor air quality and provides real-time data', 59.99, 'AirTech Sensors', 100),
(16, 'Smart Doorbell', 'A video doorbell with two-way audio and motion detection', 129.99, 'Ring Technologies', 45),
(17, 'Smart Pet Feeder', 'A feeder that dispenses pet food based on schedule or remotely via app', 89.99, 'PetTech Solutions', 70),
(18, 'Smart Humidifier', 'A humidifier that adjusts humidity levels automatically for optimal comfort', 79.99, 'HumidifyTech Inc.', 55),
(19, 'Smart Air Purifier', 'An air purifier that removes allergens and pollutants from indoor air', 149.99, 'PureAir Technologies', 40),
(20, 'Smart Ceiling Fan', 'A ceiling fan that can be controlled via smartphone or voice commands', 129.99, 'BreezeTech Co.', 65);

-- Add data to PAYMENTS table:
INSERT INTO PAYMENTS (paymentID, orderID, date, cardHolderName, cardNumber, cardCVC, cardExpiryMM, cardExpiryYY)
VALUES
(1, 1, '2022-10-10', 'John Doe', '1234567812345678', '123', '05', '25'),
(2, 2, '2022-11-01', 'Jane Smith', '8765432187654321', '456', '06', '26'),
(3, 3, '2022-12-02', 'Alice Johnson', '9876543298765432', '789', '07', '27'),
(4, 4, '2023-01-03', 'Bob Brown', '3456789034567890', '321', '08', '28'),
(5, 5, '2023-02-05', 'Charlie Davis', '2345678923456789', '654', '09', '25'),
(6, 6, '2023-03-12', 'Eve Wilson', '4567890145678901', '987', '10', '26'),
(7, 7, '2023-04-17', 'Grace Lee', '5678901256789012', '234', '11', '27'),
(8, 8, '2023-05-21', 'David Martinez', '6789012367890123', '567', '12', '28'),
(9, 9, '2023-06-30', 'Frank Adams', '7890123478901234', '890', '01', '25'),
(10, 10, '2023-07-24', 'Helen Clark', '8901234589012345', '123', '02', '26'),
(11, 11, '2023-08-12', 'Ivy White', '9012345690123456', '456', '03', '27'),
(12, 12, '2023-09-01', 'Jack Green', '1234567812345678', '789', '04', '28'),
(13, 13, '2023-10-05', 'Kelly Black', '2345678923456789', '012', '05', '25'),
(14, 14, '2023-11-11', 'Mike Grey', '3456789034567890', '345', '06', '26'),
(15, 15, '2023-12-20', 'Nancy Brown', '4567890145678901', '678', '07', '27'),
(16, 16, '2024-01-15', 'Oliver Davis', '5678901256789012', '901', '08', '28'),
(17, 17, '2024-02-03', 'Pamela White', '6789012367890123', '234', '09', '25'),
(18, 18, '2024-03-17', 'Quincy Smith', '7890123478901234', '567', '10', '26'),
(19, 19, '2024-04-25', 'Ryan Adams', '8901234589012345', '890', '11', '27'),
(20, 20, '2024-05-10', 'Sarah Clark', '9012345690123456', '123', '12', '28');


-- Add data to PRODUCTCATEGORIES table:

-- Set up FOREIGNKEYS:
