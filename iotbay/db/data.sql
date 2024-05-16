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
INSERT INTO SYSTEMADMIN (email, password) VALUES 
('admin@admin.com', 'admin'),
('admin2@admin.com', 'password2'),
('admin3@admin.com', 'password3'),
('admin4@admin.com', 'password4'),
('admin5@admin.com', 'password5'),
('admin6@admin.com', 'password6'),
('admin7@admin.com', 'password7'),
('admin8@admin.com', 'password8'),
('admin9@admin.com', 'password9'),
('admin10@admin.com', 'password10'),
('admin11@admin.com', 'password11'),
('admin12@admin.com', 'password12'),
('admin13@admin.com', 'password13'),
('admin14@admin.com', 'password14'),
('admin15@admin.com', 'password15'),
('admin16@admin.com', 'password16'),
('admin17@admin.com', 'password17'),
('admin18@admin.com', 'password18'),
('admin19@admin.com', 'password19'),
('admin20@admin.com', 'password20');


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
  (20, 'noah.martin@example.com', '2024-06-04', 215.99, '456 Lakeside Drive, Lake Macquarie, NSW'),
  (21, 'aaa@aaa.com', '2024-06-05', 225.99, '118 Park Road, St Kilda, VIC'),
  (22, 'aaa@aaa.com', '2024-06-06', 235.99, '118 Park Road, St Kilda, VIC'),
  (23, 'aaa@aaa.com', '2024-06-07', 245.99, '118 Park Road, St Kilda, VIC'),
  (24, '', '2024-06-08', 255.99, '118 Park Road, St Kilda, VIC'),
  (25, '', '2024-06-09', 265.99, '118 Park Road, St Kilda, VIC');

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
INSERT INTO PAYMENTS (paymentID, orderID, email, date, cHName, cNumber, cCVC, cExMMYY, isFinalised)
VALUES
(1, 1, 'user1@example.com', '2022-01-01', 'John Doe', '4539244541637526', '123', '05/25', true),
(2, 2, 'user2@example.com', '2022-01-02', 'Jane Smith', '5276992518950471', '456', '06/26', true),
(3, 3, 'user3@example.com', '2022-01-03', 'Michael Johnson', '5231234567889012', '789', '07/27', true),
(4, 4, 'user4@example.com', '2022-01-04', 'Emily Davis', '5541675863401313', '321', '08/28', true),
(5, 5, 'user5@example.com', '2022-01-05', 'Chris Lee', '4026526350483328', '654', '09/25', true),
(6, 6, 'john.smith@uts.edu.au', '2022-01-06', 'John Smith', '5256625712567939', '987', '10/26', true),
(7, 7, 'jane.doe@uts.edu.au', '2022-01-07', 'Jane Doe', '5290827256196603', '234', '11/27', true),
(8, 8, 'tim.lee@uts.edu.au', '2022-01-08', 'Tim Lee', '5281191745009197', '567', '12/28', true),
(9, 9, 'gerald.roger@uts.edu.au', '2022-01-09', 'Gerald Roger', '5243123456789012', '890', '01/25', true),
(10, 10, 'tiffany.topsy@uts.edu.au', '2022-01-10', 'Tiffany Topsy', '5578901234567890', '123', '02/26', true),
(11, 11, 'biggie.smalls@uts.edu.au', '2022-01-11', 'Biggie Smalls', '5258901234567890', '456', '03/27', true),
(12, 12, 'emily.johnson@example.com', '2022-01-12', 'Emily Johnson', '512345678912345', '789', '04/28', true),
(13, 13, 'michael.brown@example.com', '2022-01-13', 'Michael Brown', '5478901234567890', '012', '05/25', true),
(14, 14, 'sarah.wilson@example.com', '2022-01-14', 'Sarah Wilson', '5267890123456789', '345', '06/26', true),
(15, 15, 'david.lee@example.com', '2022-01-15', 'David Lee', '5134567890123456', '678', '07/27', true),
(16, 16, 'aaa@aaa.com', '2022-01-15', 'Liam Anderson', '5256901234567890', '901', '08/28', true),
(17, 17, 'aaa@aaa.com', '2022-01-16', 'Liam Anderson', '5256901234567890', '901', '08/28', true),
(18, 18, 'aaa@aaa.com', '2022-01-17', 'Liam Anderson', '5256901234567890', '901', '08/28', true),
(19, 19, 'aaa@aaa.com', '2022-01-18', 'Liam Anderson', '5256901234567890', '901', '08/28', false),
(20, 20, 'aaa@aaa.com', '2022-01-20', 'Liam Anderson', '5256901234567890', '901', '08/28', false);



