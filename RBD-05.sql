SELECT e.Ename, NVL(e.Comm, 0)
FROM Emp e
WHERE 4 >= (SELECT COUNT(NVL(COMM, 0))
            FROM Emp
            NVL(Comm,0) > NVL(e.Comm,0));