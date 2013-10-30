drop database service_bazaar;

create database service_bazaar;

use service_bazaar;

create table User(
	username varchar(30) primary key,
	password varchar(20) check (len(password)>=6),
	latitudeLocation float,
	longitudeLocation float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40)
);

create table Buyer(
	username varchar(30) primary key references User(username),
	password varchar(20) check (len(password)>=6),
	latitudeLocation float,
	longitudeLocation float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40)
);

create table Vendor(
	username varchar(30) primary key references User(username),
	password varchar(20) check (len(password)>=6),
	latitudeLocation float,
	longitudeLocation float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40),
	rating double check(rating >= 0 and rating <=5)
);

create table BuyerVendor(
	username varchar(30) primary key references User(username),
	password varchar(20) check (len(password)>=6),
	latitudeLocation float,
	longitudeLocation float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40),
	rating double check(rating >= 0 and rating <=5)
);

create table Category(
	categoryID integer primary key auto_increment,
	Name varchar(40),
	Description varchar(500)
);

create table Service(
	serviceID integer primary key auto_increment,
	title varchar(100),
	description varchar(500),
	visibility integer
);

create table LiesIn(
	categoryID integer references Category(categoryID),
	serviceID integer references Service(ServiceID),
	primary key(serviceID, categoryID)
);

create table Feedback(
	feedbackID integer primary key auto_increment,
	rating double check (rating >= 0 and rating <= 5),
	review varchar(4000)
);

create table FeedbackFor(
	feedbackID integer references Feedback(feedbackID),
	buyerName varchar(30) references Buyer(username),
	serviceID integer references Service(serviceID),
	primary key(buyerName, serviceID)
);

create table Message(
	messageID integer primary key auto_increment,
	messageDate date,
	subject varchar(100),
	messageText varchar(2000)
);

create table Exchange(
	senderName varchar(30) references User(username),
	receiverName varchar(30) references User(username),
	messageID integer references Message(messageID),
	primary key(senderName, receiverName, messageID)
);

create table Listing(
	serviceID integer,
	listingID integer,
	minPrice float,
	maxPrice float,
	startingTime time,
	endingTime time,
	startDate date,
	endDate date,
	latitudeLocation float,
	longitudeLocation float,
	listingDescription varchar(100),
	availability varchar(20) check(availability='Everywhere' or availability='Restricted' or availability='WalkIn'),
	availabilityDistance double,
	primary key(serviceID, listingID)
);

create table Appointment(
	buyerName varchar(30) references Buyer(username),
	listingID integer references Listing(ListingID),
	serviceID integer references Service(serviceID),
	price float,
	isConfirmed boolean,
	primary key(buyerName, listingID, serviceID)
);

create table RequestedService(
	serviceID integer primary key references Service(serviceID)
);

create table OfferedService(
	serviceID integer primary key references Service(serviceID)
);

create table Requests(
	buyerName varchar(30) references Buyer(username),
	serviceID integer references RequestedService(serviceID),
	primary key(serviceID,buyerName)
	
);

create table Offers(
	vendorName varchar(30) references Vendor(username),
	serviceID integer references OfferedService(serviceID),
	primary key(serviceID, vendorName)
);