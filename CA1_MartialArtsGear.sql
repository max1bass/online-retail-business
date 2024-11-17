# Databases for Analytics
# CA1 Project: Online Retail Business
# Created by Nikolaos Gkmpenompa 
# My business is an online store with gear for combat sports (Muay Thai, MMA, Boxing, Brazilian Jiu-Jitsu)

DROP DATABASE IF EXISTS MartialArtsGear;

CREATE DATABASE MartialArtsGear;

USE MartialArtsGear;

# Creating the Customers table
CREATE TABLE Customers(
   CustomerID varchar(50),
   FirstName varchar(50) not null,
   LastName varchar(50) not null,
   Email varchar(50),
   Phone varchar(20),
   Address varchar(50),
   City varchar(50),
   Country varchar(50),
   PostalCode varchar(20),
   CreditCard varchar(50),
   primary key (CustomerID)
);

# Creating the Suppliers table
CREATE TABLE Suppliers(
   SupplierID varchar(50),
   SupplierName varchar(50),
   SupplierEmail varchar(50),
   SupplierPhone varchar(20),
   SupplierAddress varchar(50),
   SupplierCity varchar(50),
   SupplierCountry varchar(50),
   primary key (SupplierID)
);

# Creating the Products/Stock table
CREATE TABLE Products(
   ProductID varchar(50),
   SupplierID varchar(50),
   ProductName varchar(50),
   ProductPrice decimal(10,2),
   StockQuantity int,
   primary key (ProductID)
);

# Creating the Orders table
CREATE TABLE Orders (
    OrderID varchar(50),
    CustomerID varchar(50),
    ProductID varchar(50),
    Quantity int,
    ProductPrice decimal(10,2),
    OrderDate date,
    primary key (OrderID),
    foreign key (CustomerID) references Customers(CustomerID),
    foreign key (ProductID) references Products(ProductID)
);

# Creating the Payments table
CREATE TABLE Payments(
   PaymentID varchar(50),
   OrderID varchar(50),
   TotalCost decimal(10,2),
   PaymentService varchar(50),
   PaymentDate date,
   primary key (PaymentID),
   foreign key (OrderID) references Orders(OrderID)
);

# Creating the Returns table
CREATE TABLE Returns(
    ReturnID varchar(50),
    OrderID varchar(50),
    ProductID varchar(50),
    CustomerID varchar(50),
    ReturnDate date,
    ReturnReason varchar(50),
    Refund decimal(10, 2),
    primary key (ReturnID),
    foreign key (OrderID) references Payments(OrderID),
    foreign key (ProductID) references Products(ProductID)
);

#ENTRIES

# Inserting values to the Products table
INSERT INTO Products (ProductID, SupplierID, ProductName, ProductPrice, StockQuantity)
VALUES
('P01', 'S01', 'Boxing Gloves 14oz', 80.00, 15),
('P02', 'S01', 'Muay Thai Shorts - Large', 35.00, 20),
('P03', 'S01', 'Muay Thai Shorts - Medium', 35.00, 20),
('P04', 'S01', 'Muay Thai Shorts - XL', 35.00, 20),
('P05', 'S01', 'Knee Pads', 25.00, 30),
('P06', 'S01', 'Shin Guards', 60.00, 25),
('P07', 'S02', 'Boxing Gloves 12oz', 90.00, 20),
('P08', 'S02', 'Mouth Guard', 15.00, 30),
('P09', 'S02', 'Boxing Hand Wraps', 15.00, 40),
('P10', 'S02', 'Boxing Gloves 16oz', 85.00, 15), 
('P11', 'S02', 'Wrist Bands', 10.00, 20),
('P12', 'S02', 'Punching Bag', 100.00, 10),
('P13', 'S03', 'BJJ Gi - White', 100.00, 10),
('P14', 'S03', 'BJJ Gi - Black', 100.00, 10),
('P15', 'S03', 'Jiu-Jitsu Belt - White', 35.00, 20),
('P16', 'S03', 'Grappling Dummy', 200.00, 10),
('P17', 'S03', 'Jiu-Jitsu Belt - Brown', 40.00, 10),
('P18', 'S03', 'Jiu-Jitsu Belt - Blue', 30.00, 20),
('P19', 'S04', 'Sparring Headgear', 45.00, 20),
('P20', 'S04', 'Boxing Gloves 16oz', 80.00, 25),
('P21', 'S04', 'Kick Shield', 60.00, 20),
('P22', 'S04', 'Thai Pads', 80.00, 15),
('P23', 'S04', 'Boxing Gloves 12oz', 90.00, 15),
('P24', 'S04', 'Kickboxing Pants - Large', 45.00, 30),
('P25', 'S05', 'Groin Guard', 30.00, 20),
('P26', 'S05', 'MMA Gloves - Red', 50.00, 15),
('P27', 'S05', 'MMA Gloves - Black', 50.00, 15),
('P28', 'S05', 'Boxing Headgear', 50.00, 20),
('P29', 'S05', 'Boxing Punching Bag', 100.00, 10),
('P30', 'S05', 'Mouth Guard Case', 5.00, 20);

