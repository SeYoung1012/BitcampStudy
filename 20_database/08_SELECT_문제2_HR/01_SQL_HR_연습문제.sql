/* ***** HR DB 데이터 조회 실습 *****************
■1 HR 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 
  사원정보(Employees) 테이블에서 급여가 $7,000~$10,000 범위 이외인 사람의 
  이름과 성(Name으로 별칭) 및 급여를 급여가 적은 순서로 출력하시오
*/

/*
■2 HR 부서에서는 급여(salary)와 수당율(commission_pct)에 대한 지출 보고서를 작성하려고 한다. 
  수당을 받는 모든 사원의 이름과 성(Name으로 별칭), 급여, 업무, 수당율을 출력하시오. 
  이때 급여가 큰 순서대로 정렬하되, 급여가 같으면 수당율이 큰 순서대로 정렬하시오
*/

/*  
■3 이번 분기에 60번 IT 부서에서는 신규 프로그램을 개발하고 보급하여 회사에 공헌하였다. 
  이에 해당 부서의 사원 급여를 12.3% 인상하기로 하였다. 
  60번 IT 부서 사원의 급여를 12.3% 인상하여 정수만(반올림) 표시하는 보고서를 작성하시오. 
  보고서는 사원번호, 성과 이름(Name으로 별칭), 급여, 인상된 급여(Increase Salary로 별칭)순으로 출력하시오
*/  

/*
■4 각 사원의 성(last_name)이 's'로 끝나는 사원의 이름과 업무를 아래의 예와 같이 출력하고자 한다. 
  출력 시 이름(first_name)과 성(last_name)은 첫 글자가 대문자, 업무는 모두 대문자로 출력하고 
  머리글(조회컬럼명)은 Employee JOBs.로 표시하시오
  예) FIRST_NAME  LAST_NAME  Employee JOBs.
      Shelley     Higgins    AC_MGR
*/

/*
■5 모든 사원의 연봉을 표시하는 보고서를 작성하려고 한다. 
  보고서에 사원의 이름과 성(Name으로 별칭), 급여, 수당여부에 따른 연봉을 포함하여 출력하시오. 
  수당여부는 수당이 있으면 "Salary + Commission", 수당이 없으면 "Salary only"라고 표시하고, 
  별칭은 적절히 붙이시오. 또한 출력 시 연봉이 높은 순으로 정렬하시오
*/

/*
■6 각 사원이 소속된 부서별로 급여 합계, 급여 평균, 급여 최댓값, 급여 최솟값을 집계하고자 한다. 
  계산된 출력값은 여섯 자리와 세 자리 구분기호, $표시와 함께 출력($123,456) 
  단, 부서에 소속되지 않은 사원에 대한 정보는 제외하고, 출력 시 머리글은 별칭(alias) 처리하시오
*/    


/*
■7 사원들의 업무별 전체 급여 평균이 $10,000보다 큰 경우를 조회하여 
    업무별 급여 평균을 출력하시오. 
  단 업무에 CLERK이 포함된 경우는 제외하고 전체 급여 평균이 높은 순서대로 출력하시오
*/


/*
■8 HR 스키마에 존재하는 Employees, Departments, Locations 테이블의 구조를 파악한 후 
  Oxford에 근무하는 사원의 이름과 성(Name으로 별칭), 업무, 부서이름, 도시이름을 출력하시오. 
  이때 첫 번째 열은 회사이름인 'HR-Company'이라는 상수값이 출력되도록 하시오
*/

/*
■9 HR 스키마에 있는 Employees, Departments 테이블의 구조를 파악한 후 
  사원수가 다섯 명 이상인 부서의 부서이름과 사원 수를 출력하시오. 
  이때 사원 수가 많은 순으로 정렬하시오
*/


