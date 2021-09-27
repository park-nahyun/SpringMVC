SELECT USER
FROM DUAL;
--==>> SCOTT


--�� �ǽ� ���̺� ����(���� : RESION)
CREATE TABLE REGION
( REGIONID      NUMBER              -- ���� ���̵� -- PK
, REGIONNAME    VARCHAR2(30)        -- ���� ��
, CONSTRAINT    REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table RESION��(��) �����Ǿ����ϴ�.



--�� ������ ����(���� : RESIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ��(��) �����Ǿ����ϴ�.



--�� ������ �Է�(���� ������ �Է�)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '���');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '��õ');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



--�� ������ �Է�(���� ������ �߰� �Է�)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



--�� Ȯ��
SELECT REGIONID, REGIONNAME
FROM REGION;
--==>>
--> �� �� ����
SELECT REGIONID, REGIONNAME FROM REGION
;
/*
1	����
2	���
3	��õ
4	����
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�


DROP SEQUENCE POSITIONSEQ;
--==>> Sequence POSITIONSEQ��(��) �����Ǿ����ϴ�.
DROP TABLE POSITION;
--==>> Table POSITION��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����(���� : POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER          -- ���� ���̵�
, POSITIONNAME  VARCHAR2(30)    -- ���� ��
, MINBASICPAY   NUMBER          -- �ּ� �⺻��
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION��(��) �����Ǿ����ϴ�.


--�� ������ ����(���� : POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQ��(��) �����Ǿ����ϴ�.



--�� ������ �Է�(���� ������ �Է�)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '���', 1000000); -- �鸸
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '�븮', 2000000); -- �̹鸸
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '����', 3000000); -- ��鸸
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '��', 4000000); -- ��鸸
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4



--�� Ȯ��
SELECT POSITIONID, POSITIONNAME, MINBASICPAY
FROM POSITION;
--> �� �� ����
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
--==>>
/*
1	���	1000000
2	�븮	2000000
3	����	3000000
4	��	4000000
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.



--�� �ǽ� ���̺� ����(�μ� : DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER       -- �μ� ���̵�   -- PK
, DEPARTMENTNAME    VARCHAR2(30) -- �μ� ��
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT��(��) �����Ǿ����ϴ�.


--�� ������ ����(�μ� : DEPARTMENTSEQ)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ��(��) �����Ǿ����ϴ�.



--�� ������ �Է�(�μ� ������ �Է�)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '���ߺ�');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '�����ú�');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3


--�� Ȯ��
SELECT DEPARTMENTID, DEPARTMENTNAME
FROM DEPARTMENT;
--> �� �� ����
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
--==>>
/*
1	���ߺ�
2	�����ú�
3	������
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.



--�� �ǽ� ���̺� ����(���� : EMPLOYEE)
-- �����ȣ, �����, �ֹι�ȣ, �������, ������
--, ��ȭ��ȣ, �μ�, ����, ����, �⺻��, ����
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  -- ��� ��ȣ        -- PK
, NAME          VARCHAR2(30)            -- ��� ��
, SSN           VARCHAR2(20)            -- �ֹ� ��ȣ        -- ��ȣȭ ��� ����(TYPE CHECK~!!!)
, BIRTHDAY      DATE                    -- �������
, LUNAR         NUMBER(1) DEFAULT 0     -- ������           -- ���0, ����1
, TELEPHONE     VARCHAR2(40)            -- ��ȭ��ȣ
, DEPARTMENTID  NUMBER                  -- �μ� ���̵�
, POSITIONID    NUMBER                  -- ���� ���̵�
, REGIONID      NUMBER                  -- ���� ���̵�
, BASICPAY      NUMBER                  -- �⺻��
, EXTRAPAY      NUMBER                  -- ����
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);

--�� ������ ����
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(���� ������ �Է�)
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY )
VALUES( EMPLOYEESEQ.NEXTVAL, '������', CRYPTPACK.ENCRYPT('9710062234567', '9710062234567')
      , TO_DATE('1997-10-06', 'YYYY-MM-DD'), 0, '010-8755-9495', 1, 1, 1
      , 1500000, 150000);   -- ����ʸ�, �ʿ���
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� Ȯ��
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY
FROM EMPLOYEE;
--> �� �� ����
SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE
;
--==>>
/*
EMPLOYEEID	NAME	SSN	        BIRTHDAY	  LUNAR	TELEPHONE	    DEPARTMENTID	POSITIONID	REGIONID	BASICPAY	EXTRAPAY
1	        ������	"?h????"	1997-10--06	    0	010-8755-9495	    1	            1	        1	1   500000	    150000

*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�


--�� ���� ���� ��ȸ ������ ����
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , ( SELECT DEPARTMENTNAME
         FROM DEPARTMENT
         WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID
     , ( SELECT POSITIONNAME
         FROM POSITION
         WHERE POSITIONID = E.POSITIONID ) AS POSITIONNAME
     , E.REGIONID
     , ( SELECT REGIONNAME
         FROM REGION
         WHERE REGIONID = E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;


--�� �� ����(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , ( SELECT DEPARTMENTNAME
         FROM DEPARTMENT
         WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID
     , ( SELECT POSITIONNAME
         FROM POSITION
         WHERE POSITIONID = E.POSITIONID ) AS POSITIONNAME
     , E.REGIONID
     , ( SELECT REGIONNAME
         FROM REGION
         WHERE REGIONID = E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;
--==>> View EMPLOYEEVIEW��(��) �����Ǿ����ϴ�.


--�� ���� ������ ��ȸ ������ ����(���� ������ ���� ���ɿ��� Ȯ��)
SELECT R.REGIONID, R.REGIONNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK        -- ���� �ǰ� �ִ��� Ȯ��
FROM REGION R;
--==>>
/*
REGIONID	REGIONNAME	DELCHECK
1	        ����	            1
2	        ���            0
3	        ��õ          	0
4	        ����          	0
*/
--> ������� ���� �����ʹ� ������ �Ұ����� ��Ȳ�̸�,
--  ����⡻, ����õ��, �����֡��� ���� �����ʹ� ������ ������ ��Ȳ����
--   �Ǻ��� �� �ִ� ������



