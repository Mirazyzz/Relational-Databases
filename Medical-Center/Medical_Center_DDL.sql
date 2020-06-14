DROP TABLE Appointment_Treatment;
DROP TABLE Appointment;
DROP TABLE Treatment;
DROP TABLE Employee_Position;
DROP TABLE Position;
DROP TABLE Employee_Schedule;
DROP TABLE Schedule;
DROP TABLE Employee;
DROP TABLE Diagnosis;
DROP TABLE Disease;
DROP TABLE Disease_Category;
DROP TABLE Patient;
DROP TABLE Insurance;

-----------------------------

CREATE TABLE Insurance(
    Id_Insurance INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Company_Name NVARCHAR2(40),
    Phone_Number NVARCHAR2(40),
    Coverage NUMBER
);

CREATE TABLE Patient(
    Id_Patient INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Insurance_Id INT,
    First_Name NVARCHAR2(50) NOT NULL,
    Last_Name NVARCHAR2(50),
    Sex NVARCHAR2(6),
    Email NVARCHAR2(40),
    Phone_Number NVARCHAR2(20),
    Address NVARCHAR2(250),
    BirthDate DATE,
    CONSTRAINT Fk_Insurance FOREIGN KEY (Insurance_Id)
    REFERENCES Insurance (Id_Insurance)
);

CREATE TABLE Disease_Category(
    Id_Category INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Category_Name NVARCHAR2(100)
);

CREATE TABLE Disease(
    Id_Disease INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Disease_Name NVARCHAR2(100),
    Category_Id INT,
    CONSTRAINT Fk_Category FOREIGN KEY (Category_Id)
    REFERENCES Disease_Category (Id_Category)
);

CREATE TABLE Diagnosis(
    Id_Diagnosis INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Disease_Id INT,
    Description NVARCHAR2(600),
    CONSTRAINT Fk_Disease FOREIGN KEY (Disease_Id)
    REFERENCES Disease (Id_Disease)
);

CREATE TABLE Treatment(
    Id_Treatment INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Treatment_Type NVARCHAR2(100)
);

CREATE TABLE Position(
    Id_Position INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Position_NAME NVARCHAR2(40)
);


CREATE TABLE Schedule(
    Id_Schedule INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Time_Start NVARCHAR2(10) CHECK (regexp_like(Time_Start, '[0-9]{2}:[0-9]{2}')),
    Time_End NVARCHAR2(10) CHECK (regexp_like(Time_End, '[0-9]{2}:[0-9]{2}')),
    Work_Month DATE
);


CREATE TABLE Employee(
    Id_Employee INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    First_Name NVARCHAR2(50) NOT NULL,
    Last_Name NVARCHAR2(50),
    Email NVARCHAR2(40),
    Phone_Number NVARCHAR2(20),
    Salary NUMBER
);


CREATE TABLE Employee_Schedule(
    Id_Employee_Schedule INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Employee_Id INT,
    Schedule_Id INT,
    CONSTRAINT Fk_Employee_Schedule FOREIGN KEY (Employee_Id)
    REFERENCES Employee (Id_Employee),
    CONSTRAINT Fk_Schedule FOREIGN KEY (Schedule_Id)
    REFERENCES Schedule (Id_Schedule)
);

CREATE TABLE Employee_Position(
    Id_Employee_Position INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Employee_Id INT,
    Position_Id INT,
    CONSTRAINT Fk_Employee_Position FOREIGN KEY (Employee_Id)
    REFERENCES Employee (Id_Employee),
    CONSTRAINT Fk_Position FOREIGN KEY (Position_Id)
    REFERENCES Position (Id_Position)
);


CREATE TABLE Appointment(
    Id_Appointment INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Patient_Id INT,
    Doctor_Id INT,
    Diagnosis_Id INT,
    Treatment_Date TIMESTAMP,
    Price NUMBER,
    Discount NUMBER,
    CONSTRAINT Fk_Patient FOREIGN KEY (Patient_Id)
    REFERENCES Patient (Id_Patient),
    CONSTRAINT Fk_Doctor FOREIGN KEY (Doctor_Id)
    REFERENCES Employee (Id_Employee),
    CONSTRAINT Fk_Diagnosis FOREIGN KEY (Diagnosis_Id)
    REFERENCES Diagnosis (Id_Diagnosis)
);


CREATE TABLE Appointment_Treatment(
    Id_Appointment_Treatment INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Appointment_Id INT,
    Treatment_Id INT,
    CONSTRAINT Fk_Appointment FOREIGN KEY (Appointment_Id)
    REFERENCES Appointment (Id_Appointment),
    CONSTRAINT Fk_Treatment FOREIGN KEY (Treatment_Id)
    REFERENCES Treatment (Id_Treatment)
);

COMMIT;
ROLLBACK;