# Inserting values to the Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail, SupplierPhone, SupplierAddress, SupplierCity, SupplierCountry)
VALUES
('S01', 'Fairtex', 'fairtex@google.com', '353849541000', '06 Henry House', 'Dublin', 'Ireland'),
('S02', 'Adidas', 'adidas@google.com', '353849542000', '18 Mount Joy Square', 'Dublin', 'Ireland'),
('S03', 'Tatami', 'tatami@google.com', '353849543000', '14 Camden Avenue', 'Cork', 'Ireland'),
('S04', 'TwinsSpecial', 'twinsspecial@google.com', '353849544000', '195 Connoly Road', 'Dublin', 'Ireland'),
('S05', 'Venum', 'venum@google.com', '44849545000', '150 Summerhouse Road', 'London', 'United Kingdom');

# Inserting values to the Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, Country, PostalCode, CreditCard)
VALUES
('C01', 'Letta', 'Larrett', 'llarrett0@delicious.com', '2591882988', '05978 Vermont Avenue', 'Eadestown', 'Ireland', 'A86', '6371203294564545'),
('C02', 'Cam', 'Earnshaw', 'cearnshaw1@ycombinator.com', '1365887155', '32408 Kings Court', 'Lucan', 'Ireland', 'K78', '5263940491998421'),
('C03', 'Goldy', 'Charnley', 'gcharnley2@msn.com', '7274507357', '2466 Hooker Crossing', 'Veldhoven', 'Netherlands', '5509', '4913700283727843'),
('C04', 'Marty', 'Callan', 'mcallan3@altervista.org', '9097046269', '746 Gateway Hill', 'Hamburg', 'Germany', '22339', '675922156746057474'),
('C05', 'Benyamin', 'Crowche', 'bcrowche4@gnu.org', '9382792313', '57779 Pennsylvania Road', 'Aberdeen', 'United Kingdom', 'AB39', '3547306826966819'),
('C06', 'Paton', 'Dono', 'pdono5@hibu.com', '5305162221', '7 Moulton Way', 'Middelburg', 'Netherlands', '4334', '3571649376093404'),
('C07', 'Mahalia', 'Iacavone', 'miacavone6@arizona.edu', '4437493019', '6 New Castle Point', 'Almere Haven', 'Netherlands', '1354', '3565635299070544'),
('C08', 'Fidela', 'Voas', 'fvoas7@usatoday.com', '9939931489', '93804 Sunfield Trail', 'Adare', 'Ireland', 'H54', '3589351388601254'),
('C09', 'Barris', 'Shackel', 'bshackel8@hp.com', '7996805504', '664 Novick Crossing', 'Karlsruhe', 'Germany', '76199', '4508766790370162'),
('C10', 'Ram', 'Westbury', 'rwestbury9@aboutads.info', '7581099143', '893 Stephen Parkway', 'Heerlen', 'Netherlands', 'H6404', '3547264111947327'),
('C11', 'Aggie', 'Tasker', 'ataskera@whitehouse.gov', '6247858257', '4529 Spaight Point', 'Milltown', 'Ireland', 'D04', '5610114833524069'),
('C12', 'Fianna', 'Boow', 'fboowb@gravatar.com', '7674224708', '21 Claremont Point', 'Tilburg', 'Netherlands', '5044', '3545987521498950'),
('C13', 'Melania', 'Crutchley', 'mcrutchleyc@networksolutions.com', '8703689724', '5488 Almo Pass', 'Etten-Leur', 'Netherlands', 'E4874', '3531565639553233'),
('C14', 'Desdemona', 'Simpson', 'dsimpsond@w3.org', '3627886295', '52590 Brentwood Alley', 'Stuttgart', 'Germany', '70374', '3528704140981063'),
('C15', 'Catha', 'Sargant', 'csargante@about.com', '4187778024', '112 Lakewood Pass', 'Neuss', 'Germany', '41468', '5100138758601336'),
('C16', 'Kayle', 'Lindwall', 'klindwallf@163.com', '7385300691', '00 Stoughton Avenue', 'Piltown', 'Ireland', 'T34', '5484117278958836'),
('C17', 'Cris', 'Aspy', 'caspyg@sohu.com', '4717195495', '89710 Muir Parkway', 'Aberdeen', 'United Kingdom', 'AB39', '3564932865562413'),
('C18', 'Palmer', 'Iglesias', 'piglesiash@ebay.co.uk', '1709153792', '901 Melrose Terrace', 'Arnhem', 'Netherlands', '6814', '4405175146312312'),
('C19', 'Carmelita', 'Isitt', 'cisitti@reference.com', '2305178379', '12 Claremont Circle', 'Kingston', 'United Kingdom', 'DT10', '5602252086694807'),
('C20', 'Nikki', 'Conley', 'nconleyj@dailymotion.com', '9828521988', '8013 Maywood Circle', 'Hatton', 'United Kingdom', 'CV35', '4175009165123391'),
('C21', 'Byrle', 'Towndrow', 'btowndrowk@kickstarter.com', '7966751765', '74757 Porter Drive', 'Hamburg', 'Germany', '22339', '3587145932097718'),
('C22', 'Leeann', 'Riccardini', 'lriccardinil@hibu.com', '5617812404', '83 Kropf Junction', 'Skerries', 'Ireland', 'K34', '490343540495135133'),
('C23', 'Merle', 'Thoresbie', 'mthoresbiem@state.gov', '8455968692', '88 Norway Maple Pass', 'Heemskerk', 'Netherlands', '1964', '5048374008464663'),
('C24', 'Carney', 'McAndie', 'cmcandien@histats.com', '9953331431', '5 Spaight Parkway', 'Amsterdam Binnenstad en Oostelijk Havengebied', 'Netherlands', 'N1019', '6762393962223503'),
('C25', 'Rafa', 'Duggan', 'rduggano@noaa.gov', '7586339932', '8 Columbus Avenue', 'Hannover', 'Germany', '30167', '3532012060038003'),
('C26', 'Seka', 'Londer', 'slonderp@multiply.com', '2683792842', '0 Hagan Terrace', 'Beaumont', 'Ireland', 'D17', '5100144601203403'),
('C27', 'Barnebas', 'Exton', 'bextonq@networkadvertising.org', '6258415384', '78754 Ridgeway Alley', 'Leixlip', 'Ireland', 'A86', '3551790561706030'),
('C28', 'Lucas', 'Thirlaway', 'lthirlawayr@bravesites.com', '3996958110', '25979 Troy Way', 'Beaumont', 'Ireland', 'D17', '5581949360895597'),
('C29', 'Cristal', 'Enderlein', 'cenderleins@utexas.edu', '9124739132', '21126 Delaware Park', 'Virginia', 'Ireland', 'D18', '3579887589503668'),
('C30', 'Vick', 'Bouchier', 'vbouchiert@upenn.edu', '7868121039', '89019 Shoshone Drive', 'Osnabrück', 'Germany', '49082', '493616066409410127');