--�� �� ����(RESIONVIEW)
CREATE OR REPLACE VIEW REGIONVIEW
AS
SELECT R.REGIONID, R.REGIONNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK        -- ���� �ǰ� �ִ��� Ȯ��
FROM REGION R;
--==>> View REGIONVIEW��(��) �����Ǿ����ϴ�.


--�� ���� ������ ��ȸ ������ ����(���� ������ ���� ���ɿ��� Ȯ��)
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID = P.POSITIONID) AS DELCHECK
FROM POSITION P;

--==>>
/*
POSITIONID	POSITIONNAME	MINBASICPAY	DELCHECK
1	            ���	            1000000	2
2	            �븮	            2000000	0
3	            ����          	3000000	0
4	            ��	            4000000	0
*/


--�� �� ����(POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID = P.POSITIONID) AS DELCHECK
FROM POSITION P;
--View POSITIONVIEW��(��) �����Ǿ����ϴ�.



--�� �μ� ������ ��ȸ ������ ����(�μ� ������ ���� ���ɿ��� Ȯ��)
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;


--�� �� ����(DEPARTMENTVIEW)
CREATE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW��(��) �����Ǿ����ϴ�.
/*
DEPARTMENTID	DEPARTMENTNAME	DELCHECK
1	            ���ߺ�	        1
2	            �����ú�        	0
3	            ������	        0
*/


--�� ������ �ּ� �⺻�� �˻� ������ ����
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;                 -- ���
--> �� �� ����
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;


-------------------------------------------------------------------------------------------
--���� �α��� / �α׾ƿ� ���� �߰�(����) ����--

