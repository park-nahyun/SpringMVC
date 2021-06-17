SELECT USER
FROM DUAL;
--==>> SCOTT

DESC TBL_MEMBERLIST;

DROP TABLE TBL_MEMBERLIST;
--==>> Table TBL_MEMBERLIST이(가) 삭제되었습니다.


--○ 실습 테이블 생성(TBL_MEMBERLIST)
CREATE TABLE TBL_MEMBERLIST
( MID           NUMBER
, NAME          VARCHAR2(30)
, TELEPHONE     VARCHAR2(50)
, CONSTRAINT    MEMBERLIST_MID_PK  PRIMARY KEY(MID)
);

--○ 시퀀스 생성(MEMBERLISTSEQ)
CREATE SEQUENCE MEMBERLISTSEQ
NOCACHE;
--==>> Sequence MEMBERLISTSEQ이(가) 생성되었습니다.


--○ 샘플 데이터 입력
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE)
VALUES(MEMBERLISTSEQ.NEXTVAL, '김서현', '010-1111-1111');

INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE)
VALUES(MEMBERLISTSEQ.NEXTVAL, '이희주', '010-2222-2222');


--> 한 줄 구성
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE) VALUES(MEMBERLISTSEQ.NEXTVAL, '김서현', '010-1111-1111')
;
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE) VALUES(MEMBERLISTSEQ.NEXTVAL, '이희주', '010-2222-2222')
;

--○ 확인
SELECT *
FROM TBL_MEMBERLIST;
--==>>
/*
1	김서현	010-1111-1111
2	이희주	010-2222-2222
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 목록 조회 쿼리문 구성
SELECT MID, NAME, TELEPHONE
FROM TBL_MEMBERLIST
ORDER BY MID;
--> 한줄 구성
SELECT MID, NAME, TELEPHONE FROM TBL_MEMBERLIST ORDER BY MID
;
/*
1   김서현   010-1111-1111
2   이희주   010-2222-2222
*/


--○ 인원 수 조회 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERLIST;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST
;
--==>> 2