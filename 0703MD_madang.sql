
/*��Į�� �μ� ����_select �μ� ����
    �μ����� ���� ������ ������ ��µž� �Ѵ�.*/
SELECT CUSTID,  (SELECT NAME
FROM CUSTOMER CS
WHERE CS.CUSTID = OD.CUSTID), SUM(SALEPRICE)
FROM ORDERS OD
GROUP BY CUSTID;

select name
from Customer cs, Orders od
where cs.custid = od.custid;

/* where ������ �����ϴ� ���ǿ� �ش��ϴ� �ʵ带 from������ ����ؾ� �Ѵ�.
select name
from Customer cs
where cs.custid = od.custid;
*/

/* cf) ���� ������ ������ ����������, ���� Ŀ���� from������ where�� ���ǿ� �ش��ϴ� �ʵ带 ������� ��� 
������������ �ߺ� ����ϸ� ������ ����.
select  custid, (select name
                            from Customer cs, Orders od
                            where cs.custid = od.custid), sum(saleprice)
from Orders od
group by custid;
*/
    
