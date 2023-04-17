CREATE TABLE CUSTOMERS
(
CUSTOMER_ID NUMBER CONSTRAINT CUS_PK PRIMARY KEY,
FIRST_NAME VARCHAR2(20) CONSTRAINT FN_NN NOT NULL,
LAST_NAME VARCHAR2(20) CONSTRAINT LN_NN NOT NULL,
MOB_NO NUMBER CONSTRAINT MO_UQ UNIQUE,
ADDRESS VARCHAR2(30) CONSTRAINT AD_NN NOT NULL,
EMAIL VARCHAR2(30) CONSTRAINT EM_UQ UNIQUE,
ADHAAR_NO NUMBER CONSTRAINT ADDH_NN NOT NULL
);

CREATE TABLE ORDER_DETAILS
(
ORDER_ID NUMBER CONSTRAINT OR_PK PRIMARY KEY,
PICK_UP_DATE DATE CONSTRAINT PICK_NN NOT NULL,
RETURN_DATE DATE CONSTRAINT RET_NN NOT NULL,
RIDING_DAYS NUMBER CONSTRAINT RIDE_NN NOT NULL,
BICYCLE_RENT NUMBER CONSTRAINT BICYCLE_NN NOT NULL,
LOCATION_NAME VARCHAR2(30) CONSTRAINT LOC_NN NOT NULL,
CUSTOMER_ID NUMBER,
CONSTRAINT CUST_FK FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);
ALTER TABLE ORDER_DETAILS DROP COLUMN BICYCLE_STOCK;
SELECT *
FROM ORDER_DETAILS;
CREATE TABLE BICYCLE_DESCRIPTION
(
BICYCLE_ID NUMBER CONSTRAINT BI_PK PRIMARY KEY,
BICYCLE_TYPE VARCHAR2(30) CONSTRAINT BI_NN NOT NULL,
BICYCLE_CONDITION VARCHAR2(20) CONSTRAINT BI_NN1 NOT NULL,
MAINTENANCE_ID NUMBER CONSTRAINT MAIN_UQ UNIQUE NOT NULL,
ORDER_ID NUMBER,
CONSTRAINT ORDER_FK FOREIGN KEY (ORDER_ID) REFERENCES ORDER_DETAILS(ORDER_ID)
);


CREATE TABLE MAINTENANCE
(
MAINTENANCE_ID NUMBER CONSTRAINT MAINTEN_PK PRIMARY KEY,
MAINTENANCE_DATE DATE CONSTRAINT MAIN_NN NOT NULL,
EXPIRY_DATE DATE CONSTRAINT EXP_NN NOT NULL,
MAINTENANCE_TYPE VARCHAR2(20) CONSTRAINT MAN_NN NOT NULL,
BICYCLE_ID NUMBER,
CONSTRAINT BI_FK FOREIGN KEY (BICYCLE_ID) REFERENCES BICYCLE_DESCRIPTION (BICYCLE_ID)
);

CREATE TABLE INVOICE_REPORTS
(
BILL_NO NUMBER CONSTRAINT BILL_PK PRIMARY KEY,
PAYMENT_DATE DATE CONSTRAINT PAY_NN NOT NULL,
PAYMENT_MODE VARCHAR2(20) CONSTRAINT PAY_NNN NOT NULL,
DISCOUNT NUMBER CONSTRAINT DIS_NN NOT NULL,
CUSTOMER_ID NUMBER CONSTRAINT CUS_UQ UNIQUE,
ORDER_ID NUMBER,
CONSTRAINT ORD_FK FOREIGN KEY (ORDER_ID) REFERENCES ORDER_DETAILS (ORDER_ID)
);

