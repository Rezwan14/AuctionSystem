-- Project Step 4: Auction System
-- By: Rezwan Rahman
-- Date: 12/21/2024

CREATE DATABASE IF NOT EXISTS AuctionSystem;
USE AuctionSystem;

-- User table 
CREATE TABLE IF NOT EXISTS `User` (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address TEXT
);

-- Category table
CREATE TABLE IF NOT EXISTS Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

-- Item table
CREATE TABLE IF NOT EXISTS Item (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    StartPrice DECIMAL(10, 2) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Auction table
CREATE TABLE IF NOT EXISTS Auction (
    AuctionID INT AUTO_INCREMENT PRIMARY KEY,
    AuctionTitle VARCHAR(100) NOT NULL,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    AuctionStatus VARCHAR(50) NOT NULL,
    UserID INT NOT NULL,
    ItemID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES `User`(UserID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);

-- Bid table
CREATE TABLE IF NOT EXISTS Bid (
    BidID INT AUTO_INCREMENT PRIMARY KEY,
    BidAmount DECIMAL(10, 2) NOT NULL,
    BidTime DATETIME NOT NULL,
    UserID INT NOT NULL,
    AuctionID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES `User`(UserID),
    FOREIGN KEY (AuctionID) REFERENCES Auction(AuctionID)
);

-- Payment table
CREATE TABLE IF NOT EXISTS Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentType VARCHAR(50) NOT NULL,
    PaymentDate DATETIME NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    UserID INT NOT NULL,
    AuctionID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES `User`(UserID),
    FOREIGN KEY (AuctionID) REFERENCES Auction(AuctionID)
);

-- Review table
CREATE TABLE IF NOT EXISTS Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    RatingComment TEXT,
    ItemID INT NOT NULL,
    UserID INT NOT NULL,
    AuctionID INT NOT NULL,
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
    FOREIGN KEY (UserID) REFERENCES `User`(UserID),
    FOREIGN KEY (AuctionID) REFERENCES Auction(AuctionID)
);

-- Disable foreign key checks to truncate tables
SET FOREIGN_KEY_CHECKS = 0;

-- Truncate all tables to reset data
TRUNCATE TABLE Review;
TRUNCATE TABLE Payment;
TRUNCATE TABLE Bid;
TRUNCATE TABLE Auction;
TRUNCATE TABLE Item;
TRUNCATE TABLE Category;
TRUNCATE TABLE `User`;

-- Enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- 20 users inserted
INSERT INTO `User` (UserName, Password, Email, PhoneNumber, Address) VALUES 
    ('AliKhan', 'ali123password', 'ali.khan1@example.com', '111-222-3333', '123 Crescent St'), 
    ('FatimaRahman', 'fatima456password', 'fatima.rahman1@example.com', '222-333-4444', '456 Noor Ave'),
    ('AishaAhmed', 'aisha789password', 'aisha.ahmed1@example.com', '333-444-5555', '789 Huda Ln'),
    ('OmarHassan', 'omar123password', 'omar.hassan1@example.com', '444-555-6666', '321 Iqra St'),
    ('YusufAli', 'yusuf456password', 'yusuf.ali1@example.com', '555-666-7777', '654 Mecca Rd'),
    ('MaryamSheikh', 'maryam789password', 'maryam.sheikh1@example.com', '666-777-8888', '987 Medina Ct'),
    ('HassanKhan', 'hassan123password', 'hassan.khan1@example.com', '777-888-9999', '123 Crescent Ave'),
    ('ZainabMalik', 'zainab456password', 'zainab.malik1@example.com', '888-999-0000', '456 Noor St'),
    ('BilalAhmed', 'bilal789password', 'bilal.ahmed1@example.com', '999-000-1111', '789 Huda Ave'),
    ('SumayyaRizwan', 'sumayya123password', 'sumayya.rizwan1@example.com', '000-111-2222', '321 Iqra Ln'),
    ('ImranQureshi', 'imran456password', 'imran.qureshi1@example.com', '111-333-5555', '654 Mecca Blvd'),
    ('LaylaHassan', 'layla789password', 'layla.hassan1@example.com', '222-444-6666', '987 Medina Blvd'),
    ('FaisalShaikh', 'faisal123password', 'faisal.shaikh1@example.com', '333-555-7777', '123 Crescent Rd'),
    ('AminaFarooq', 'amina456password', 'amina.farooq1@example.com', '444-666-8888', '456 Noor Ln'),
    ('ZaydAnwar', 'zayd789password', 'zayd.anwar1@example.com', '555-777-9999', '789 Huda Blvd'),
    ('NoorAli', 'noor123password', 'noor.ali1@example.com', '666-888-0000', '321 Iqra Blvd'),
    ('IbrahimKhan', 'ibrahim456password', 'ibrahim.khan1@example.com', '777-999-1111', '654 Mecca Ln'),
    ('KhadijaMalik', 'khadija789password', 'khadija.malik1@example.com', '888-000-2222', '987 Medina St'),
    ('TariqHassan', 'tariq123password', 'tariq.hassan1@example.com', '999-111-3333', '123 Crescent Blvd'),
    ('SanaFarooq', 'sana456password', 'sana.farooq1@example.com', '000-222-4444', '456 Noor Ct');

    -- 20 category names inserted that retrieve
