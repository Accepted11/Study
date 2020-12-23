create database zyxt

create table costTable
(
	invoice varchar(16),
	departmentId varchar(16),
	oilWall varchar(16),
	budgetAmount decimal(10,2),
	budgetPerson varchar(16),
	budgetDate datetime,
	startDate datetime,
	endDate datetime,
	constructionUnit varchar(16),
	constructionContent varchar(16),
	materialCost decimal(10,2),
	presonCost decimal(10,2),
	equipmentCost decimal(10,2),
	otherCost decimal(10,2),
	allCost decimal(10,2),
	settlePreson varchar(16),
	settleDate datetime,
	recordAmount decimal(10,2) ,
	recordPerson varchar(16),
	recordDate datetime
);

create table materialCostDetail
(
	invoice varchar(16),
	materialId  varchar(16),
	consumeQuantity decimal(10,2)									  	
);

create table departTable
(
	departID varchar(16),
	departName varchar(16)
);

create table oilWallTable
(
	oilWallId varchar(16),
	oilWallType varchar(16),
	departID varchar(16)	
);

create table materiaTable
(
	materialId varchar(16),
	materialName varchar(16),
	measureUnit varchar(16),
	Price decimal(10,2)	
);

insert 
into departTable(departID,departName)
values
('1122','productionPlant'),
('112201','oilOne'),
('112202','oilTwo'),
('112201001','oilOneFirst'),
('112201002','oilOneSecond'),
('112201003','oilOneThird'),
('112202001','oilTwoFirst'),
('112202002','oilTwoSecond');

insert 
into oilWallTable(oilWallId,oilWallType,departID)
values
('y001','oilWall','112201001'),
('y002','oilWall','112201001'),
('y003','oilWall','112201002'),
('s001','waterWall','112201002'),
('y004','oilWall','112201003'),
('s002','waterWall','112202001'),
('s003','waterWall','112202001'),
('y005','oilWall','112202002');

insert 
into materiaTable(materialId,materialName,measureUnit,Price)
values
('wm001','first','t','10'),
('wm002','second','m','10'),
('wm003','third','bucket','10'),
('wm004','fourth','bag','10');

insert
into costTable(invoice,departmentId,oilWall,budgetAmount,budgetPerson,budgetDate,startDate,endDate,constructionUnit,constructionContent,materialCost,presonCost,equipmentCost,otherCost,allCost,settlePreson,settleDate,recordAmount,recordPerson,recordDate)
values
('zy2016001','112201001','y001','10000.00','A','2016-05-01 00:00:00','2016-05-04 00:00:00','2016-05-25 00:00:00','companyFirst','plugging','7000.00','2500.00','1000.00','1400.00','11900.00','B','2016-05-26 00:00:00','11900.00','C','2016-05-28 00:00:00'),
('zy2016002','112201002','y003','11000.00','A','2016-05-01 00:00:00','2016-05-04 00:00:00','2016-05-23 00:00:00','companySecond','checkPump','6000.00','1500.00','1000.00','2400.00','10900.00','B','2016-05-26 00:00:00','10900.00','C','2016-05-28 00:00:00'),
('zy2016003','112201002','s001','10500.00','A','2016-05-01 00:00:00','2016-05-06 00:00:00','2016-05-23 00:00:00','companySecond','profileControl','6500.00','2000.00','500.00','1400.00','10400.00','B','2016-05-26 00:00:00','10400.00','C','2016-05-28 00:00:00'),
('zy2016004','112202001','s002','12000.00','A','2016-05-01 00:00:00','2016-05-04 00:00:00','2016-05-24 00:00:00','companyThird','unblock','6000.00','2000.00','1000.00','1600.00','10600.00','B','2016-05-26 00:00:00','10600.00','D','2016-05-28 00:00:00'),
('zy2016005','112202002','y005','12000.00','A','2016-05-01 00:00:00','2016-05-04 00:00:00','2016-05-28 00:00:00','companyThird','sandControl','7000.00','1000.00','2000.00','1300.00','11300.00','B','2016-06-01 00:00:00','11300.00','B','2020-6-1 00:00:00');


insert
into materialCostDetail(invoice,materialId,consumeQuantity)
values
('zy2016001','wm001','200'),
('zy2016001','wm002','200'),
('zy2016001','wm003','200'),
('zy2016001','wm004','100'),
('zy2016002','wm001','200'),
('zy2016002','wm002','200'),
('zy2016002','wm003','200'),
('zy2016003','wm001','200'),
('zy2016003','wm002','200'),
('zy2016003','wm003','250'),
('zy2016004','wm001','200'),
('zy2016004','wm002','200'),
('zy2016004','wm004','200'),
('zy2016005','wm001','200'),
('zy2016005','wm002','200'),
('zy2016005','wm004','300');

update costTable
set presonCost=presonCost+200,allCost= allCost+200,recordAmount=recordAmount+200
where invoice = 'zy2016001';
