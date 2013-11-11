drop database service_bazaar;

create database service_bazaar;

use service_bazaar;

create table buyers(
	username varchar(30) primary key references User(username),
	password varchar(20) check (len(password)>=6),
	latitudeLocation float,
	longitudeLocation float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40)
);

create table vendors(
	username varchar(30) primary key references User(username),
	password varchar(20) check (len(password)>=6),
	latitudeLocation float,
	longitudeLocation float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40),
	rating double check(rating >= 0 and rating <=5)
);

create table buyervendors(
	username varchar(30) primary key references User(username),
	password varchar(20) check (len(password)>=6),
	latitudeLocation float,
	longitudeLocation float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40),
	rating double check(rating >= 0 and rating <=5)
);



create table liesins(
	categoryID integer references Category(categoryID),
	serviceID integer references Service(ServiceID),
	primary key(serviceID, categoryID)
);


create table feedbackfors(
	feedbackID integer references Feedback(feedbackID),
	buyerName varchar(30) references Buyer(username),
	serviceID integer references Service(serviceID),
	primary key(buyerName, serviceID)
);


create table exchanges(
	senderName varchar(30) references User(username),
	receiverName varchar(30) references User(username),
	messageID integer references Message(messageID),
	primary key(senderName, receiverName, messageID)
);


create table offers(
	vendorName varchar(30) references Vendor(username),
	serviceID integer references OfferedService(serviceID),
	primary key(serviceID, vendorName)
);
