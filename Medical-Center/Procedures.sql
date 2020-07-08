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

/* Find doctors by given position and shows doctors who have the highest and the lowest number of apopintments under this position*/

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

           DBMS_OUTPUT.PUT_LINE ('Doctor |' || '  ' || 'Highest appointments |' || '  ' || ' Lowest appointments');
           DBMS_OUTPUT.PUT_LINE (doctor_max || '       ' || max_visit || '         ');
           DBMS_OUTPUT.PUT_LINE (doctor_min || '                 ' || min_visit);           
           DBMS_OUTPUT.PUT_LINE ('----------------------------------------------------------');
           
           DBMS_OUTPUT.PUT_LINE('List of all doctors having this specialization');
    
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
execute find_doctor('Traumotologist'); -- with exception
*/


/* Procedure that makes new appointment and assigns to a given treatment */

CREATE OR REPLACE PROCEDURE new_appointment(id_p Appointment.Patient_Id%TYPE, id_d Appointment.Doctor_Id%TYPE,
                                            id_di Appointment.Diagnosis_Id%TYPE, t_date Appointment.Treatment_Date%TYPE,
                                            a_price Appointment.Price%TYPE, t_title Treatment.Treatment_Type%TYPE)
AS
doctor_not_free EXCEPTION; -- check if doctor does not have an appointment in a given time
no_patient EXCEPTION; -- check if there is a patient by given id
no_doctor EXCEPTION; -- check if there is  a doctor by given id
no_treatment EXCEPTION; -- check if there is a treatment by given type

patient_count NUMBER;
doctor_count NUMBER;
treatment_count NUMBER;

doctorId Appointment.Doctor_Id%TYPE;           -- to pass to function
treatmentId Treatment.Id_Treatment%TYPE;       -- to make new appointment treatment
appointmentId Appointment.Id_Appointment%TYPE; -- to choose the recent added appointment

doctor_date Appointment.Treatment_Date%TYPE; -- to show time when doctor is free
schedule_start Schedule.Time_Start%TYPE;     -- for time from which doctor is free
schedule_end Schedule.Time_End%TYPE;         -- for time until which doctor is free

    CURSOR doctor_appointments IS SELECT Treatment_Date
    FROM Appointment
    WHERE Doctor_Id = id_d AND EXTRACT(MONTH FROM Treatment_Date) = EXTRACT(MONTH FROM t_date)
                           AND EXTRACT(DAY FROM Treatment_Date) = EXTRACT(DAY FROM t_date); -- all appointments of doctor in given day
BEGIN
    
    SELECT COUNT(Id_Patient) INTO patient_count FROM Patient WHERE Id_Patient = id_p;
    SELECT COUNT(Id_Employee) INTO doctor_count FROM Employee WHERE Id_Employee = id_d;
    SELECT COUNT(Id_Treatment) INTO treatment_count FROM Treatment WHERE Treatment_Type = t_title;

    -- check if there is a patient
    IF patient_count = 0 THEN
        RAISE no_patient;
    -- check if there is a doctor
    ELSIF doctor_count = 0 THEN
        RAISE no_doctor;
    -- check if there is a given treatment type
    ELSIF treatment_count = 0 THEN
        RAISE no_treatment;
    -- check if doctor does not have appointments in a given date
    ELSIF is_free(id_d, t_date) = 'busy' THEN
        RAISE doctor_not_free;
    ELSE
        -- make a new appointment
        INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price) 
        VALUES (id_p, id_d, id_di, t_date, a_price);
        
        SELECT DISTINCT Id_Treatment INTO treatmentId FROM Treatment WHERE Treatment_Type = t_title;
        SELECT MAX(Id_Appointment) INTO appointmentId FROM Appointment;
        INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
        VALUES (appointmentId, treatmentId);
        
        DBMS_OUTPUT.PUT_LINE('New appointment was made and assigned to treatment ' || t_title);
    END IF;
    
    EXCEPTION
        WHEN doctor_not_free THEN
            DBMS_OUTPUT.PUT_LINE('Doctor is not free in a given date, please, choose another time!');
            
            SELECT Time_Start INTO schedule_start
            FROM Schedule
            INNER JOIN Employee_Schedule ON Schedule_Id = Id_Schedule
            WHERE Employee_Id = id_d
            FETCH FIRST ROW ONLY;
            
            SELECT Time_End INTO schedule_end
            FROM Schedule
            INNER JOIN Employee_Schedule ON Schedule_Id = Id_Schedule
            WHERE Employee_Id = id_d
            FETCH FIRST ROW ONLY;
            OPEN doctor_appointments;
            LOOP
            FETCH doctor_appointments INTO doctor_date;
                EXIT WHEN doctor_appointments%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('You can choose time from ' || schedule_start || ' - ' || TO_CHAR(doctor_date, 'HH24') || ':' || TO_CHAR(doctor_date, 'MI') || ' and ' || TO_CHAR(doctor_date, 'HH24') || ':' || TO_CHAR(doctor_date, 'MI') || ' - ' || schedule_end);
            END LOOP;
            CLOSE doctor_appointments;
        WHEN no_patient THEN
            DBMS_OUTPUT.PUT_LINE('There is no patient can be found by given id!');
        WHEN no_doctor THEN
            DBMS_OUTPUT.PUT_LINE('There is no doctor can be found by given id!');
        WHEN no_treatment THEN
            DBMS_OUTPUT.PUT_LINE('Currently, the clinic does not provide given treatment');
END;

/* test
SET SERVEROUTPUT ON;
execute new_appointment(4, 1, 8, '09-APR-20 02.40', 800, 'Consultation');
execute new_appointment(4, 100, 8, '09-APR-20 02.40', 800, 'Consultation'); -- no doctor exception
execute new_appointment(400, 1, 8, '09-APR-20 02.40', 800, 'Consultation'); -- no patient exception
execute new_appointment(4, 1, 8, '09-APR-20 02.40', 800, 'NOTREATMENT');-- no treatment exception
*/