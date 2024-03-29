
--ABS(숫자) : 절대값
SELECT ABS (-15), ABS(15) FROM DUAL;

--CEIL(15.7)  : 16
SELECT CEIL(15.7) FROM DUAL;

--COS(3.14159) :-0.99999999999647923060461239250850048324
SELECT COS(3.14159) FROM DUAL;

--FLOOR(15.7) : 
SELECT FLOOR(15.7) FROM DUAL;

--LOG(10, 100) : 2
SELECT LOG(10, 100) FROM DUAL;

--MOD(11, 4) : 3
SELECT MOD(11, 4) FROM DUAL;

--POWER (3, 2) : 9
SELECT POWER(3, 2) FROM DUAL;

--ROUND (15.7) : 16
SELECT ROUND(15.7) FROM DUAL;

--SIGN (-15) : -1
SELECT SIGN(-15) FROM DUAL;

--TRUNC(15.7) : 15
SELECT TRUNC(15.7) FROM DUAL;

--CHR(67) : 'C'
SELECT CHR(67) FROM DUAL;

--CONCAT('HAPPY', 'Birthday') :HAPPYBirthday
SELECT CONCAT('HAPPY','Birthday') FROM DUAL;

--LOWER('Birthday') :birthday
SELECT LOWER('Birthday') FROM DUAL;

--LPAD('Page 1', 15, '*.') : *.*.*.*.*Page 1
SELECT LPAD('Page 1', 15, '*.') FROM DUAL;

--LTRIM('Page 1', 'ae') :Page 1
SELECT LTRIM('Page 1', 'ae') FROM DUAL;

--REPLACE ( 'JACK','J', 'BL') : BLACK
SELECT REPLACE('JACK','J','BL') FROM DUAL;

--RPAD('Page 1', 15, '*.') :Page 1*.*.*.*.*
SELECT RPAD ('Page 1', 15, '*.') FROM DUAL;

--RTRIM ('Page 1', 'ae') :Page 1
SELECT RTRIM('Page 1', 'ae') FROM DUAL;

--SUBSTR('ABCDEFG', 3,4) : CDEF
SELECT SUBSTR('ABCDEFG', 3,4) FROM DUAL;

--TRIM (LEADING 0 FROM '00AA00') : AA00
SELECT TRIM (LEADING 0 FROM '00AA00') FROM DUAL;

--UPPER('Birthday'): BIRTHDAY
SELECT UPPER('Birthday') FROM DUAL;

--ASCII ('A') : 65
SELECT ASCII('A') FROM DUAL;

--INSTR('CORPORATE FLOOR', 'OR', 3,2) :14
SELECT INSTR('CORPORATE FLOOR', 'OR', 3,2) FROM DUAL;

--LENGTH('Birthday') :8
SELECT LENGTH('Birthday') FROM DUAL;

--ADD_MONTHS('14/05/21', 1) :0014-06-21
SELECT ADD_MONTHS('14/05/21', 1) FROM DUAL;

--LAST_DAY(SYSDATE) : 2021-08-31
SELECT LAST_DAY(SYSDATE) FROM DUAL;

--NEXT_DAY(SYSDATE, '화') : 2021-08-17
SELECT NEXT_DAY(SYSDATE, '화') FROM DUAL;

--ROUND(SYSDATE) : 2021-08-11
SELECT ROUND(SYSDATE) FROM DUAL;

--SYSDATE :2021-08-10
SELECT SYSDATE FROM DUAL;

--TO_CHAR(SYSDATE) :2021-08-10
SELECT TO_CHAR(SYSDATE) FROM DUAL;

--TO_CHAR(123) :123
SELECT TO_CHAR(123) FROM DUAL;

--TO_DATE('12 05 2014', 'DD MM YYYY') :2014-05-12
SELECT TO_DATE('12 05 2014', 'DD MM YYYY') FROM DUAL;

--TO_NUMBER('12.3') :12.3
SELECT TO_NUMBER('12.3') FROM DUAL;

--DECODE(1,1,'aa','bb') :aa
SELECT DECODE(1,1,'aa', 'bb') FROM DUAL;

--NULLIF(123, 345) :123
SELECT NULLIF(123,345) FROM DUAL;

--NVL(NULL,123) :123
SELECT NVL(NULL,123) FROM DUAL;