-- ID �� PW �÷� �����͸� ��� �ִ� ���̺��� ������ �������� �ʴ� ��Ȳ�̴�.
-- �̿� �����Ͽ� EMPLOYEEID(��� ���̵�)�� SSN(�ֹι�ȣ) ���ڸ�
-- 7�ڸ� ���ڸ� �̿��� �� �ֵ��� �����ϳ�.

-- �� ���� ���̺� ���� ����
-- ��
-- EMPLOYEE(���� ���̺�)�� SSN(�ֹι�ȣ) �÷��� �и��Ѵ�.
-- SSN --------------> SSN1, SSN2
-- SSN1 �� �ֹι�ȣ �� 6�ڸ�
-- SSN2 �� �ֹι�ȣ �� 7�ڸ� �� ��ȣȭ ����

-- ��
-- EMPLOYEE(���� ���̺�)�� GRADE(���) �÷��� �߰��Ѵ�.
-- GRADE �� ������ 0, �Ϲݻ�� 1


--�� �÷� ���� SSN �� SSN1, SSN2

-- �÷� �߰�
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.


SELECT *
FROM EMPLOYEE;

UPDATE EMPLOYEE
SET SSN1 = SUBSTR( CRYPTPACK.DECRYPT(SSN, '9710062234567'), 1, 6 ) -- ��ȣȭ ��Ų �� �߶� �ֱ�
  , SSN2 = CRYPTPACK.ENCRYPT( SUBSTR( CRYPTPACK.DECRYPT(SSN, '9710062234567'), 7 , 7 )  
                            , SUBSTR( CRYPTPACK.DECRYPT(SSN, '9710062234567'), 7 , 7 ) );
                            --> ��ȣȭ �� ���� ��ȣȭ �� ���� ��ȣȭ �� ������ ��ȣȭ �ϰڴ�.
                            --> 2234567 �� 2234567 �� ��ȣȭ �ؼ� SSN2�� �ְڴ�.


-- ���� �ֹι�ȣ �÷�(SSN) ����
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM EMPLOYEE;
--==>> 1   ������   1997-10-06   0   010-8755-9495   1   1   1   1500000   150000   971006   Y{ 7 


-- �÷� �߰� �� GRADE - �⺻���� 1�� ����
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.


SELECT *
FROM EMPLOYEE;


-- ������ ����� �����ڷ� �Ӹ�
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


SELECT *
FROM EMPLOYEE;


-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ���̺��� ������ �����߱� ������
--   �̿� ������ ��(VIEW)�� ������ ���� �ۼ�(����)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME  AS NAME
     , E.SSN1  AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR  AS LUNAR
     , DECODE(E.LUNAR, 0, '���', 1, '����') AS LUNARNAME
     , E.TELEPHONE  AS TELEPHONE
     , E.DEPARTMENTID   AS DEPARTMENTID
     , ( SELECT DEPARTMENTNAME  AS DEPARTMENTNAME
         FROM DEPARTMENT
         WHERE DEPARTMENTID = E.DEPARTMENTID ) AS DEPARTMENTNAME
     , E.POSITIONID AS POSITIONID
     , ( SELECT POSITIONNAME
         FROM POSITION
         WHERE POSITIONID = E.POSITIONID ) AS POSITIONNAME
     , E.REGIONID   AS REGIONID
     , ( SELECT REGIONNAME
         FROM REGION
         WHERE REGIONID = E.REGIONID) AS REGIONNAME
     , E.BASICPAY   AS BASICPAY
     , E.EXTRAPAY   AS EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
     , E.GRADE AS GRADE
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;
--==>> View EMPLOYEEVIEW��(��) �����Ǿ����ϴ�.


DESC EMPLOYEEVIEW;
--==>>
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
EMPLOYEEID     NOT NULL NUMBER       
NAME                    VARCHAR2(30) 
SSN                     CHAR(6)      
BIRTHDAY                VARCHAR2(10) 
LUNAR                   NUMBER(1)    
LUNARNAME               VARCHAR2(6)  
TELEPHONE               VARCHAR2(40) 
DEPARTMENTID            NUMBER       
DEPARTMENTNAME          VARCHAR2(30) 
POSITIONID              NUMBER       
POSITIONNAME            VARCHAR2(30) 
REGIONID                NUMBER       
REGIONNAME              VARCHAR2(30) 
BASICPAY                NUMBER       
EXTRAPAY                NUMBER       
PAY                     NUMBER       
GRADE                   NUMBER(1)    
*/


--�� ���� ������ �Է� ������ ����(������ ����)
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY)
VALUES( EMPLOYEESEQ.NEXTVAL, '������', '961031', CRYPTPACK.ENCRYPT('1234567', '1234567')
      , TO_DATE('1996-10-31', 'YYYY-MM-DD'), 0, '010-4020-7429', 1, 1, 1
      , 1500000, 150000);  -- ����ʸ�, �ʿ���
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

      
SELECT *
FROM EMPLOYEE;
--==>>
/*
1	������	1997-10-06	0	010-8755-9495	1	1	1	1500000	150000	971006	Y{?7?	0
2	������	1996-10-31	0	010-4020-7429	1	1	1	1500000	150000	961031	=o???	1
*/

