
/*스칼라 부속 질의_select 부속 질의
    부속질의 값은 단일한 행으로 출력돼야 한다.*/
SELECT CUSTID,  (SELECT NAME
FROM CUSTOMER CS
WHERE CS.CUSTID = OD.CUSTID), SUM(SALEPRICE)
FROM ORDERS OD
GROUP BY CUSTID;

select name
from Customer cs, Orders od
where cs.custid = od.custid;

/* where 절에서 제시하는 조건에 해당하는 필드를 from에서도 명시해야 한다.
select name
from Customer cs
where cs.custid = od.custid;
*/

/* cf) 서브 쿼리를 포함한 쿼리문에서, 서브쿼리에서 출력 값이 단일 행이 아니면 오류가 난다.
select  custid, (select name 
    from Customer cs, Orders od // cs와 od 두 개의 테이블에서 다중 행이 출력된다.
    where cs.custid = od.custid), sum(saleprice)
from Orders od
group by custid;
*/

/* 기존 테이블에 BOOKNAME 필드를 생성 후 SELECT 서브쿼리문으로 조건식을 주고 BOOKNAME 필드를 채우기*/
ALTER table Orders add bookname VARCHAR2(40);

UPDATE ORDERS
SET BOOKNAME = (SELECT BOOKNAME
        FROM BOOK
        WHERE BOOK.BOOKID=ORDERS.BOOKID);

SELECT * FROM ORDERS;

SELECT BOOK.BOOKNAME
FROM BOOK, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID;



    