# Inserting values to the Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, ProductPrice, OrderDate) 
VALUES
('O01', 'C01', 'P01', 1, 80.00, '2024-04-10'),
('O02', 'C01', 'P08', 1, 30.00, '2024-04-10'),
('O03', 'C02', 'P15', 1, 35.00, '2024-03-15'),
('O04', 'C03', 'P21', 1, 60.00, '2024-02-20'),
('O05', 'C03', 'P03', 1, 35.00, '2024-03-05'),
('O06', 'C03', 'P07', 1, 90.00, '2024-03-05'),
('O07', 'C04', 'P25', 1, 30.00, '2024-04-05'),
('O08', 'C04', 'P17', 1, 50.00, '2024-04-05'),
('O09', 'C05', 'P02', 1, 35.00, '2024-03-10'),
('O10', 'C05', 'P19', 1, 45.00, '2024-03-10'),
('O11', 'C06', 'P28', 1, 50.00, '2024-04-03'),
('O12', 'C06', 'P10', 1, 85.00, '2024-04-03'),
('O13', 'C07', 'P27', 1, 50.00, '2024-02-15'),
('O14', 'C07', 'P29', 1, 100.00, '2024-02-15'),
('O15', 'C08', 'P06', 1, 60.00, '2024-04-08'),
('O16', 'C08', 'P04', 1, 35.00, '2024-04-08'),
('O17', 'C09', 'P11', 1, 10.00, '2024-03-25'),
('O18', 'C09', 'P14', 1, 100.00, '2024-03-25'),
('O19', 'C10', 'P23', 1, 90.00, '2024-04-01'),
('O20', 'C10', 'P22', 1, 80.00, '2024-04-01'),
('O21', 'C11', 'P18', 1, 30.00, '2024-03-12'),
('O22', 'C11', 'P16', 1, 200.00, '2024-03-12'),
('O23', 'C12', 'P30', 1, 5.00, '2024-02-25'),
('O24', 'C12', 'P09', 1, 15.00, '2024-02-25'),
('O25', 'C13', 'P26', 1, 50.00, '2024-02-10'),
('O26', 'C13', 'P12', 1, 100.00, '2024-02-10'),
('O27', 'C14', 'P05', 1, 25.00, '2024-02-28'),
('O28', 'C14', 'P20', 1, 80.00, '2024-02-28'),
('O29', 'C15', 'P24', 1, 45.00, '2024-02-05'),
('O30', 'C15', 'P13', 1, 100.00, '2024-02-05'),
('O31', 'C16', 'P01', 1, 80.00, '2024-04-07'),
('O32', 'C16', 'P08', 1, 30.00, '2024-04-07'),
('O33', 'C17', 'P15', 1, 35.00, '2024-03-20'),
('O34', 'C17', 'P21', 1, 60.00, '2024-03-20'),
('O35', 'C18', 'P03', 1, 35.00, '2024-03-01'),
('O36', 'C18', 'P07', 1, 90.00, '2024-03-01'),
('O37', 'C19', 'P25', 1, 30.00, '2024-04-12'),
('O38', 'C19', 'P17', 1, 50.00, '2024-04-12'),
('O39', 'C20', 'P02', 1, 35.00, '2024-03-22'),
('O40', 'C20', 'P19', 1, 45.00, '2024-03-22'),
('O41', 'C21', 'P28', 1, 50.00, '2024-04-02'),
('O42', 'C21', 'P10', 1, 85.00, '2024-04-02'),
('O43', 'C22', 'P27', 1, 50.00, '2024-02-20'),
('O44', 'C22', 'P29', 1, 100.00, '2024-02-20'),
('O45', 'C23', 'P06', 1, 60.00, '2024-04-10'),
('O46', 'C23', 'P04', 1, 35.00, '2024-04-10'),
('O47', 'C24', 'P11', 1, 10.00, '2024-03-05'),
('O48', 'C24', 'P14', 1, 100.00, '2024-03-05'),
('O49', 'C25', 'P23', 1, 90.00, '2024-04-09'),
('O50', 'C25', 'P22', 1, 80.00, '2024-04-09'),
('O51', 'C26', 'P18', 1, 30.00, '2024-03-30'),
('O52', 'C26', 'P16', 1, 200.00, '2024-03-30'),
('O53', 'C27', 'P30', 1, 5.00, '2024-02-15'),
('O54', 'C27', 'P09', 1, 15.00, '2024-02-15'),
('O55', 'C28', 'P26', 1, 50.00, '2024-02-05'),
('O56', 'C28', 'P12', 1, 100.00, '2024-02-05'),
('O57', 'C29', 'P05', 1, 25.00, '2024-03-05'),
('O58', 'C29', 'P20', 1, 80.00, '2024-03-05'),
('O59', 'C30', 'P24', 1, 45.00, '2024-04-11'),
('O60', 'C30', 'P13', 1, 100.00, '2024-04-11'),
('O61', 'C01', 'P01', 1, 80.00, '2024-04-09'),
('O62', 'C01', 'P08', 1, 30.00, '2024-04-09'),
('O63', 'C02', 'P15', 1, 35.00, '2024-03-12'),
('O64', 'C02', 'P21', 1, 60.00, '2024-03-12'),
('O65', 'C03', 'P03', 1, 35.00, '2024-02-18'),
('O66', 'C03', 'P07', 1, 90.00, '2024-02-18'),
('O67', 'C04', 'P25', 1, 30.00, '2024-03-30'),
('O68', 'C04', 'P17', 1, 50.00, '2024-03-30'),
('O69', 'C05', 'P02', 1, 35.00, '2024-04-13'),
('O70', 'C05', 'P19', 1, 45.00, '2024-04-13');

