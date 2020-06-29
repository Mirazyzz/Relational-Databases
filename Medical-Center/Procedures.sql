----------adding new specialization to the table specialization-------
CREATE OR REPLACE PROCEDURE add_position
 (p_title IN Position.Position_Name%TYPE)
  
AS 
existing_position EXCEPTION; 
count_position NUMBER; -- to count if there exists any specialization with such a description

BEGIN
    SELECT COUNT(Id_Position) INTO count_position FROM Position WHERE Position_Name = p_title;
    IF count_position > 0 THEN
        RAISE existing_position;
    ELSE 
        INSERT INTO Position (Position_Name) VALUES(p_title);
        dbms_output.put_line('Position was added succesfully');
    END IF;
     EXCEPTION
        WHEN existing_position THEN
            DBMS_OUTPUT.PUT_LINE('EXISTING Position!!!');
END;

/* test

SET SERVEROUTPUT ON;
execute add_position('Lorist');
execute add_spec('Dentist'); ---exception
*/

/* Find doctors by given position */

CREATE OR REPLACE PROCEDURE Find_Doctor
    (p_title IN Position.Position_Name%TYPE)
AS
no_visit EXCEPTION;    -- check if there is no doctor with given spec
doctor_name Employee.First_Name%TYPE;-- to fetch all names of doctors that have this spec
doctor_max Employee.First_Name%TYPE;   -- to get doctor that has min number of visits
doctor_min Employee.First_Name%TYPE; -- to get doctor that has max number of visits
doctor_count NUMBER; -- count number of doctors
visit_count NUMBER; -- count number of visits of doctors that have the specialization
max_visit NUMBER;
min_visit NUMBER;
 CURSOR doc IS SELECT First_Name
 FROM Employee
 INNER JOIN Employee_Position ON Employee_Id = Id_Employee
 INNER JOIN Position ON Position_Id = Id_Position
 WHERE Position_Name = p_title;
 
BEGIN
--counting number of visits
    SELECT COUNT(Id_Appointment) INTO visit_count FROM Appointment, Employee, Employee_Position, Position
    WHERE Id_Employee = Doctor_Id AND Employee_Id = Id_Employee AND Position_id = Id_Position AND Position_Name = p_title;
  
    IF visit_count < 1 THEN
        RAISE no_visit;
    ELSE
  
    --getting number of min visit that has this doctor with this spec
    SELECT MIN(COUNT(Id_Appointment)) INTO min_visit 
    FROM Appointment, Employee, Employee_Position, Position
    WHERE Doctor_Id = Id_Employee AND Employee_Id = Id_Employee AND Position_Id = Id_Position AND Position_Name = p_title
    GROUP BY First_Name;
    
    --getting number of max visit that has doctor with this spec
    SELECT MAX(COUNT(Id_Appointment)) INTO max_visit 
    FROM Appointment, Employee, Employee_Position, Position
    WHERE Doctor_Id = Id_Employee AND Employee_Id = Id_Employee AND Position_Id = Id_Position AND Position_Name = p_title
    GROUP BY First_Name;

    --getting name of doctor that has min number of visits
    SELECT First_Name INTO doctor_min 
    FROM Employee, Position, Employee_Position, Appointment
    WHERE Id_Employee = Employee_Id AND Id_Position = Position_id AND Id_Employee = Doctor_Id AND Position_Name = p_title
    GROUP BY First_Name
    HAVING COUNT(Id_Appointment) = (SELECT MIN(COUNT(Id_Appointment))  
                                    FROM Employee, Position, Employee_Position, Appointment
                                    WHERE Id_Employee = Employee_Id AND Id_Position = Position_id AND Id_Employee = Doctor_Id AND Position_Name = p_title
                                    GROUP BY First_Name);
    
    --getting name of doctor that has max number of visits
    SELECT First_Name INTO doctor_max 
    FROM Employee, Position, Employee_Position, Appointment
    WHERE Id_Employee = Employee_Id AND Id_Position = Position_id AND Id_Employee = Doctor_Id AND Position_Name = p_title
    GROUP BY First_Name
    HAVING COUNT(Id_Appointment) = (SELECT MAX(COUNT(Id_Appointment))  
                                    FROM Employee, Position, Employee_Position, Appointment
                                    WHERE Id_Employee = Employee_Id AND Id_Position = Position_id AND Id_Employee = Doctor_Id AND Position_Name = p_title
                                    GROUP BY First_Name);

           DBMS_OUTPUT.PUT_LINE ('Doctor |' || chr(15) || 'Max_Visit|' || chr(15) || ' Min_Visit');
           DBMS_OUTPUT.PUT_LINE (doctor_max || '       ' || max_visit || '         ');
           DBMS_OUTPUT.PUT_LINE (doctor_min || '                 ' || min_visit);           
           DBMS_OUTPUT.PUT_LINE ('----------------------------------------------------------');
           
           DBMS_OUTPUT.PUT_LINE('List of other doctors having this specialization :');
    
    OPEN doc;
    LOOP
    FETCH doc INTO doctor_name;
        EXIT WHEN doc%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(doctor_name);
    END LOOP;
    CLOSE doc;
    END IF;
    EXCEPTION
        WHEN no_visit THEN
            DBMS_OUTPUT.PUT_LINE('There is no doctor having visit with such a specialization!');
END;
/* test

SET SERVEROUTPUT ON;
execute find_doctor('Dentist');
execute find_doctor('Traumotologist');   ---- exception
*/
