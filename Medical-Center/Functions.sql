/* Function to count number of visits patient had in previous and next motnhs from the given date */

CREATE OR REPLACE FUNCTION number_of_visits(Id_P Patient.Id_Patient%TYPE, Visit_Date Appointment.Treatment_Date%TYPE)
    RETURN NUMBER IS
        patientVisits NUMBER;
        discount NUMBER;
    BEGIN
        SELECT COUNT(Id_Appointment) INTO patientVisits
        FROM Appointment
        WHERE Patient_Id = Id_P AND EXTRACT(MONTH FROM Treatment_Date) BETWEEN EXTRACT(MONTH FROM Visit_Date)-1 AND EXTRACT(MONTH FROM Visit_Date)+1;
        IF patientVisits < 3 THEN
            discount := 0;
        ELSIF patientVisits >= 3 THEN
            discount := 10;
        ELSIF patientVisits >= 5 THEN
            discount := 20;
        ELSIF patientVisits >= 10 THEN
            discount := 40;
        END IF;
    RETURN discount;
END;

/* test

select * from appointment where patient_id = 1;

select distinct number_of_visits(1, '05-JAN-2020') as "Discount for patient" from appointment;
*/


/* Function to check how many appointments does a doctor have in a given day and time*/

CREATE OR REPLACE FUNCTION is_free(id_d Appointment.Doctor_Id%TYPE, visit_day Appointment.Treatment_Date%TYPE)
    RETURN VARCHAR IS
        is_free VARCHAR(4) := 'busy';
        visits NUMBER;
    BEGIN
        SELECT COUNT(Id_Appointment) INTO visits
        FROM Appointment
        WHERE Doctor_Id = id_d AND treatment_date = visit_day;
        IF visits >= 1 THEN
            is_free := 'busy';
        ELSE
            is_free := 'free';
        END IF;
    RETURN is_free;
END;

/*
SELECT DISTINCT is_free(15, '05-JAN-20') AS "Doctor is" FROM Appointment;
SELECT DISTINCT is_free(1, '9-JAN-2020 10:00') AS "Doctor is" FROM Appointment;
*/


/* Give amount of income given doctor brought in a given month */

CREATE OR REPLACE FUNCTION doctor_income(id_d Appointment.Doctor_Id%TYPE, given_month Appointment.Treatment_Date%TYPE)
    RETURN NUMBER IS
        totalIncome NUMBER;
    BEGIN
        SELECT SUM(Price - NVL(Discount, 0)) INTO totalIncome
        FROM Appointment
        WHERE Doctor_Id = id_d AND EXTRACT(MONTH FROM Treatment_Date) = EXTRACT(MONTH FROM given_month);
    RETURN totalIncome;
END;

/* test
SELECT DISTINCT doctor_income(1, '9-JAN-2020') AS "Total income" FROM Appointment;
*/

/* Get id of patient which has visited given doctor most */

CREATE OR REPLACE FUNCTION get_doctors_best(id_d Appointment.Doctor_Id%TYPE)
    RETURN NUMBER
IS
    cnumber NUMBER;
    Cursor c1 IS
            SELECT patient_id
            FROM Appointment
            WHERE doctor_id = id_d
            GROUP BY patient_id
            HAVING COUNT(Id_Appointment) IN (SELECT MAX(COUNT(Id_Appointment))
                                                FROM Appointment
                                                WHERE doctor_id = id_d
                                                GROUP BY patient_id);
BEGIN
    OPEN c1;
        FETCH c1 INTO cnumber;
        IF c1%notfound THEN
            cnumber := 999;
        END IF;
        CLOSE c1;
    RETURN cnumber;
    EXCEPTION 
    WHEN OTHERS THEN
        raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/*
SELECT DISTINCT get_doctors_best(8) as "Doctor's best Patient" FROM Appointment;
SELECT DISTINCT get_doctors_best(0) as "Doctor's best Patient" FROM Appointment; --- with exception
*/