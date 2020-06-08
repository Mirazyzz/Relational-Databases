-------------- Task 2 ---------------------


/* 1. Show data from Emp and Dept as one table */

SELECT Empno, Ename, Job, Mgr, Hiredate, Sal, Comm, e.Deptno, Dname, Loc
FROM Emp e, Dept d
WHERE e.Deptno = d.Deptno;


/* 2. Show names of people and names of  departments where they work. Present data according to names of departments from A to Z. */

SELECT Ename, Dname
FROM Emp e, Dept d
WHERE e.Deptno = d.Deptno
ORDER BY d.Dname;


/* 3. Show names of people and cities where they work . Do not show  names of people including „A”. */

SELECT e.Ename, d.Loc
FROM Emp e, Dept d
WHERE e.Deptno = d.Deptno AND e.Ename NOT LIKE '%A%';


/* 4. For Staff members earning above 1500 show their namas, jobs and names of departments. */

SELECT e.Ename, e.Job, d.Dname
FROM Emp e, Dept d
WHERE e.Deptno = d.Deptno;


/* 5. Show all Staff members with surname, hiredate, and grade. */

SELECT e.Ename, e.Hiredate, s.Grade
FROM Emp e, Salgrade s
WHERE e.Sal BETWEEN s.Losal AND s.Hisal;


/* 6. Show names of people who earn salary in grade 3. */

SELECT Ename
FROM Emp e, Salgrade s
WHERE e.Sal BETWEEN s.Losal AND s.Hisal AND s.Grade = 3;


/* 7. Who works in Dallas? */

SELECT e.*
FROM Emp e, Dept d
WHERE e.Deptno = d.Deptno AND d.Loc = 'DALLAS';


/* 8. Show names of people who work in dep 10 or dep 30. */

SELECT Ename
FROM Emp
WHERE Deptno = 30 OR Deptno = 30;


/* 9. Who earns less than his boss? Show names and salaries for each staff member and his boss */

SELECT e.Ename AS Staff, e.Sal, b.Ename AS Boss, b.Sal
FROM Emp e, Emp b
WHERE e.Mgr = b.Empno AND e.Sal < b.Sal;


/* 10. Which jobs occur both in dep 10 and 30 */

SELECT e.Job
FROM Emp e
WHERE e.Deptno = 10 AND e.Job IN (SELECT b.Job
                                   FROM Emp b
                                   WHERE b.Deptno = 30);
                                   

/* 11. Find name of the person, his grade and city where he/she works? */

SELECT e.Ename, s.Grade, d.Loc
FROM Emp e, Dept d, Salgrade s
WHERE e.Deptno = d.Deptno AND e.Sal BETWEEN s.Losal AND s.Hisal;


/* 12. Which jobs occur in dep 10 but not in 30? */

SELECT e.Job
FROM Emp e
WHERE e.Deptno = 10 AND e.Job NOT IN (SELECT b.Job
                                        FROM Emp b
                                        WHERE b.Deptno = 30);


/* 13. Who earns salary in the same grade as his supervisor? */

SELECT e.Ename
FROM Emp e, Emp b
WHERE e.Mgr = b.Empno AND e.Sal = b.Sal;


/* 14. Find department in which nobody works. */

SELECT Deptno
FROM Emp
GROUP BY Deptno
HAVING COUNT(Empno) = 0;

/* 15. Show name of the person and name of his department. Show also name of department where nobody works (with null instead of the name of some staff member) */

SELECT NVL(e.Ename, NULL), d.Dname
FROM Emp e, Dept d
WHERE e.Deptno = d.Deptno;


/* 16. Show each person show grade and city where he works. */

SELECT e.Ename, s.Grade, d.Loc
FROM Emp e, Dept d, Salgrade s
WHERE e.Deptno = d.Deptno AND e.Sal BETWEEN s.Losal AND s.Hisal;


/* 17. Show name of each person and name of his boss. If somebody doesn't have a boss show "Himself" instead of the name of his boss. */

SELECT e.Ename, NVL(b.Ename, e.Ename)
FROM Emp e, Emp b
WHERE e.Mgr = b.Empno;