INSERT INTO Category (CategoryName) VALUES 
    ('Electronics'),
    ('Books'),
    ('Home Appliances'),
    ('Electronics'),
    ('Books'),
    ('Home Appliances'),
    ('Electronics'),
    ('Books'),
    ('Home Appliances'),
    ('Electronics'),
    ('Books'),
    ('Home Appliances'),
    ('Electronics'),
    ('Books'),
    ('Home Appliances'),
    ('Electronics'),
    ('Books'),
    ('Home Appliances'),
    ('Electronics'),
    ('Books');
    
-- 20 Items inserted
INSERT INTO Item (ItemName, Description, StartPrice, CategoryID) VALUES 
    ('Smartphone', 'Latest model smartphone', 699.99, 1),
    ('Fiction Book', 'A best-selling novel', 15.99, 2),
    ('Blender', 'High-speed blender', 89.99, 3),
    ('Smartwatch', 'Feature-rich smartwatch', 199.99, 1),
    ('Non-Fiction Book', 'Inspirational biography', 20.99, 2),
    ('Microwave Oven', 'Compact microwave oven', 120.49, 3),
    ('Gaming Laptop', 'High-performance gaming laptop', 1299.99, 1),
    ('Cookbook', 'Healthy cooking recipes', 25.49, 2),
    ('Vacuum Cleaner', 'Powerful vacuum cleaner', 150.00, 3),
    ('Headphones', 'Noise-canceling headphones', 299.99, 1),
    ('Science Fiction Book', 'Futuristic science fiction novel', 18.99, 2),
    ('Air Conditioner', 'Energy-efficient AC unit', 499.99, 3),
    ('Tablet', 'Portable high-resolution tablet', 399.99, 1),
    ('Mystery Book', 'Gripping mystery novel', 14.99, 2),
    ('Toaster', '4-slice toaster', 35.99, 3),
    ('4K Television', 'Ultra HD Smart TV', 899.99, 1),
    ('Children’s Book', 'Illustrated book for kids', 10.99, 2),
    ('Dishwasher', 'Automatic dishwasher', 699.00, 3),
    ('Wireless Speaker', 'Bluetooth-enabled portable speaker', 99.99, 1),
    ('Romance Book', 'Heartwarming romance novel', 12.99, 2);