# Inserting values to the Payments table
INSERT INTO Payments (PaymentID,OrderID,TotalCost,PaymentService,PaymentDate)
VALUES 
('01', 'O01', 80.00, 'creditcard', '2024-04-10'),
('02', 'O02', 30.00, 'creditcard', '2024-04-10'),
('03', 'O03', 35.00, 'creditcard', '2024-03-15'),
('04', 'O04', 60.00, 'creditcard', '2024-02-20'),
('05', 'O05', 35.00, 'creditcard', '2024-03-05'),
('06', 'O06', 90.00, 'creditcard', '2024-03-05'),
('07', 'O07', 30.00, 'creditcard', '2024-04-05'),
('08', 'O08', 50.00, 'creditcard', '2024-04-05'),
('09', 'O09', 35.00, 'creditcard', '2024-03-10'),
('10', 'O10', 45.00, 'creditcard', '2024-03-10'),
('11', 'O11', 50.00, 'creditcard', '2024-04-03'),
('12', 'O12', 85.00, 'creditcard', '2024-04-03'),
('13', 'O13', 50.00, 'creditcard', '2024-02-15'),
('14', 'O14', 100.00, 'creditcard', '2024-02-15'),
('15', 'O15', 60.00, 'paypal', '2024-04-08'),
('16', 'O16', 35.00, 'paypal', '2024-04-08'),
('17', 'O17', 10.00, 'creditcard', '2024-03-25'),
('18', 'O18', 100.00, 'creditcard', '2024-03-25'),
('19', 'O19', 90.00, 'creditcard', '2024-04-01'),
('20', 'O20', 80.00, 'creditcard', '2024-04-01'),
('21', 'O21', 30.00, 'paypal', '2024-03-12'),
('22', 'O22', 200.00, 'paypal', '2024-03-12'),
('23', 'O23', 5.00, 'creditcard', '2024-02-25'),
('24', 'O24', 15.00, 'creditcard', '2024-02-25'),
('25', 'O25', 50.00, 'creditcard', '2024-02-10'),
('26', 'O26', 100.00, 'creditcard', '2024-02-10'),
('27', 'O27', 25.00, 'paypal', '2024-02-28'),
('28', 'O28', 80.00, 'paypal', '2024-02-28'),
('29', 'O29', 45.00, 'creditcard', '2024-02-05'),
('30', 'O30', 100.00, 'creditcard', '2024-02-05'),
('31', 'O31', 80.00, 'creditcard', '2024-04-07'),
('32', 'O32', 30.00, 'creditcard', '2024-04-07'),
('33', 'O33', 35.00, 'paypal', '2024-03-20'),
('34', 'O34', 60.00, 'paypal', '2024-03-20'),
('35', 'O35', 35.00, 'creditcard', '2024-03-01'),
('36', 'O36', 90.00, 'creditcard', '2024-03-01'),
('37', 'O37', 30.00, 'creditcard', '2024-04-12'),
('38', 'O38', 50.00, 'creditcard', '2024-04-12'),
('39', 'O39', 35.00, 'paypal', '2024-03-22'),
('40', 'O40', 45.00, 'paypal', '2024-03-22'),
('41', 'O41', 50.00, 'creditcard', '2024-04-02'),
('42', 'O42', 85.00, 'paypal', '2024-04-02'),
('43', 'O43', 50.00, 'creditcard', '2024-02-20'),
('44', 'O44', 100.00, 'creditcard', '2024-02-20'),
('45', 'O45', 60.00, 'paypal', '2024-04-10'),
('46', 'O46', 35.00, 'creditcard', '2024-04-10'),
('47', 'O47', 10.00, 'creditcard', '2024-03-05'),
('48', 'O48', 100.00, 'paypal', '2024-03-05'),
('49', 'O49', 90.00, 'creditcard', '2024-04-09'),
('50', 'O50', 80.00, 'creditcard', '2024-04-09'),
('51', 'O51', 30.00, 'paypal', '2024-03-30'),
('52', 'O52', 200.00, 'creditcard', '2024-03-30'),
('53', 'O53', 5.00, 'creditcard', '2024-02-15'),
('54', 'O54', 15.00, 'paypal', '2024-02-15'),
('55', 'O55', 50.00, 'creditcard', '2024-02-05'),
('56', 'O56', 100.00, 'creditcard', '2024-02-05'),
('57', 'O57', 25.00, 'paypal', '2024-03-05'),
('58', 'O58', 80.00, 'creditcard', '2024-03-05'),
('59', 'O59', 45.00, 'creditcard', '2024-04-11'),
('60', 'O60', 100.00, 'paypal', '2024-04-11'),
('61', 'O61', 80.00, 'creditcard', '2024-04-09'),
('62', 'O62', 30.00, 'creditcard', '2024-04-09'),
('63', 'O63', 35.00, 'paypal', '2024-03-12'),
('64', 'O64', 60.00, 'creditcard', '2024-03-12'),
('65', 'O65', 35.00, 'creditcard', '2024-02-18'),
('66', 'O66', 90.00, 'paypal', '2024-02-18'),
('67', 'O67', 30.00, 'creditcard', '2024-03-30'),
('68', 'O68', 50.00, 'creditcard', '2024-03-30'),
('69', 'O69', 35.00, 'paypal', '2024-04-13'),
('70', 'O70', 45.00, 'paypal', '2024-04-13');

