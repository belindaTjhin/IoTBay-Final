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

-- Add data to ORDERS table:

-- Add data to ORDERLINES table:

-- Add data to DEVICES table:

INSERT INTO devices (id, name, description, price, supplier) 
VALUES 
(1, 'Smart Thermostat', 'A smart thermostat for efficient temperature control', 129.99, 'Smart Home Co.'),
(2, 'Security Camera', 'An IoT security camera with motion detection and night vision', 199.99, 'SecureTech Inc.'),
(3, 'Smart Lock', 'A smart lock for keyless entry with remote access control', 149.99, 'Tech Innovations Ltd.');

-- Add data to PAYMENTMETHODS table:

-- Add data to PRODUCTCATEGORIES table:

-- Set up FOREIGNKEYS:
