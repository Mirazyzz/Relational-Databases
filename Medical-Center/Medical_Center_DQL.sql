/* Find the month in which there were the least amount of visits */

SELECT TO_CHAR(TO_DATE(EXTRACT(MONTH FROM Treatment_Date) ,'MM'), 'MONTH') AS "Month"
FROM Appointment
GROUP BY EXTRACT(MONTH FROM Treatment_Date)
HAVING COUNT(Id_Appointment) = (SELECT MIN(COUNT(Id_Appointment))
                                FROM Appointment
                                GROUP BY EXTRACT(MONTH FROM Treatment_Date));

/* Show top 2 visited doctors for all time */

SELECT First_Name, Last_Name, COUNT(Id_Appointment) AS "Number of appointments"
FROM Employee e
INNER JOIN Appointment a ON a.Doctor_Id = e.Id_Employee
GROUP BY First_Name, Last_Name
ORDER BY COUNT(Id_Appointment) DESC
FETCH FIRST 2 ROWS ONLY;


/* Show patients treated by Jo Mair*/

SELECT p.First_Name, p.Last_Name, a.Treatment_Date, a.Price
FROM Appointment a
INNER JOIN Employee e ON e.Id_Employee = a.Doctor_Id
INNER JOIN Patient p ON p.Id_Patient = a.Patient_Id
WHERE e.First_Name LIKE 'Saoirse' AND e.Last_Name = 'Rasmussen';


/* Show patients who had ever disease Cracked teeth*/

SELECT p.First_Name, p.Last_Name
FROM Appointment a
INNER JOIN Patient p ON a.Patient_Id = p.Id_Patient
INNER JOIN Diagnosis d ON a.Diagnosis_Id = d.Id_Diagnosis
INNER JOIN Disease dis ON d.Disease_Id = dis.Id_Disease
WHERE dis.Disease_Name LIKE 'Cracked teeth';


/* How much each doctor earned in April */

SELECT e.First_Name, SUM(a.Price - NVL(a.Discount, 0)) AS "Total sum"
FROM Appointment a
INNER JOIN Employee e ON a.Doctor_Id = e.Id_Employee
WHERE a.Treatment_Date BETWEEN '01-APR-2020' AND '30-APR-2020'
GROUP BY e.First_Name;
                        
                        
/* Show 3 most popular diseases among patients */

/*                                                            
SELECT Disease_Name, COUNT(a.Id_Appointment) AS "Number of patients"
FROM Disease d
INNER JOIN Diagnosis di ON d.Id_Disease = di.Disease_Id
INNER JOIN Appointment a ON di.Id_Diagnosis = a.Diagnosis_Id
GROUP BY Disease_Name
ORDER BY COUNT(a.Id_Appointment) DESC
FETCH FIRST 3 ROWS ONLY;
*/

SELECT Disease_Name
FROM Disease
INNER JOIN Diagnosis ON Disease_Id = Id_Disease
WHERE Id_Diagnosis = (SELECT Diagnosis_Id
                        FROM Appointment
                        GROUP BY Diagnosis_Id
                        HAVING COUNT(Id_Appointment) = (SELECT MAX(COUNT(id_appointment))
                                                        FROM appointment
                                                        GROUP BY diagnosis_id));

/* Show Doctor who brought more money that everybody for all time */

SELECT e.First_Name, e.Last_Name, SUM(a.Price - NVL(a.Discount, 0)) AS "Total earning"
FROM Appointment a
INNER JOIN Employee e ON a.Doctor_Id = e.Id_Employee
GROUP BY e.First_Name, e.Last_Name
HAVING SUM(a.Price) = (SELECT MAX(SUM(Price - NVL(Discount, 0)))
                        FROM Appointment
                        GROUP BY Doctor_Id);
                        
                        
/* Show how much each specailization of doctors bring money in March*/