# Inserting values to the Returns table
INSERT INTO Returns (ReturnID, OrderID, ProductID, CustomerID, ReturnDate, ReturnReason, Refund) 
VALUES
('R01', 'O13', 'P27', 'C07', '2024-02-25', 'Damaged or defective product', 50.00),
('R02', 'O14', 'P29', 'C07', '2024-02-25', 'Wrong product delivered', 100.00),
('R03', 'O19', 'P23', 'C10', '2024-04-15', 'Order arrived too late', 90.00),
('R04', 'O20', 'P22', 'C10', '2024-04-15', 'Order arrived too late',  80.00),
('R05', 'O21', 'P18', 'C11', '2024-03-19', 'Wrong product delivered', 30.00),
('R06', 'O24', 'P09', 'C12', '2024-02-28', 'Wrong product ordered', 15.00),
('R07', 'O28', 'P20', 'C14', '2024-03-05', 'Order arrived too late', 80.00),
('R08', 'O32', 'P08', 'C16', '2024-04-15', 'Damaged or defective product', 30.00),
('R09', 'O34', 'P21', 'C17', '2024-03-30', 'Wrong product ordered', 60.00),
('R10', 'O67', 'P25', 'C04', '2024-04-10', 'Damaged or defective product', 30.00);

#PART B