INSERT INTO CUSTOMERS VALUES(101,'Gaurav','Patil',6050403020,'Kolhapur','gauravpatil123@gmail.com',127785557899);
INSERT INTO CUSTOMERS VALUES(102,'Satish','Jadhav',6050406070,'Pune','satish99@gmail.com',741852963746);
INSERT INTO CUSTOMERS VALUES(103,'Sachin','Pawar',9158386253,'Pune','sachinpawar1700@gmail.com',994505414341);
INSERT INTO CUSTOMERS VALUES(104,'Sumit','Lade',9860757511,'Pune','sumitlade1994@gmail.com',994575855578);
INSERT INTO CUSTOMERS VALUES(105,'Rafik','Sheikh',9978457894,'Nagpur','rafiksheikh1998@gmail.com',987875865579);
INSERT INTO CUSTOMERS VALUES(106,'Sayali','Mahajan',9568749812,'Nashik','sayalimahajan25@gmail.com',885264732041);
INSERT INTO CUSTOMERS VALUES(107,'Vaibhav','Bhosale',9961757705,'Satara','vaibhavbhosle78@gmail.com',984675865579);
INSERT INTO CUSTOMERS VALUES(108,'Sujay','Metkar',9861757591,'Dhule','sujaymetkar79@gmail.com',993576858579);
INSERT INTO CUSTOMERS VALUES(109,'Komal','Patil',9960857509,'Pune','komalpatil45@gmail.com',885875895500);
INSERT INTO CUSTOMERS VALUES(110,'Mohan','Jadhav',9861787510,'Pune','mohanjadhav1546@gmail.com',995575468536);
INSERT INTO CUSTOMERS VALUES(111,'Rahul','Wagh',9850908684,'Chankan','rahulwagh90@gmail.com',127785747985);
INSERT INTO CUSTOMERS VALUES(112,'Apurva','Bhosale',8888909588,'Dehu','apurvabhosale88@gmail.com',885575529536);
INSERT INTO CUSTOMERS VALUES(113,'Swapnil','Borhade',7588832281,'Sanagamner','swapnilborhade75@gmail.com',958741236547);
INSERT INTO CUSTOMERS VALUES(114,'Tushar','Sanap',9552251156,'Nashik','tusharsanap@gmail.com',975575448520);
INSERT INTO CUSTOMERS VALUES(115,'Komal','Sathe',9767255945,'Kolhapur','Komalsathe97@gmail.com',963214785147);

INSERT INTO ORDER_DETAILS VALUES(1,'20-12-22','24-12-22',2,2000,'PUNE-SINHAGAD',101);
INSERT INTO ORDER_DETAILS VALUES(2,'28-12-22','31-12-22',2,3000,'PUNE-LONAVALA',102);
INSERT INTO ORDER_DETAILS VALUES(3,'29-12-22','30-12-22',1,1000,'PUNE-Sarasbaug',103); 
INSERT INTO ORDER_DETAILS VALUES(4,'01-01-23','04-01-23',4,4000,'PUNE-Mahabaleshwar',104); 
INSERT INTO ORDER_DETAILS VALUES(5,'01-01-23','02-01-23',1,1000,'PUNE-Parvati',105);
INSERT INTO ORDER_DETAILS VALUES(6,'02-01-23','06-01-23',4,4000,'PUNE-Matheran',106);
INSERT INTO ORDER_DETAILS VALUES(7,'02-01-23','04-01-23',2,2000,'PUNE-ALANDI',107);
INSERT INTO ORDER_DETAILS VALUES(8,'28-12-22','30-12-22',2,2000,'PUNE-KHANDALA',108);
INSERT INTO ORDER_DETAILS VALUES(9,'30-12-22','01-01-23',2,2000,'PUNE-CHAKAN',109);
INSERT INTO ORDER_DETAILS VALUES(10,'02-12-22','03-12-22',1,1000,'PUNE-BHOSRI',110);
INSERT INTO ORDER_DETAILS VALUES(11,'22-12-22','24-12-22',3,3000,'PUNE-SINHAGAD',101);
INSERT INTO ORDER_DETAILS VALUES(12,'31-12-22','01-01-22',2,2000,'PUNE-KHADAKWASLADAM',111);
INSERT INTO ORDER_DETAILS VALUES(13,'01-01-23','03-12-22',3,3000,'PUNE-PABEGHAT',112);
INSERT INTO ORDER_DETAILS VALUES(14,'02-01-23','05-01-23',4,4000,'PUNE-LINGANA FORT',103);
INSERT INTO ORDER_DETAILS VALUES(15,'03-01-23','06-12-22',4,4000,'PUNE-MULSHI',113);
Select * from Order_details;
UPDATE ORDER_DETAILS
SET RIDING_DAYS=4
WHERE ORDER_ID =15;
UPDATE ORDER_DETAILS
SET ORDER_ID=11
WHERE ORDER_ID =15;
SELECT * FROM ORDER_DETAILS;
ALTER TABLE ORDER_DETAILS;
DELETE ORDER_DETAILS 
WHERE ORDER_ID=11;
INSERT INTO BICYCLE_DESCRIPTION VALUES(1100,'GEAR','GOOD',111,1);
INSERT INTO BICYCLE_DESCRIPTION VALUES(1200,'NON_GEAR','GOOD',112,2);
INSERT INTO BICYCLE_DESCRIPTION VALUES(1300,'NON_GEAR','GOOD',113,3);
INSERT INTO BICYCLE_DESCRIPTION VALUES(1400,'GEAR','GOOD',114,4);
INSERT INTO BICYCLE_DESCRIPTION VALUES(1500,'NO_GEAR','GOOD',115,5);
INSERT INTO BICYCLE_DESCRIPTION VALUES(1600,'GEAR','GOOD',116,6);
INSERT INTO BICYCLE_DESCRIPTION VALUES(1700,'GEAR','GOOD',117,7);
INSERT INTO BICYCLE_DESCRIPTION VALUES(1800,'NON_GEAR','GOOD',118,8);
INSERT INTO BICYCLE_DESCRIPTION VALUES(1900,'NON_GEAR','GOOD',119,9);
INSERT INTO BICYCLE_DESCRIPTION VALUES(2000,'GEAR','GOOD',120,10);
INSERT INTO BICYCLE_DESCRIPTION VALUES(2100,'NON_GEAR','GOOD',121,11);