SELECT *
FROM EMPLOYEEVIEW;
--==>>
/*
1	������	971006	1997-10-06	0	���	010-8755-9495	1	���ߺ�	1	���	1	����	1500000	150000	1650000	0
2	������	961031	1996-10-31	0	���	010-4020-7429	1	���ߺ�	1	���	1	����	1500000	150000	1650000	1
*/



--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�


--�� �α��� ������ ����
-- �� �Ϲ� ��� �α���(ID �� EMPLOYEEID, PW �� SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567', '12345678');   -- �н����忡 1234567 �ƴٰ� ����
--==>> ��ȸ ��� ���� �� �α��� ����  

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567', '1234567');  
--==>> ������ �� �α��� ����
--> �Ϲ� ��� �α��� ������ �� �� ����
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=2 AND (SELECT SSN2 FROM EMPLOYEE WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567', '1234567')
; 


-- �� ������ �α���(ID �� EMPLOYEEID, PW �� SSN2, GRADE = 0)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 =  CRYPTPACK.ENCRYPT('1234567', '1234567')
  AND GRADE = 0;
  --==>> ��ȸ ��� ���� �� ������ �α��� ����
  
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 =  CRYPTPACK.ENCRYPT('2234567', '2234567')
  AND GRADE = 0;
--==>> ������ �� ������ �α��� ����
--> ������ �α��� �� �� ����
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=1 AND SSN2 =  CRYPTPACK.ENCRYPT('2234567', '2234567') AND GRADE = 0
;

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 =  CRYPTPACK.ENCRYPT('2234567', '2234567');
--==>> ������ �� �Ϲ� ��� �α��� ���� (�� �� �ž���)


--�� ���� ������ ���� ������ ����

DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;
--> �� �� ����
DELETE FROM EMPLOYEE FROM EMPLOYEE WHERE EMPLOYEEID=2
;

--�� ���� ������ ���� ������ ����
UPDATE EMPLOYEE 
SET NAME='������'
    , BIRTHDAY=TO_DATE('2001-01-01', 'YYYY-MM-DD')
    , LUNAR=1
    , TELEPHONE='010-1111-1111'
    , DEPARTMENTID=2
    , POSITIONID=2
    , REGIONID=2
    , BASICPAY=2200000         
    , EXTRAPAY=220000
    , SSN1='010101'
    , SSN2=CRYPTPACK.ENCRYPT('4234567', '4234567')
    , GRADE=1
WHERE EMPLOYEEID=1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
--> �� �� ����
UPDATE EMPLOYEE SET NAME='������', BIRTHDAY=TO_DATE('2001-01-01', 'YYYY-MM-DD'), LUNAR=1, TELEPHONE='010-1111-1111', DEPARTMENTID=2, POSITIONID=2, REGIONID=2, BASICPAY=2200000, EXTRAPAY=220000, SSN1='010101', SSN2=CRYPTPACK.ENCRYPT('4234567', '4234567'), GRADE=1 WHERE EMPLOYEEID=1
;
--�� �ѹ�
ROLLBACK;
--=>> �ѹ� �Ϸ�.




DESC EMPLOYEE;


--�� ��(EMPLOYEEVIEW) ��ȸ�� ���� ����Ʈ ��� ������ ����

SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY
     , LUNAR, LUNARNAME, TELEPHONE
     , DEPARTMENTID, DEPARTMENTNAME
     , POSITIONID, POSITIONNAME
     , REGIONID, REGIONNAME
     , BASICPAY, EXTRAPAY, PAY, GRADE
FROM EMPLOYEEVIEW
ORDER BY EMPLOYEEID;



--�� ��(REGIONVIEW) ��ȸ�� ���� ����Ʈ ��� ������ ����
SELECT REGION, REGIONNAME, DELCHECK
FROM REGIONVIEW
ORDER BY REGIONID;


--�� ��(DEPARTMENTVIEW) ��ȸ�� ���� ����Ʈ ��� ������ ����
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK
FROM DEPARTMENTVIEW
ORDER BY DEPARTMENTID;



--�� ��(POSITIONVIEW) ��ȸ�� ���� ����Ʈ ��� ������ ����
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK
FROM POSITIONVIEW
ORDER BY POSITIONID;
-->> ����
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;


--�� ���� ���̵� Ȱ���� ���� �˻� ������ ����
SELECT EMPLOYEEID, NAME, SSN1
     , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
     , BASICPAY, EXTRAPAY
FROM EMPLOYEE
WHERE EMPLOYEEID = 1;



--�� �μ� ������ ���� ������ ����
DELETE
FROM DEPARTMENT
WHERE DEPARTMENTID=1;


--�� �μ� ������ ���� ������ ����
UPDATE DEPARTMENT
SET DEPARTMENTNAME='�ѹ���'
WHERE DEPARTMENTID=1;


ROLLBACK;

SELECT *
FROM DEPARTMENT;

--�� ���� ������ ���� ������ ����
DELELTE
FROM REGION
WHERE REGIONID=1;



--�� ���� ������ ���� ������ ����
UPDATE REGION
SET REGIONNAME='����'
WHERE REGIONID=1;

ROLLBACK;


SELECT *
FROM REGION;


--�� ���� ������ ���� ������ ����
DELETE
FROM POSITION
WHERE POSITIONID=1;



--�� ���� ������ ���� ������ ����
UPDATE POSITION
SET POSITIONNAME='����', MINBASICPAY=500000
WHERE POSITIONID=1;

ROLLBACK;

SELECT *
FROM POSITION;


--�� Ŀ��
COMMIT;




SELECT USER
FROM DUAL;


--�� ������ ����� ��/������ �������� ����
UPDATE EMPLOYEE
SET LUNAR=1
WHERE EMPLOYEEID=3;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�



--�� �μ� ���̵� Ȱ���� �μ� �˻� ������ ����
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK
FROM DEPARTMENTVIEW
WHERE DEPARTMENTID = 1;


--�� ���� ���̵� Ȱ���� ���� �˻� ������ ����
SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK
FROM POSITIONVIEW
WHERE POSITIONID = 1;

--�� ���� ���̵� Ȱ���� ���� �˻� ������ ����
SELECT REGIONID, REGIONNAME, DELCHECK
FROM REGIONVIEW
WHERE REGIONID = 1;



SELECT *
FROM EMPLOYEE;

SELECT *
FROM DEPARTMENT;

SELECT *
FROM POSITION;

SELECT*
FROM REGION;


SELECT *
FROM EMPLOYEEVIEW;

SELECT *
FROM DEPARTMENTVIEW;

SELECT *
FROM POSITIONVIEW;

SELECT*
FROM REGIONVIEW;