INSERT INTO Auction (AuctionTitle, StartTime, EndTime, AuctionStatus, UserID, ItemID) VALUES 
    ('Smartphone Auction', '2024-12-21 10:00:00', '2024-12-28 10:00:00', 'Active', 1, 1),
    ('Fiction Book Auction', '2024-12-22 12:00:00', '2024-12-29 12:00:00', 'Active', 2, 2),
    ('Blender Auction', '2024-12-23 14:00:00', '2024-12-30 14:00:00', 'Completed', 3, 3),
	('Smartwatch Auction', '2024-12-24 10:00:00', '2024-12-31 10:00:00', 'Active', 4, 4),
    ('Non-Fiction Book Auction', '2024-12-24 12:00:00', '2024-12-31 12:00:00', 'Pending', 5, 5),
    ('Microwave Oven Auction', '2024-12-25 14:00:00', '2025-01-01 14:00:00', 'Active', 6, 6),
    ('Gaming Laptop Auction', '2024-12-26 16:00:00', '2025-01-02 16:00:00', 'Active', 7, 7),
    ('Cookbook Auction', '2024-12-27 10:00:00', '2025-01-03 10:00:00', 'Completed', 8, 8),
    ('Vacuum Cleaner Auction', '2024-12-28 12:00:00', '2025-01-04 12:00:00', 'Active', 9, 9),
    ('Headphones Auction', '2024-12-29 14:00:00', '2025-01-05 14:00:00', 'Pending', 10, 10),
    ('Science Fiction Book Auction', '2024-12-30 10:00:00', '2025-01-06 10:00:00', 'Active', 11, 11),
    ('Air Conditioner Auction', '2024-12-30 12:00:00', '2025-01-07 12:00:00', 'Completed', 12, 12),
    ('Tablet Auction', '2024-12-31 10:00:00', '2025-01-07 10:00:00', 'Active', 13, 13),
    ('Mystery Book Auction', '2024-12-31 12:00:00', '2025-01-08 12:00:00', 'Pending', 14, 14),
    ('Toaster Auction', '2025-01-01 14:00:00', '2025-01-08 14:00:00', 'Active', 15, 15),
    ('4K Television Auction', '2025-01-01 16:00:00', '2025-01-09 16:00:00', 'Completed', 16, 16),
    ('Children’s Book Auction', '2025-01-02 10:00:00', '2025-01-10 10:00:00', 'Active', 17, 17),
    ('Dishwasher Auction', '2025-01-02 12:00:00', '2025-01-11 12:00:00', 'Pending', 18, 18),
    ('Wireless Speaker Auction', '2025-01-03 14:00:00', '2025-01-12 14:00:00', 'Active', 19, 19),
    ('Romance Book Auction', '2025-01-03 16:00:00', '2025-01-13 16:00:00', 'Completed', 20, 20);

-- 20 tuples inserted into Bid table
INSERT INTO Bid (BidAmount, BidTime, UserID, AuctionID) VALUES 
    (700.00, '2024-12-21 11:00:00', 2, 1),
    (710.00, '2024-12-21 12:30:00', 3, 1),
    (16.00, '2024-12-22 13:00:00', 4, 2),
	(17.50, '2024-12-23 14:30:00', 5, 2),
    (90.00, '2024-12-23 15:00:00', 6, 3),
    (195.00, '2024-12-24 11:00:00', 7, 4),
    (200.00, '2024-12-24 12:30:00', 8, 4),
    (21.00, '2024-12-25 10:00:00', 9, 5),
    (22.50, '2024-12-25 11:30:00', 10, 5),
    (125.00, '2024-12-25 14:30:00', 11, 6),
    (1300.00, '2024-12-26 15:00:00', 12, 7),
    (1310.00, '2024-12-26 15:45:00', 13, 7),
    (26.00, '2024-12-27 10:30:00', 14, 8),
    (27.50, '2024-12-27 11:45:00', 15, 8),
    (155.00, '2024-12-28 14:00:00', 16, 9),
    (160.00, '2024-12-28 14:30:00', 17, 9),
    (310.00, '2024-12-29 11:00:00', 18, 10),
    (315.00, '2024-12-29 11:45:00', 19, 10),
    (18.00, '2024-12-30 10:00:00', 20, 11),
    (18.50, '2024-12-30 11:00:00', 1, 11);