#Query 1 (View) - Create a View showing all transactions for a given week in your business.
CREATE VIEW WeekTransactions AS
SELECT Orders.OrderID, Customers.CustomerID, Customers.FirstName, Customers.LastName, Products.ProductName, Orders.Quantity, 
Orders.ProductPrice, Orders.OrderDate, Payments.PaymentID, Payments.TotalCost, Payments.PaymentService, Payments.PaymentDate
	FROM Orders
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
	INNER JOIN Products ON Orders.ProductID = Products.ProductID
	INNER JOIN Payments ON Orders.OrderID =  Payments.OrderID
WHERE Payments.PaymentDate >= '2024-04-01'
AND Payments.PaymentDate < '2024-04-07';

#SELECT * FROM WeekTransactions;


#Query 2 (Trigger) - Create a Trigger that stores stock levels once a sale takes place. 
DELIMITER $$
CREATE TRIGGER StockLevel
AFTER INSERT ON Orders
FOR EACH ROW 
BEGIN
	UPDATE Products
	SET StockQuantity = StockQuantity - NEW.quantity
	WHERE ProductID = NEW.ProductID;
END $$
DELIMITER ;

#SELECT * FROM Products;

#Placing an order to check that the trigger actually works
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, ProductPrice, OrderDate) 
VALUES
('O71', 'C30', 'P04', 3, 20.00, '2024-04-10');

#SELECT * FROM Products;


#Query 3 (View) - Create a View of stock (by supplier) purchased by you.
CREATE VIEW MyPurchasedStock AS
	SELECT Products.ProductID, Products.ProductName, Products.StockQuantity, Suppliers.SupplierName
	FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