/*
■10 각 사원의 급여에 따른 급여 등급을 보고하려고 한다. 
  급여 등급은 Job_Grades 테이블에 표시된다. 해당 테이블의 구조를 살펴본 후 
  사원의 이름과 성(Name으로 별칭), 업무, 부서이름, 입사일, 급여, 급여등급을 출력하시오.
  
CREATE TABLE JOB_GRADES (
    GRADE_LEVEL VARCHAR2(3),
    LOWEST_SAL NUMBER,
    HIGHEST_SAL NUMBER
);
INSERT INTO JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES ('F', 25000, 40000);
COMMIT;
********************************/
--1 HR 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 
--  사원정보(Employees) 테이블에서 급여가 $7,000~$10,000 범위 이외인 사람의 
--  이름과 성(Name으로 별칭) 및 급여를 급여가 적은 순서로 출력하시오

SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME, SALARY 
 FROM EMPLOYEES
 WHERE SALARY < 7000 OR SALARY > 10000
 ORDER BY SALARY 
;


SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME, SALARY 
 FROM EMPLOYEES
 WHERE SALARY NOT BETWEEN 7000 AND  10000 --7000부터 10000까지가 아닌 것
 ORDER BY SALARY 
;

--뷰로 풀기
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME, SALARY 
 FROM EMP_DETAILS_VIEW
WHERE SALARY <7000 OR SALARY > 10000
ORDER BY SALARY DESC
;


/*■2 HR 부서에서는 급여(salary)와 수당율(commission_pct)에 대한 지출 보고서를 작성하려고 한다. 
  수당을 받는 모든 사원의 이름과 성(Name으로 별칭), 급여, 업무, 수당율을 출력하시오. 
  이때 급여가 큰 순서대로 정렬하되, 급여가 같으면 수당율이 큰 순서대로 정렬하시오
*/

SELECT FIRST_NAME||' '||LAST_NAME AS NAME, SALARY, JOB_ID, COMMISSION_PCT
 FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL
 ORDER BY SALARY DESC, COMMISSION_PCT DESC
 ;
 
 
/*  
■3 이번 분기에 60번 IT 부서에서는 신규 프로그램을 개발하고 보급하여 회사에 공헌하였다. 
  이에 해당 부서의 사원 급여를 12.3% 인상하기로 하였다. 
  60번 IT 부서 사원의 급여를 12.3% 인상하여 정수만(반올림) 표시하는 보고서를 작성하시오. 
  보고서는 사원번호, 성과 이름(Name으로 별칭), 급여, 인상된 급여(Increase Salary로 별칭)순으로 출력하시오
*/  

SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME, SALARY
        ,ROUND(SALARY * 1.123) AS "Increase Salary"
        ,ROUND(SALARY + SALARY * 0.123) AS "Increase Salary2"
        ,ROUND(SALARY *0.123) AS "순수인상금액"
    FROM EMPLOYEES 
    WHERE DEPARTMENT_ID = 60
;


    
/*
■4 각 사원의 성(last_name)이 's'로 끝나는 사원의 이름과 업무를 아래의 예와 같이 출력하고자 한다. 
  출력 시 이름(first_name)과 성(last_name)은 첫 글자가 대문자, 업무는 모두 대문자로 출력하고 
  머리글(조회컬럼명)은 Employee JOBs.로 표시하시오
  예) FIRST_NAME  LAST_NAME  Employee JOBs.
      Shelley     Higgins    AC_MGR
*/

SELECT FIRST_NAME||' '||LAST_NAME AS NAME, JOB_ID AS "Employee JOBs"
    FROM EMPLOYEES 
    WHERE LAST_NAME LIKE '%s'   
;

SELECT INITCAP (FIRST_NAME) AS FIRST_NAME
       ,INITCAP(LAST_NAME) AS LAST_NAME
       ,UPPER(JOB_ID) AS "Employee JOBs"
    FROM EMPLOYEES 
    WHERE LAST_NAME LIKE '%s'   
;


/*
■5 모든 사원의 연봉을 표시하는 보고서를 작성하려고 한다. 
  보고서에 사원의 이름과 성(Name으로 별칭), 급여, 수당여부에 따른 연봉을 포함하여 출력하시오. 
  수당여부는 수당이 있으면 "Salary + Commission", 수당이 없으면 "Salary only"라고 표시하고, 
  별칭은 적절히 붙이시오. 또한 출력 시 연봉이 높은 순으로 정렬하시오
*/

SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME
        ,SALARY, COMMISSION_PCT 
        ,DECODE(COMMISSION_PCT, NULL, 'Salary only' , 'Salary+Commission')
        AS COMMISSION_YN
        ,SALARY * (1 + NVL(COMMISSION_PCT, 0)) * 12 AS SALARY12
    FROM EMPLOYEES
    --ORDER BY 6 DESC  --SELECT 절의 위치값으로 정렬(중간에 컬럼이 추가되거나 삭제되면 위치값이 달라져서 문제 발생할 수 있음)
    ORDER BY SALARY12 DESC
;


/*
■6 각 사원이 소속된 부서별로 급여 합계, 급여 평균, 급여 최댓값, 급여 최솟값을 집계하고자 한다. 
  계산된 출력값은 여섯 자리와 세 자리 구분기호, $표시와 함께 출력($123,456) 
  단, 부서에 소속되지 않은 사원에 대한 정보는 제외하고, 출력 시 머리글은 별칭(alias) 처리하시오
*/    
SELECT DEPARTMENT_ID 
    ,TO_CHAR(SUM(SALARY),'$999,999')SUM_SALARY
    ,TO_CHAR(AVG(SALARY),'$999,999') AVG_SALARY
    ,TO_CHAR(MAX(SALARY),'$999,999') MAX_SALARY 
    ,TO_CHAR(MIN(SALARY),'$999,999') MIN_SALARY 
   FROM EMPLOYEES 
 WHERE DEPARTMENT_ID IS NOT NULL
 GROUP BY DEPARTMENT_ID
 ;
 
SELECT DEPARTMENT_ID 
    ,TO_CHAR(SUM(SALARY),'$999,999')"급여 합계" --한글은 되도록 피하자. 띄어쓰기 하면 ""를 써야하고, 띄어쓰지 않으면 없어도 됨.
    ,TO_CHAR(AVG(SALARY),'$999,999')"급여 평균"
    ,TO_CHAR(MAX(SALARY),'$999,999') 급여최대값 
    ,TO_CHAR(MIN(SALARY),'$999,999') 급여최소값 
   FROM EMPLOYEES 
 WHERE DEPARTMENT_ID IS NOT NULL
 GROUP BY DEPARTMENT_ID
 ; 
 
 
/*
■7 사원들의 업무별 전체 급여 평균이 $10,000보다 큰 경우를 조회하여 
    업무별 급여 평균을 출력하시오. 
  단 업무에 CLERK이 포함된 경우는 제외하고 전체 급여 평균이 높은 순서대로 출력하시오
*/
 
SELECT DISTINCT JOB_ID --DISTINCT 중복값 제거하고 하나만 표시
 FROM EMPLOYEES
 WHERE UPPER(JOB_ID) LIKE '%CLERK%'
 ;
 

SELECT JOB_ID 
 FROM EMPLOYEES
 WHERE UPPER(JOB_ID) NOT LIKE '%CLERK%' --CLERK 제외하고 
 GROUP BY JOB_ID
 ; 
--------------
SELECT JOB_ID, AVG(SALARY)AVG_SALARY
 FROM EMPLOYEES 
 WHERE UPPER(JOB_ID) NOT LIKE '%CLERK%'
 GROUP BY JOB_ID
 HAVING AVG(SALARY) >10000
 ORDER BY AVG_SALARY DESC
 ;
  
 
/*
■8 HR 스키마에 존재하는 Employees, Departments, Locations 테이블의 구조를 파악한 후 
  Oxford에 근무하는 사원의 이름과 성(Name으로 별칭), 업무, 부서이름, 도시이름을 출력하시오. 
  이때 첫 번째 열은 회사이름인 'HR-Company'이라는 상수값이 출력되도록 하시오
*/

SELECT 'HR-Company' AS COMPANY_NAME
        ,E.EMPLOYEE_ID , E.FIRST_NAME||' '||E.LAST_NAME AS NAME
        , E.JOB_ID ,D.DEPARTMENT_NAME, L.CITY
 FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID --조인조건
 AND D.LOCATION_ID = L.LOCATION_ID --조인조건
 AND L.CITY = 'Oxford' --데이터에 맞춰서 검색
 --AND UPPER(L.CITY) = 'OXFORD'
 ORDER BY E.EMPLOYEE_ID
 ;
 
