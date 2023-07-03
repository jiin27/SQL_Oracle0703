/*<단일행 서브쿼리 예제>*/

/*집계함수를 사용한 단일행 서브쿼리*/
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

/* 내부조인 + 서브쿼리*/
select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
    from emp e, dept d
where e.deptno = d.deptno
    and e.deptno = 20
    and e.sal > (select avg(sal)
            from emp);
            

/*<다중행 서브쿼리>*/
/*각 부서별 최고 급여와 동일한 급여를 받는 사원정보 출력하기
 각 부서별 최고 급여 -> select 서브쿼리문으로 max()함수 사용해 구하기
 동일한 급여를 받는 -> IN (서브쿼리문 결과 값)
*/
select *
        from emp
    where sal in (select max(sal)
                from emp
                group by deptno);
                
/*ANY 사용한 서브쿼리*/
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
/* -> = 와 any 를 함께 쓰면 IN 연산자와 정확히 같은 값을 출력하게 되지만, =와 any를 함께 쓰는 일은 거의 없다.
IN을 주로 많이 사용. 
*/

/*SOME 사용한 서브쿼리*/
select *
        from emp
    where sal < some (select max(sal)
                from emp
                where deptno = 30)
order by sal, empno;

/*EXISTS 사용한 서브쿼리*/
SELECT *
        FROM EMP
    WHERE EXISTS (SELECT DNAME
                FROM DEPT
                WHERE DEPTNO = 10);
                
/*p.257 1분 복습*/
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
    
/*from절에 사용하는 서브쿼리 - inline view
데이터 규모가 너무 크거나 불필요한 열이 많을 때, 특정 행과 열만 사용하고자 할 때 유용하다.
from절 아래 서브쿼리가 너무 많으면 가독성이 떨어질 수 있어 with ~ as 를 사용하기도 한다. (사용빈도는 낮음)*/
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
    from (select * from emp where deptno = 10) e10,
                (select * from dept) d
where e10.deptno = d.deptno;

 /*p.262 Q1. 내부 조인 + 단일행 서브쿼리문*/
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
    
    
/*부서 테이블에 샘플 추가하기*/
INSERT INTO EMP VALUES(1001, '김사랑', '사원', 1013, to_date('1-3-2007','dd-mm-yyyy'), 300, NULL, 20);



