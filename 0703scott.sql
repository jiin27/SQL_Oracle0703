/*<������ �������� ����>*/

/*�����Լ��� ����� ������ ��������*/
SELECT ENAME, SAL 
FROM EMP 
WHERE SAL > (SELECT AVG(SAL) 
                                        FROM EMP);
                                    
select * 
    from emp
where comm > (select comm 
        from emp 
        where ename = 'ALLEN');
        
select comm 
    from emp
    where ename = 'ALLEN';

/* �������� + ��������*/
select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
    from emp e, dept d
where e.deptno = d.deptno
    and e.deptno = 20
    and e.sal > (select avg(sal)
            from emp);
            

/*<������ ��������>*/
/*�� �μ��� �ְ� �޿��� ������ �޿��� �޴� ������� ����ϱ�
 �� �μ��� �ְ� �޿� -> select �������������� max()�Լ� ����� ���ϱ�
 ������ �޿��� �޴� -> IN (���������� ��� ��)
*/
select *
        from emp
    where sal in (select max(sal)
                from emp
                group by deptno);
                
/*ANY ����� ��������*/
select *
        from emp
    where sal = any (select max(sal)
                from emp
                where deptno = 30)
order by sal, empno;

select *
        from emp
    where sal in (select max(sal)
                from emp
                where deptno = 30)
order by sal, empno;
/* -> = �� any �� �Բ� ���� IN �����ڿ� ��Ȯ�� ���� ���� ����ϰ� ������, =�� any�� �Բ� ���� ���� ���� ����.
IN�� �ַ� ���� ���. 
*/

/*SOME ����� ��������*/
select *
        from emp
    where sal < some (select max(sal)
                from emp
                where deptno = 30)
order by sal, empno;

/*EXISTS ����� ��������*/
SELECT *
        FROM EMP
    WHERE EXISTS (SELECT DNAME
                FROM DEPT
                WHERE DEPTNO = 10);
                
/*p.257 1�� ����*/
select * 
from emp
where hiredate < all (select hiredate
    from emp
    where deptno = 10);
    
select * 
from emp
where hiredate < (select min(hiredate)
    from emp
    where deptno = 10);
    
/*from���� ����ϴ� �������� - inline view
������ �Ը� �ʹ� ũ�ų� ���ʿ��� ���� ���� ��, Ư�� ��� ���� ����ϰ��� �� �� �����ϴ�.
from�� �Ʒ� ���������� �ʹ� ������ �������� ������ �� �־� with ~ as �� ����ϱ⵵ �Ѵ�. (���󵵴� ����)*/
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
    from (select * from emp where deptno = 10) e10,
                (select * from dept) d
where e10.deptno = d.deptno;

 /*p.262 Q1. ���� ���� + ������ ����������*/
 select e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
    from emp e, dept d
    where e.deptno = d.deptno
    and job = (select job from emp where ename = 'ALLEN');
    
/*Q2.*/
select e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
    from emp e, dept d, salgrade s
    where e.deptno = d.deptno
    and e.sal between s.losal and s.hisal
    and e.sal > (select avg(sal) from emp)
order by e.sal desc, e.empno;

/*Q3.*/
select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
    from emp e, dept d
    where e.deptno = d.deptno
    and e.deptno = 10
    and job not in (select distinct job from emp where deptno = 30);
    
    
/*�μ� ���̺� ���� �߰��ϱ�*/
INSERT INTO EMP VALUES(1001, '����', '���', 1013, to_date('1-3-2007','dd-mm-yyyy'), 300, NULL, 20);