--표준 SQL
SELECT 'HR-Company' AS COMPANY_NAME
        ,E.EMPLOYEE_ID , E.FIRST_NAME||' '||E.LAST_NAME AS NAME
        , E.JOB_ID ,D.DEPARTMENT_NAME, L.CITY
 FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID --조인조건
       INNER JOIN LOCATIONS L
       ON D.LOCATION_ID = L.LOCATION_ID --조인조건
 WHERE L.CITY = 'Oxford' 
 ORDER BY E.EMPLOYEE_ID
;

--HR에서 제공하는 EMP_DETAILS_VIEW 뷰 사용
SELECT 'HR-Company' AS COMPANY_NAME 
        ,EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME
        ,JOB_ID ,DEPARTMENT_NAME,CITY
    FROM EMP_DETAILS_VIEW
 WHERE CITY = 'Oxford'
;


/*
■9 HR 스키마에 있는 Employees, Departments 테이블의 구조를 파악한 후 
  사원수가 다섯 명 이상인 부서의 부서이름과 사원 수를 출력하시오. 
  이때 사원 수가 많은 순으로 정렬하시오
*/
--테이블 2개를 조인한 것.
SELECT E.DEPARTMENT_ID, COUNT(*) EMP_CNT
  FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
 GROUP BY E.DEPARTMENT_ID ,D.DEPARTMENT_NAME
 HAVING COUNT(*) >= 5
 ORDER BY EMP_CNT DESC
 ;

--부서별 인원을 구한 뒤, 부서 테이블 조인해서 부서명 확인
SELECT D.DEPARTMENT_NAME, E.EMP_CNT
  FROM(SELECT DEPARTMENT_ID , COUNT(*)EMP_CNT
          FROM EMPLOYEES
     GROUP BY DEPARTMENT_ID) E,
     DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND E.EMP_CNT >= 5
  ORDER BY E.EMP_CNT DESC
;
--뷰 사용(개인별 실습)
SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID) AS CNT 
 FROM EMP_DETAILS_VIEW 
 GROUP BY DEPARTMENT_ID
 HAVING COUNT(DEPARTMENT_ID) >= 5
 ORDER BY CNT DESC
;


/*
■10 각 사원의 급여에 따른 급여 등급을 보고하려고 한다. 
  급여 등급은 Job_Grades 테이블에 표시된다. 해당 테이블의 구조를 살펴본 후 
  사원의 이름과 성(Name으로 별칭), 업무, 부서이름, 입사일, 급여, 급여등급을 출력하시오.
  
CREATE TABLE JOB_GRADES (
    GRADE_LEVEL VARCHAR2(3),
    LOWEST_SAL NUMBER,
    HIGHEST_SAL NUMBER
);
INSERT INTO JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES ('F', 25000, 40000);
COMMIT;
*/

CREATE TABLE JOB_GRADES (
    GRADE_LEVEL VARCHAR2(3),
    LOWEST_SAL NUMBER,
    HIGHEST_SAL NUMBER
);
INSERT INTO JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES ('F', 25000, 40000);
COMMIT;

------

SELECT * FROM JOB_GRADES
WHERE 6500 BETWEEN LOWEST_SAL AND HIGHEST_SAL;

SELECT E.EMPLOYEE_ID , E.FIRST_NAME||' '||E.LAST_NAME AS NAME,
       E.JOB_ID, 
       --E.DEPARTMENT_ID, 
       D.DEPARTMENT_NAME,
       E.HIRE_DATE,
       E.SALARY,
       J.GRADE_LEVEL
       ,J.LOWEST_SAL ,J.HIGHEST_SAL
 FROM EMPLOYEES E, JOB_GRADES J , DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
  AND E.SALARY BETWEEN J.LOWEST_SAL AND J.HIGHEST_SAL
 ORDER BY E.EMPLOYEE_ID
;







