-- SWITCH TO DATABASE
USE SAKILA; 
SELECT * FROM ACTOR;
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME FROM ACTOR;
SELECT * FROM CITY;
SELECT * FROM COUNTRY;

CREATE DATABASE DEMODB;
USE DEMODB;
cReAtE TABLE PRODUCT (PRODUCT_ID INTEGER PRIMARY KEY, PRODUCT_NAME VARCHAR(50),  PRICE FLOAT);-- 
INSERT INTO PRODUCT VALUES (1, 'MAGAZINE',50.5);
INSERT INTO PRODUCT VALUES (2, 'PAPER',60.5);
SELECT * FROM PRODUCT;
UPDATE PRODUCT SET PRODUCT_NAME = 'PEN' WHERE PRODUCT_ID = 1;
UPDATE PRODUCT SET PRODUCT_NAME = 'PENCIL', PRICE = 70.70 WHERE PRODUCT_ID = 1;
DELETE FROM PRODUCT WHERE PRODUCT_ID = 1;
DROP TABLE LOGIN;
CREATE TABLE LOGIN(LOGIN_ID CHAR(10), PASSWORD VARCHAR(20));
INSERT INTO LOGIN VALUES ('login','password');
DELETE FROM LOGIN;
SELECT * FROM LOGIN;
select version();
SELECT UPPER('test');
SELECT * FROM PRODUCT WHERE PRODUCT_NAME LIKE '%GAZ%';
SELECT * FROM PRODUCT WHERE PRODUCT_NAME LIKE 'PA%';
SELECT * FROM PRODUCT order by product_id desc;
-- insert partial values
INSERT INTO PRODUCT VALUES (5000, 'MAGAZINE',50.5);
INSERT INTO PRODUCT (product_id,PRODUCT_NAME,PRICE) VALUES (5001, 'MAGAZINE',50.5);
INSERT INTO PRODUCT (PRODUCT_NAME,PRICE,product_id) VALUES ('MAGAZINE',50.5,5002);
INSERT INTO PRODUCT (product_id,PRODUCT_NAME) VALUES (5003, 'MAGAZINE');