-- Add data to USER ACCESS LOG table:
INSERT INTO IOTUSER.USER_ACCESS_LOG (EMAIL, LOGIN_TIME, LOGOUT_TIME) 
VALUES 
('user1@example.com', '2024-05-16 14:25:00', '2024-05-16 15:30:00'),
('user2@example.com', '2024-05-16 13:45:00', '2024-05-16 14:50:00'),
('user3@example.com', '2024-05-16 12:55:00', '2024-05-16 13:55:00'),
('user4@example.com', '2024-05-16 11:30:00', '2024-05-16 12:45:00'),
('user5@example.com', '2024-05-16 10:15:00', '2024-05-16 11:25:00'),
('john.smith@uts.edu.au', '2024-05-16 09:40:00', '2024-05-16 10:55:00'),
('jane.doe@uts.edu.au', '2024-05-16 08:50:00', '2024-05-16 09:50:00'),
('tim.lee@uts.edu.au', '2024-05-16 07:35:00', '2024-05-16 08:45:00'),
('gerald.roger@uts.edu.au', '2024-05-16 06:25:00', '2024-05-16 07:35:00'),
('tiffany.topsy@uts.edu.au', '2024-05-16 05:10:00', '2024-05-16 06:25:00'),
('biggie.smalls@uts.edu.au', '2024-05-16 04:20:00', '2024-05-16 05:30:00'),
('emily.johnson@example.com', '2024-05-16 03:15:00', '2024-05-16 04:30:00'),
('michael.brown@example.com', '2024-05-16 02:30:00', '2024-05-16 03:40:00'),
('sarah.wilson@example.com', '2024-05-16 01:40:00', '2024-05-16 02:50:00'),
('david.lee@example.com', '2024-05-16 00:55:00', '2024-05-16 02:05:00'),
('aaa@aaa.com', '2024-05-15 23:45:00', '2024-05-16 00:55:00'),
('mia.thompson@example.com', '2024-05-15 22:30:00', '2024-05-15 23:40:00'),
('ethan.harris@example.com', '2024-05-15 21:15:00', '2024-05-15 22:25:00'),
('ava.jackson@example.com', '2024-05-15 20:25:00', '2024-05-15 21:35:00'),
('noah.martin@example.com', '2024-05-15 19:35:00', '2024-05-15 20:45:00');

-- Add data to ADMIN ACCESS LOG table:
INSERT INTO IOTUSER.ADMIN_ACCESS_LOG (EMAIL, LOGIN_TIME, LOGOUT_TIME) 
VALUES 
('john.doe@example.com', '2024-05-16 14:25:00', '2024-05-16 15:30:00'),
('jane_smith12@gmail.com', '2024-05-16 13:45:00', '2024-05-16 14:50:00'),
('mike_smith@gmail.com', '2024-05-16 12:55:00', '2024-05-16 13:55:00'),
('sara_jones22@hotmail.com', '2024-05-16 11:30:00', '2024-05-16 12:45:00'),
('chris123@yahoo.com', '2024-05-16 10:15:00', '2024-05-16 11:25:00'),
('amy.roberts34@gmail.com', '2024-05-16 09:40:00', '2024-05-16 10:55:00'),
('mark.thomas@example.com', '2024-05-16 08:50:00', '2024-05-16 09:50:00'),
('lisa_johnson@gmail.com', '2024-05-16 07:35:00', '2024-05-16 08:45:00'),
('kevin_smith23@yahoo.com', '2024-05-16 06:25:00', '2024-05-16 07:35:00'),
('emily.davis@example.com', '2024-05-16 05:10:00', '2024-05-16 06:25:00'),
('matt.robinson@gmail.com', '2024-05-16 04:20:00', '2024-05-16 05:30:00'),
('sophia.james@yahoo.com', '2024-05-16 03:15:00', '2024-05-16 04:30:00'),
('david.brown@example.com', '2024-05-16 02:30:00', '2024-05-16 03:40:00'),
('olivia_wilson@hotmail.com', '2024-05-16 01:40:00', '2024-05-16 02:50:00'),
('jason.smith@example.com', '2024-05-16 00:55:00', '2024-05-16 02:05:00'),
('mia_johnson@gmail.com', '2024-05-15 23:45:00', '2024-05-16 00:55:00'),
('ryan.miller@yahoo.com', '2024-05-15 22:30:00', '2024-05-15 23:40:00'),
('kelly_williams@example.com', '2024-05-15 21:15:00', '2024-05-15 22:25:00'),
('steven_taylor@gmail.com', '2024-05-15 20:25:00', '2024-05-15 21:35:00'),
('jessica_adams@example.com', '2024-05-15 19:35:00', '2024-05-15 20:45:00');

