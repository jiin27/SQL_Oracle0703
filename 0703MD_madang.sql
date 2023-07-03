
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

/* cf) ���� ������ ������ ����������, ������������ ��� ���� ���� ���� �ƴϸ� ������ ����.
select  custid, (select name 
    from Customer cs, Orders od // cs�� od �� ���� ���̺��� ���� ���� ��µȴ�.
    where cs.custid = od.custid), sum(saleprice)
from Orders od
group by custid;
*/

/* ���� ���̺� BOOKNAME �ʵ带 ���� �� SELECT �������������� ���ǽ��� �ְ� BOOKNAME �ʵ带 ä���*/
ALTER table Orders add bookname VARCHAR2(40);

UPDATE ORDERS
SET BOOKNAME = (SELECT BOOKNAME
        FROM BOOK
        WHERE BOOK.BOOKID=ORDERS.BOOKID);

SELECT * FROM ORDERS;

SELECT BOOK.BOOKNAME
FROM BOOK, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID;



    