SELECT * FROM BICYCLE_DESCRIPTION;


INSERT INTO MAINTENANCE VALUES(01,'15-12-22','15-03-23','OVERALL',1100);
INSERT INTO MAINTENANCE VALUES(02,'20-12-22','20-05-23','OVERALL',1200);
INSERT INTO MAINTENANCE VALUES(03,'21-12-22','21-05-23','OVERALL',1300);
INSERT INTO MAINTENANCE VALUES(04,'23-12-22','23-05-23','GEAR_BOX',1400);
INSERT INTO MAINTENANCE VALUES(05,'28-12-22','28-05-23','OVERALL',1500);
INSERT INTO MAINTENANCE VALUES(06,'30-12-22','30-05-23','OVERALL',1600);
INSERT INTO MAINTENANCE VALUES(07,'31-12-22','30-04-23','OILING',1700);
INSERT INTO MAINTENANCE VALUES(08,'01-01-23','02-05-23','OVERALL',1800);
INSERT INTO MAINTENANCE VALUES(09,'25-12-22','25-05-23','OVERALL',1900);
INSERT INTO MAINTENANCE VALUES(10,'30-12-22','30-05-23','OVERALL',2000);

SELECT * FROM MAINTENANCE;

SELECT *
FROM BICYCLE_DESCRIPTION;

INSERT INTO INVOICE_REPORTS VALUES(10,'24-12-22','GPAY',0.10,101,1);
INSERT INTO INVOICE_REPORTS VALUES(11,'31-12-22','CASH',0.15,102,2);

DROP TABLE INVOICE_REPORTS;


INSERT INTO INVOICE_REPORTS VALUES(11,'24-12-22','GPAY',0.10,101,1);
INSERT INTO INVOICE_REPORTS VALUES(12,'31-12-22','CASH',0.15,102,2);
INSERT INTO INVOICE_REPORTS VALUES(13,'30-12-22','CASH',0.00,103,3);
INSERT INTO INVOICE_REPORTS VALUES(14,'04-01-23','GAPY',0.20,104,4);
INSERT INTO INVOICE_REPORTS VALUES(15,'02-01-23','PHONE_PAY',0.00,105,5);
INSERT INTO INVOICE_REPORTS VALUES(16,'06-01-23','CASH',0.20,106,6);
INSERT INTO INVOICE_REPORTS VALUES(17,'04-01-23','CASH',0.15,107,7);
INSERT INTO INVOICE_REPORTS VALUES(18,'30-12-22','GPAY',0.15,108,8);
INSERT INTO INVOICE_REPORTS VALUES(19,'01-01-23','CASH',0.15,109,9);
INSERT INTO INVOICE_REPORTS VALUES(20,'03-12-22','PHONE_PAY',0.00,110,10);
INSERT INTO INVOICE_REPORTS VALUES(21,
SELECT * FROM INVOICE_REPORTS;
COMMIT;








-------------RUSHIKESH TABLE UNDER PRATICE -------
CREATE TABLE MAINTENANCE
(
MAINTENANCE_ID NUMBER CONSTRAINT MAINTEN_PK PRIMARY KEY,
MAINTENANCE_DATE DATE CONSTRAINT MAIN_NN NOT NULL,
EXPIRY_DATE DATE CONSTRAINT EXP_NN NOT NULL,
MAINTENANCE_TYPE VARCHAR2(20) CONSTRAINT MAN_NN NOT NULL,
BICYCLE_ID NUMBER, 
CONSTRAINT BI_FK FOREIGN KEY (BICYCLE_ID) REFERENCES BICYCLE_DESCRIPTION (BICYCLE_ID)
);


CREATE TABLE 