-- Insert 20 tuples in Payment table
INSERT INTO Payment (PaymentType, PaymentDate, PaymentAmount, UserID, AuctionID) VALUES 
    ('Credit Card', '2024-12-22 15:00:00', 710.00, 3, 1),
    ('PayPal', '2024-12-23 16:00:00', 17.50, 5, 2),
    ('Debit Card', '2024-12-24 17:00:00', 90.00, 6, 3),
    ('Credit Card', '2024-12-25 18:00:00', 200.00, 8, 4),
    ('Bank Transfer', '2024-12-26 19:00:00', 22.50, 10, 5),
    ('PayPal', '2024-12-27 20:00:00', 125.00, 11, 6),
    ('Credit Card', '2024-12-28 21:00:00', 1310.00, 13, 7),
    ('Cash', '2024-12-29 10:00:00', 27.50, 15, 8),
    ('PayPal', '2024-12-30 11:00:00', 160.00, 17, 9),
    ('Credit Card', '2024-12-31 12:00:00', 315.00, 19, 10),
    ('Debit Card', '2025-01-01 13:00:00', 18.50, 1, 11),
    ('PayPal', '2025-01-02 14:00:00', 700.00, 2, 1),
    ('Credit Card', '2025-01-03 15:00:00', 16.50, 4, 2),
    ('Cash', '2025-01-04 16:00:00', 90.00, 5, 3),
    ('Bank Transfer', '2025-01-05 17:00:00', 195.00, 7, 4),
    ('Debit Card', '2025-01-06 18:00:00', 20.00, 9, 5),
    ('PayPal', '2025-01-07 19:00:00', 125.50, 12, 6),
    ('Credit Card', '2025-01-08 20:00:00', 1305.00, 14, 7),
    ('Cash', '2025-01-09 21:00:00', 28.00, 16, 8),
    ('Bank Transfer', '2025-01-10 22:00:00', 310.00, 18, 9);

-- 20 tuples inserted in Review table
INSERT INTO Review (Rating, RatingComment, ItemID, UserID, AuctionID) VALUES 
    (5, 'Excellent product! Worth every penny.', 1, 3, 1),
    (2, 'Book was disappointing and poorly written.', 2, 5, 2),
    (3, 'Blender is functional but very noisy.', 3, 6, 3),
	(5, 'Smartwatch is amazing! Great features.', 4, 8, 4),
	(4, 'Interesting read, but a bit slow in parts.', 5, 10, 5),
	(5, 'Microwave is efficient and compact.', 6, 11, 6),
	(2, 'Laptop overheats during gaming sessions.', 7, 13, 7),
	(3, 'Cookbook recipes are decent but repetitive.', 8, 15, 8),
	(5, 'Vacuum cleaner works perfectly, no issues.', 9, 17, 9),
	(4, 'Headphones have great sound, but build quality could be better.', 10, 19, 10),
	(5, 'Science fiction book was thrilling and engaging.', 11, 1, 11),
	(2, 'Air conditioner is very noisy.', 12, 2, 12),
	(4, 'Tablet is user-friendly, but battery life could be improved.', 13, 4, 13),
	(3, 'Mystery book was okay, but predictable.', 14, 5, 14),
	(1, 'Toaster stopped working after a week.', 15, 7, 15),
	(5, 'TV has stunning visuals and great features.', 16, 9, 16),
	(4, 'Children’s book is delightful and educational.', 17, 10, 17),
	(5, 'Dishwasher is efficient and saves time.', 18, 12, 18),
	(3, 'Wireless speaker is okay but lacks bass.', 19, 14, 19),
	(5, 'Romance book was heartwarming and well-written.', 20, 16, 20);