#SELECT * FROM MyPurchasedStock;


#Query 4 (View) - Create a View of total stock sold to general public (group by supplier).
#Since all my customers are "public" the script below is applicable. 
#If I had different types of customers like "public", "business" etc. Before GROUPBY I would add: WHERE Customers.CustomerType = 'Public'
CREATE VIEW TotalStockSold AS
	SELECT Products.SupplierID, Suppliers.SupplierName, SUM(Orders.Quantity) AS TotalStockSold
	FROM Orders
	JOIN Products ON Orders.ProductID = Products.ProductID
	JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY Products.SupplierID, Suppliers.SupplierName;

#SELECT * FROM TotalStockSold;


#Query 5 - Detail and total all transactions (SALES) for the month-to-date. (A Group By with Roll-Up) – 1 month
DELIMITER $$
CREATE PROCEDURE month_to_date_transactions(current_month INT, current_year INT)
BEGIN
    SELECT 
        COALESCE(OrderDate, 'Total') AS OrderDate,
        OrderID,
        SUM(ProductPrice) AS TotalPrice,
        SUM(Quantity) AS TotalQuantity,
        CustomerID
    FROM orders
		WHERE MONTH(OrderDate) = current_month AND YEAR(OrderDate) = current_year
	GROUP BY OrderDate, OrderID, CustomerID WITH ROLLUP; 
END $$
DELIMITER ;

#CALL month_to_date_transactions(MONTH(CURRENT_DATE()), YEAR(CURRENT_DATE()));


#Query 6 - Detail and total all SALES for the year-to-date. (A Group By with Roll-Up) – All months 
DELIMITER $$
CREATE PROCEDURE year_to_date_transactions(current_year INT)
BEGIN
    SELECT 
        COALESCE(MONTH(OrderDate), 'Total') AS Month,
        COALESCE(YEAR(OrderDate), current_year) AS Year,
        OrderID,
        SUM(ProductPrice) AS TotalPrice,
        SUM(Quantity) AS TotalQuantity,
        CustomerID
    FROM orders
    WHERE YEAR(OrderDate) = current_year
    GROUP BY COALESCE(YEAR(OrderDate), current_year), COALESCE(MONTH(OrderDate), 'Total'), OrderID, CustomerID, OrderDate WITH ROLLUP; 
END $$
DELIMITER ;

#CALL year_to_date_transactions(YEAR(CURRENT_DATE()));


#Query 7 - Display the growth in sales/services (as a percentage) for your business, from the 1st month of opening until now.
SELECT 
    CONCAT(FORMAT(((SUM(Orders.TotalAmount) - first_month_sales) / first_month_sales) * 100, 2), "%") AS sales_growth_percentage
FROM 
    (SELECT 
         SUM(ProductPrice) AS first_month_sales
     FROM Orders
     WHERE YEAR(OrderDate) = 2024 AND MONTH(OrderDate) = 2) AS first_sales,
    (SELECT 
         YEAR(OrderDate) AS year, 
         MONTH(OrderDate) AS month, 
         SUM(ProductPrice) AS TotalAmount
     FROM Orders
     WHERE (YEAR(OrderDate) = 2024 AND MONTH(OrderDate) >= 2) OR (YEAR(OrderDate) = 2024 AND MONTH(OrderDate) <= 4)
     GROUP BY YEAR(OrderDate), MONTH(OrderDate)) AS Orders
GROUP BY first_month_sales;


#Query 8 - Display all returns to date.
#SELECT * FROM returns;


#Creating a Data Mart containing the results ONLY from Views (Questions 1, 3 and 4)
CREATE DATABASE DataMart;
USE DataMart;

#Query 1 (View) - View all transactions for a given week in your business.
CREATE TABLE DataMart.WeekTransactions AS SELECT * FROM MartialArtsGear.WeekTransactions;
#select * from WeekTransactions;

#Query 3 (View) - View of stock (by supplier) purchased by you.
CREATE TABLE DataMart.MyPurchasedStock AS SELECT * FROM MartialArtsGear.MyPurchasedStock;
#select * from MyPurchasedStock;

#Query 4 (View) - View of total stock sold to general public (group by supplier).
CREATE TABLE DataMart.TotalStockSold AS SELECT * FROM MartialArtsGear.TotalStockSold;
#select * from TotalStockSold;