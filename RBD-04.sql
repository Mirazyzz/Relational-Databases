/* 1. Find all employees earning the minimal salary in the firm. */

SELECT Ename
FROM EMP
WHERE Sal = (SELECT MIN(Sal)
             FROM Emp);
             

/* 2. Find all people who work at the same position as FORD */

SELECT Ename
FROM Emp
WHERE Job = (SELECT Job
             FROM Emp
             WHERE Ename = 'FORD');


/* 3. Find all people who earn salaries from the "list of the lowest salaries earned by departments" */

SELECT Ename
FROM Emp
WHERE SAL IN (SELECT MIN(Sal)
                FROM Emp
                GROUP BY Deptno);
                
                
/* 4. Find people earning the lowest salaries for their own departments */

SELECT e.Ename, e.Deptno, e.Sal
FROM Emp e
WHERE e.Sal = (SELECT MIN(b.Sal)
                FROM Emp b
                WHERE b.Deptno = e.Deptno
                GROUP BY Deptno)
ORDER BY Deptno;


/* 5. Using operator ANY choose people earning more than at least one person in dep 20 */

SELECT Ename
FROM Emp
WHERE Deptno != 20 AND Sal > ANY (SELECT Sal
                                  FROM EMP
                                  WHERE Deptno = 20);
                                  

/* 6. Choose people earning more than everybody working in dep 30 */

SELECT Ename, Sal
FROM Emp
WHERE Deptno != 30 AND Sal > ALL (SELECT Sal
                                  FROM Emp
                                  WHERE Deptno = 30);
                                  
                                  
/* 7. Find departments with average salaries higher than the average salary from dep 30 */

SELECT Deptno, AVG(Sal) AS Average
FROM Emp
GROUP BY Deptno
HAVING AVG(Sal) > (SELECT AVG(Sal)
                    FROM Emp
                    WHERE Deptno = 30
                    GROUP BY Deptno);
                    
                    
/* 8. Find the job with the lowest average salary. */

SELECT Job
FROM Emp
GROUP BY Job
HAVING AVG(Sal) = (SELECT MIN(AVG(Sal))
                    FROM Emp
                    GROUP BY Job);
                    
                    
/* 9. Find names and salaries of all people who earn more than the highest salary in department SALES. */

SELECT Ename, Sal
FROM Emp
WHERE Sal > (SELECT MAX(Sal)
             FROM Emp e, Dept d
             WHERE e.Deptno = d.Deptno AND d.Dname = 'SALES'
             GROUP BY d.Deptno);
             
             
/* 10. For each department find person employed as the last one */

SELECT Deptno, MIN(Hiredate)
FROM Emp
GROUP BY Deptno
ORDER BY Deptno;


/* 11. Find all departments where nobody is employed */

SELECT Dname
FROM Dept
WHERE DEPTNO NOT IN (SELECT Deptno
                      FROM Emp);
                      
                      
/* 12. Find people working in department not described in table DEPT */

SELECT Ename
FROM Emp e
WHERE e.Deptno NOT IN (SELECT Deptno
                        FROM Dept);
                        
                        
/* 13. Find people earning maximal salaries for their jobs. Present data by decreasing salraies */

SELECT e.Ename, e.Job, e.Sal
FROM Emp e
WHERE e.Sal = (SELECT MAX(b.Sal)
                FROM Emp b
                WHERE b.Job = e.Job
                GROUP BY b.Job)
ORDER BY e.Sal DESC;


/* 14. Who earns minimal salary for his own department? */

SELECT e.Ename, e.Deptno, e.Sal
FROM Emp e
WHERE e.Sal = (SELECT MIN(b.Sal)
                FROM Emp b
                WHERE b.Deptno = e.Deptno);
                
                
/* 15. Are there any people earning exactly the average salary for their own department? */

SELECT e.Ename, e.Sal, e.Deptno
FROM Emp e
WHERE e.Sal = (SELECT AVG(b.Sal)
                FROM Emp b
                WHERE b.Deptno = e.Deptno);
                
                
/* 16. Find department where the biggest number of people is employed */

SELECT Deptno, COUNT(Empno) AS Employees
FROM Emp
GROUP BY Deptno
HAVING COUNT(Empno) = (SELECT MAX(COUNT(Empno))
                        FROM Emp
                        GROUP BY Deptno);
                        
                        
/* 17. Show the list of names and the column called MAXDATE showing * for person employed as the last one */

SELECT Ename, ' ' AS MaxDate
FROM Emp
WHERE Hiredate != (SELECT MAX(Hiredate)
                    FROM Emp)
UNION
SELECT Ename, '*' AS MaxDate
FROM Emp
WHERE Hiredate = (SELECT MAX(Hiredate)
                    FROM Emp);
                    