-- Output all 7 tables with 20 tuples
SELECT * FROM `User`;
SELECT * FROM Category;
SELECT * FROM Item;
SELECT * FROM Auction;
SELECT * FROM Bid;
SELECT * FROM Payment;
SELECT * FROM Review;

-- Testing a JOIN operation
SELECT 
    Auction.AuctionID,
    Auction.AuctionTitle,
    `User`.UserName AS AuctionOwner,
    Item.ItemName AS AuctionItem,
    Auction.StartTime,
    Auction.EndTime,
    Auction.AuctionStatus
FROM 
    Auction
JOIN 
    `User` ON Auction.UserID = `User`.UserID
JOIN 
    Item ON Auction.ItemID = Item.ItemID
WHERE 
    Auction.AuctionStatus = 'Active';
    

-- Here we will have a user place a bid, and output the result
    
-- Drop existing procedures if they exist
DROP PROCEDURE IF EXISTS PlaceBid;
DROP PROCEDURE IF EXISTS ProcessSale;

-- Placing a Bid Transaction
DELIMITER $$

CREATE PROCEDURE PlaceBid(
    IN p_BidAmount DECIMAL(10, 2),
    IN p_BidTime DATETIME,
    IN p_UserID INT,
    IN p_AuctionID INT
)
BEGIN
    DECLARE v_CurrentHighestBid DECIMAL(10, 2);
    
    -- Start the transaction
    START TRANSACTION;

    -- Get the current highest bid for the auction
    SELECT MAX(BidAmount)
    INTO v_CurrentHighestBid
    FROM Bid
    WHERE AuctionID = p_AuctionID;

    -- Check if the bid is higher than the current highest bid
    IF p_BidAmount > IFNULL(v_CurrentHighestBid, 0) THEN
        -- Insert the new bid
        INSERT INTO Bid (BidAmount, BidTime, UserID, AuctionID)
        VALUES (p_BidAmount, p_BidTime, p_UserID, p_AuctionID);
        
        -- Commit the transaction
        COMMIT;
    ELSE
        -- Rollback if the bid is not higher
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Bid amount must be higher than the current highest bid.';
    END IF;
END$$

DELIMITER ;

Processing a Sale Transaction
DELIMITER $$

CREATE PROCEDURE ProcessSale(
    IN p_AuctionID INT,
    IN p_UserID INT,
    IN p_PaymentType VARCHAR(50),
    IN p_PaymentAmount DECIMAL(10, 2),
    IN p_PaymentDate DATETIME
)
BEGIN
    DECLARE v_ItemID INT;
    DECLARE v_SellerID INT;
    DECLARE v_AuctionStatus VARCHAR(50);

    -- Start the transaction
    START TRANSACTION;

    -- Check auction status and retrieve necessary data
    SELECT AuctionStatus, ItemID, UserID
    INTO v_AuctionStatus, v_ItemID, v_SellerID
    FROM Auction
    WHERE AuctionID = p_AuctionID;

    IF v_AuctionStatus = 'Completed' THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Auction has already been processed.';
    ELSE
        -- Mark the auction as completed
        UPDATE Auction
        SET AuctionStatus = 'Completed'
        WHERE AuctionID = p_AuctionID;

        -- Record the payment
        INSERT INTO Payment (PaymentType, PaymentDate, PaymentAmount, UserID, AuctionID)
        VALUES (p_PaymentType, p_PaymentDate, p_PaymentAmount, p_UserID, p_AuctionID);

        -- Commit the transaction
        COMMIT;
    END IF;
END$$

DELIMITER ;

CALL PlaceBid(750.00, '2024-12-22 12:00:00', 2, 1);
SELECT * FROM Bid WHERE AuctionID = 1;
CALL ProcessSale(1, 3, 'Credit Card', 750.00, '2024-12-22 13:00:00');
SELECT * FROM Auction WHERE AuctionID = 1;
SELECT * FROM Payment WHERE AuctionID = 1;