SELECT Position_Name AS Specialization, SUM(Price) AS "Total income"
FROM Position
INNER JOIN Employee_Position ON Position_Id = Id_Position
INNER JOIN Employee ON Employee_Id = Id_Employee
INNER JOIN Appointment ON Doctor_Id = Id_Employee
WHERE Treatment_Date BETWEEN '01-MAR-2020' AND '31-MAR-2020'
GROUP BY Position_Name;


/* Show patients who had Stomatology disease */

SELECT DISTINCT(First_Name)
FROM Patient
INNER JOIN Appointment ON Patient_Id = Id_Patient
INNER JOIN Diagnosis ON Diagnosis_Id = Id_Diagnosis
INNER JOIN Disease ON Disease_Id = Id_Disease
INNER JOIN Disease_Category ON Category_Id = Id_Category
WHERE Category_Name LIKE '%Stomatologist%'
GROUP BY First_Name
HAVING COUNT(Id_Appointment) >= 1;


/* What is the most popular disease among patients between age 25 and 20? */

SELECT Disease_Name
FROM Disease
INNER JOIN Diagnosis ON Disease_Id = Id_Disease
INNER JOIN Appointment ON Diagnosis_Id = Id_Diagnosis
GROUP BY Disease_Name
HAVING COUNT(Diagnosis_Id) = (SELECT MAX(COUNT(Diagnosis_Id))
                                FROM APPOINTMENT
                                INNER JOIN Patient ON Patient_Id = Id_Patient
                                WHERE Birthdate BETWEEN '01-JAN-1990' AND '01-JAN-2000'
                                GROUP BY Patient_Id);
                                
                                
/* Show the most popular type of treatment for each disesae */

SELECT DISTINCT(Disease_Name) AS "Disease", Treatment_Type AS "Treatment"
FROM Disease, Diagnosis d, Appointment, Appointment_Treatment, Treatment
WHERE Id_Disease = Disease_Id AND Id_Diagnosis = Diagnosis_Id AND Id_Appointment = Appointment_Id AND
      Id_Treatment = Treatment_Id AND Treatment_Id IN (SELECT Treatment_Id
                                                        FROM Appointment_Treatment
                                                        WHERE Appointment_Id IN (SELECT Id_Appointment
                                                                                    FROM Appointment
                                                                                    WHERE Diagnosis_Id = d.id_diagnosis)
                                                        GROUP BY Treatment_Id
                                                        HAVING COUNT(Id_Appointment_Treatment) = (SELECT MAX(COUNT(Id_Appointment_Treatment))
                                                                                                    FROM Appointment_Treatment
                                                                                                    WHERE Appointment_Id IN (SELECT Id_Appointment
                                                                                                                            FROM Appointment
                                                                                                                            WHERE Diagnosis_Id = d.id_diagnosis)
                                                                                                    GROUP BY Treatment_Id))
ORDER BY Disease_Name, Treatment_Type;
                                                                                                         

/*

SELECT Disease_name, Treatment_Type
FROM Disease
INNER JOIN Diagnosis ON Disease_Id = Id_Disease
INNER JOIN Appointment ON Diagnosis_Id = Id_Diagnosis
INNER JOIN Appointment_Treatment a ON Treatment_Id = Id_Appointment
INNER JOIN Treatment ON Treatment_Id = Id_Treatment
WHERE Treatment_Type = (SELECT Treatment_Type
                        FROM Treatment
                        INNER JOIN Appointment_Treatment ON Treatment_Id = Id_Treatment
                        GROUP BY Treatment_Type
                        HAVING COUNT(Id_Appointment_Treatment) = (SELECT MAX(COUNT(Id_Appointment_Treatment))
                                                                    FROM Appointment_Treatment
                                                                    WHERE Appointment_Id = a.Appointment_Id
                                                                    GROUP BY Treatment_Id));
*/


/* For each specialization find the number of employee */

SELECT Position_Name, COUNT(Id_Employee_Position) AS "Number of employees"
FROM Position, Employee_Position, Employee
WHERE Id_Position = Position_Id AND Id_Employee= Employee_Id
GROUP BY Position_Name
ORDER BY COUNT(Id_Employee_Position) DESC;