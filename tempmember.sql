CREATE TABLE tempmember (
id VARCHAR2(20) NOT NULL ENABLE,
passwd VARCHAR2(20),
name VARCHAR2(20),
mem_num1 VARCHAR2(6),
mem_num2 VARCHAR2(7),
e_mail VARCHAR2(30),
phone VARCHAR2(30),
zipcode VARCHAR2(7),
address VARCHAR2(80),
job VARCHAR2(30),
PRIMARY KEY (id) ENABLE
);

INSERT INTO TEMPMEMBER
VALUES('aaaa', '1111', '홍길동', '123456', '7654321','honggd@globalin.co.kr', '010-6376-4096', '100-100', '서울시 영등포구 당산로 2길', '프로그래머');

INSERT INTO TEMPMEMBER
VALUES('bbbb', '2222', '지형민', '123456', '7654321','jhm@hrdkorea.or.kr', '052-714-8614', '200-200', '울산광역시 중구 종가로 345 한국산업인력공단', '회사원');

INSERT INTO TEMPMEMBER
VALUES('cccc', '3333', '배신영', '123456', '7654321','kashikoi@hanmail.net', '02-1577-1577', '300-300', '서울시 영등포구 당산로 3길', '일본어강사');

SELECT * FROM tempmember;
