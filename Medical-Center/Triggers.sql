/* Before adding new appointment to patient check if he had enough visits already to get some discount */
CREATE OR REPLACE TRIGGER freq_patient_discount
    BEFORE INSERT OR UPDATE
    ON Appointment
    FOR EACH ROW
DECLARE
    discount INT;
BEGIN
    SELECT DISTINCT number_of_visits(:new.Patient_Id, :new.Treatment_Date) INTO discount FROM Appointment;
    :new.discount := discount;
    DBMS_OUTPUT.PUT_LINE('PATIENT id: ' || :new.patient_id || ' WAS GIVEN A 50% DISCOUNT');
END;

/* test
SET SERVEROUTPUT ON;

INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (2, 1, 1, TO_DATE('9-APR-2020 15:50', 'DD-MM-YYYY HH24:MI'), 150);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (2, 6, 2, TO_DATE('9-JAN-2020 10:00', 'DD-MM-YYYY HH24:MI'), 200);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (2, 3, 2, TO_DATE('9-JAN-2020 10:00', 'DD-MM-YYYY HH24:MI'), 200);

SELECT *
FROM Appointment
WHERE Patient_Id = 2;
ROLLBACK;
delete from appointment where patient_id = 2 and discount > 0;
commit;
*/


/* Before adding new appointment check if doctor has enough visits to get bonus this month */

CREATE OR REPLACE TRIGGER doctor_bonus
BEFORE INSERT OR UPDATE ON Appointment
    FOR EACH ROW
DECLARE
    income INT;
BEGIN
    SELECT DISTINCT doctor_income(:new.Doctor_Id, :new.Treatment_Date) INTO income FROM Appointment;
    IF income > 600 THEN
        UPDATE Employee SET Salary =+ 200 WHERE Id_Employee = :new.doctor_id;
        DBMS_OUTPUT.PUT_LINE('Doctor' || :new.doctor_id || ' Was given 200 zlt as a bonus');
    ELSIF income > 800 THEN
        UPDATE Employee SET Salary =+ 500 WHERE Id_Employee = :new.Doctor_Id;
        DBMS_OUTPUT.PUT_LINE('Doctor' || :new.doctor_id || ' Was given 500 zlt as a bonus');
    ELSIF income > 1000 THEN
        UPDATE Employee SET Salary =+ 1000 WHERE Id_Employee = :new.Doctor_Id;
        DBMS_OUTPUT.PUT_LINE('Doctor' || :new.doctor_id || ' Was given 1000 zlt as a bonus');
    END IF;
END;

/* test
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (20, 1, 8, TO_DATE('9-APR-2020 14:30', 'DD-MM-YYYY HH24:MI'), 420);
*/

/* Before deleting a position check if any doctor is currently working under this position */

CREATE OR REPLACE TRIGGER delete_position
AFTER DELETE ON Position
    FOR EACH ROW
DECLARE
    employees INT;
BEGIN
    SELECT COUNT(Id_Employee_Position) INTO employees
    FROM Employee_Position
    WHERE Position_Id = :old.Id_Position;
    
    IF employees > 0 THEN
        raise_application_error(-20000, 'Cannot delete position, ' || employees || ' employees are working under this position');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Position ' || :old.Position_Name || ' was succesfully deleted');
    END IF;
END;

/* test

DELETE FROM Position WHERE Id_Position = 5;


SELECT * FROM POsition;
INSERT INTO Position(Position_Name) VALUES ('New position');
DELETE FROM Position WHERE Position_Name = 'New position';
*/


/* After adding assinging Position to an Employee show how many doctors there are under the specialization of the assigned Employee */

CREATE OR REPLACE TRIGGER assign_position
BEFORE INSERT ON Employee_Position
    FOR EACH ROW
DECLARE
    count_employees NUMBER;
    position_title Position.Position_Name%TYPE;
BEGIN
    SELECT COUNT(Employee_Id) + 1 INTO count_employees
    FROM Employee_Position
    WHERE Position_Id = :new.Position_Id
    GROUP BY Position_Id;
    
    SELECT Position_Name INTO position_title
    FROM Position
    WHERE Id_Position = (SELECT DISTINCT Position_Id
                         FROM Employee_Position
                         WHERE Position_Id = :new.Position_Id);
    
    DBMS_OUTPUT.PUT_LINE('There are ' || count_employees || ' employees are currently working under position ' || position_title);
END;
commit;

/* test
SET SERVERTOUTPUT ON;
INSERT INTO Employee_Position (Employee_Id, Position_Id) VALUES (1, 3);
ROLLBACK;
*/

