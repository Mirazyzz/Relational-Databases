/* 1. Find the lowest salary for CLERK */

SELECT MIN(Sal)
FROM Emp
WHERE Job = 'CLERK';


/* 2. Find the lowest salary for CLERK */

SELECT COUNT(Empno)
FROM Emp
WHERE Deptno = 20
GROUP BY Deptno;


/* 3. Show the average salary fot each job. */

SELECT AVG(Sal)
FROM Emp
GROUP BY Job;


/* 4. Find the minimal salary for each job except MANAGER */

SELECT MIN(Sal)
FROM Emp
WHERE Job != 'MANAGER'
GROUP BY Job;


/* 5. For each job in each department show maximal salary */

SELECT Job, MAX(Sal)
FROM Emp
GROUP BY Job;


/* 6. For each job find minimal commision */

SELECT Job, MIN(Comm)
FROM Emp
WHERE Comm > 0
GROUP BY Job;


/* 7. Show the average salary for each department employing more than 3 people */

SELECT Deptno, AVG(Sal)
FROM Emp
GROUP BY Deptno
HAVING COUNT(Empno) > 3;


/* 8. Show all jobs with the average salary not less than 3000 */

SELECT Job
FROM Emp
GROUP BY Job
HAVING AVG(Sal) > 3000;


/* 9. Find the average salary (monthly), and average yearly income for each department */

SELECT AVG(Sal) AS Monthly, 12 * AVG(NVL(Sal, 0)) AS Yearly
FROM Emp
GROUP BY Deptno;


/* 10. Find the difference between the highest and the lowest salary */

SELECT MAX(Sal) - MIN(Sal) AS Difference
FROM Emp;


/* 11. Find department employing more than 3 people */

SELECT Deptno
FROM Emp
GROUP BY Deptno
HAVING COUNT(Empno) > 3;


/* 12. Check if all personal numbers are unique */

SELECT Empno
FROM Emp
GROUP BY Empno
HAVING COUNT(Empno) > 1;


/* 13. Find the lowest salary paid to employees working under each manager. Eliminate groups
with minimal salary below 1000. Present data by increasing values of salary */

SELECT MIN(e.Sal) AS MinSal, b.Ename AS Boss 
FROM Emp b, Emp e
WHERE b.Empno = e.Mgr
GROUP BY b.Empno, b.Ename
HAVING MIN(e.Sal) < 1000
ORDER BY MIN(e.Sal);


/* 14. How many people work in departmnet located in Dallas */

SELECT COUNT(Empno)
FROM Emp, Dept
WHERE Emp.Deptno = Dept.Deptno AND Loc = 'DALLAS';


/* 15. For each grade find the maximal salary earned by a person having salary in this grade */

SELECT MAX(Sal), Grade
FROM Emp e, Salgrade s
WHERE e.Sal BETWEEN s.Losal AND s.Hisal
GROUP BY Grade;


/* 16. Which values of salaries occur more than once? */

SELECT e.Sal, COUNT(e.Sal)
FROM Emp e
GROUP BY Sal
HAVING COUNT(e.Sal) > 1;


/* 17. What is the average salary for people with salaries in the second grade? */

SELECT AVG(e.Sal)
FROM Emp e, Salgrade s
WHERE e.Sal BETWEEN s.Losal AND s.Hisal AND s.Grade = 2;


/* 18. For each manager show number of people supervised by him */

SELECT b.Ename, COUNT(e.Empno) AS Supervises
FROM Emp e, Emp b
WHERE e.Mgr = b.Empno
GROUP BY b.Ename;


/* 19. Find total yearly income earned by people earning salaries from the first grade */

SELECT SUM(12 * NVL(e.Sal, 0)) AS YEARLY
FROM Emp e, Salgrade s
WHERE e.Sal BETWEEN s.Losal AND s.Hisal AND s.Grade = 1;