
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

/* cf) 서브 쿼리를 포함한 쿼리문에서, 메인 커리의 from절에서 where절 조건에 해당하는 필드를 명시했을 경우 
서브쿼리에서 중복 명시하면 오류가 난다.
select  custid, (select name
                            from Customer cs, Orders od
                            where cs.custid = od.custid), sum(saleprice)
from Orders od
group by custid;
*/
    
