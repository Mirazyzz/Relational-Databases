----------- Insurance -------------

INSERT INTO Insurance (Company_Name, Phone_Number, Coverage)
VALUES ('PZU', '123-456-789', 2000);
INSERT INTO Insurance (Company_Name,Phone_Number, Coverage)
VALUES ('Health Insurance', '241-423-521', 1500);
INSERT INTO Insurance (Company_Name, Phone_Number, Coverage)
VALUES ('Polska Ubespeczenia', '538-231-674', 3000);
INSERT INTO Insurance (Company_Name,Phone_Number, Coverage)
VALUES ('Life Care', '852-382-332', 3500);


/* test
SELECT * FROM Insurance;
*/


------- Patient -------

INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (1, 'John', 'Done', 'Male', 'John@Done.mail', '423-888-321', 'Kozykowa-4, Warsaw, Poland', '02-JAN-1990');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (2, 'Robert', 'Simpson', 'Male', 'Robert87@gmail.mail', '444-828-321', 'Centrum, Warsaw, Poland', '02-MAR-1987');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (1, 'Anna', 'Robertson', 'Female', 'Anna@work.mail', '443-188-361', 'Ksiazace 82, Warsaw, Poland', '02-FEB-1994');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (3, 'Jan', 'Kowalski', 'Male', 'Jan22@gmail.mail', '522-818-521', 'Stepniska 24, Warsaw, Poland', '04-JUN-1992');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (4, 'Elisabeth', 'Anderson', 'Female', 'Elisabeth@mail.com', '428-448-781', 'Pole Mokotowski, Warsaw, Poland', '02-JAN-1990');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (4, 'John', 'Jones', 'Male', 'John@iron.com', '883-888-381', 'Plac Konstytucji, Warsaw, Poland', '02-DEC-1986');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (1, 'Alexandra', 'Janson', 'Female', 'Alexandra@make.com', '424-226-321', 'Stare Miasto, Warsaw, Poland', '02-OCT-1992');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (2, 'Michael', 'Johnson', 'Male', 'Micahel@personal.mail', '433-855-332', 'Biblioteka Naradowe, Warsaw, Poland', '04-JUL-1976');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (1, 'Maria', 'Json', 'Female', 'Maria@db.mail', '463-964-221', 'Rondo ONZ, Warsaw, Poland', '02-APR-1988');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (3, 'Jordan', 'Peterson', 'Male', 'Compilation@gmail.com', '423-358-344', 'Zelazna, Warsaw, Poland', '04-MAY-1972');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (1, 'Nate', 'Diaz', 'Male', 'Nate@Done.mail', '422-348-331', 'Bartycka, Warsaw, Poland', '06-JAN-1988');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (2, 'Braydon', 'Wilder', 'Male', 'Brayd7@gmail.mail', '764-845-351', 'Mokotow, Warsaw, Poland', '03-MAR-1984');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (1, 'Marni', 'Lang', 'Female', 'marni@work.mail', '128-148-565', 'Ksiazace 44, Warsaw, Poland', '15-FEB-1992');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (3, 'Rui', 'Collins', 'Male', 'Collins@gmail.com', '525-518-421', 'Stokgoslki 42, Warsaw, Poland', '26-JUN-1993');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (4, 'Tamzin', 'Palmer', 'Female', 'Tamzin@mail.com', '418-472-991', 'Pole Mokotowski, Warsaw, Poland', '28-JAN-1976');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (4, 'Eammon', 'Coppe', 'Male', 'Cope@iron.com', '223-282-384', 'Bibloteka Politechniki, Warsaw, Poland', '23-DEC-1986');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (1, 'Anna', 'Dillon', 'Female', 'Dillon@make.com', '424-244-331', 'Politechnika, Warsaw, Poland', '22-OCT-1986');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (2, 'Kaylan', 'Joseph', 'Male', 'Kaylan@personal.mail', '441-822-232', 'Kabaty 41, Warsaw, Poland', '14-JUL-1979');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (1, 'Mandy', 'Grimes', 'Female', 'Mandy@db.mail', '441-994-339', 'Ursynow, Warsaw, Poland', '12-APR-1982');
INSERT INTO Patient (Insurance_Id, First_Name, Last_Name, Sex, Email, Phone_Number, Address, Birthdate) 
VALUES (3, 'Kylo', 'Mclean', 'Female', 'Jane@gmail.com', '499-348-234', 'Plac Uni Lubelski, Warsaw, Poland', '28-MAY-1982');

/* test
SELECT * FROM Patient;
*/

---------- Disase category ----------
INSERT INTO Disease_Category (Category_Name)
VALUES ('Stomatologist disease');
INSERT INTO Disease_Category (Category_Name)
VALUES ('Neurology disease');
INSERT INTO Disease_Category (Category_Name)
VALUES ('Endocrinological disease');
INSERT INTO Disease_Category (Category_Name)
VALUES ('Dermotological disease');

/* test
SELECT * FROM Disease_Category;
*/


------ Disease ------

INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Cavities', 1);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Gum Disease', 1);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Periodontitis', 1);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Cracked teeth', 1);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Root decay', 1); 
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Vitiligo', 4);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Eczema', 4);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Hives', 4);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Seobrrheic Dermatitis', 4);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Rosacea', 3);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Multiple sclerosis', 3);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Parkisons disease', 3);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Brain tumors', 2);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Epilepsy', 2);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Migraine and headache disorders', 2);
INSERT INTO Disease (Disease_name, Category_Id)
VALUES ('Alzheimers disease', 2);

/* test
SELECT * FROM Disease;
*/


------- Diagnosis ------------

INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (14, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (15, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt.');
INSERT INTO Diagnosis (Disease_Id, Description)
VALUES (16, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel mattis diam. Cras nec odio sagittis, blandit elit non, 
tempor velit. Nulla facilisi. Donec dictum magna vel ultrices dignissim. Praesent fermentum augue non diam scelerisque tincidunt. 
Pellentesque nunc tortor, vestibulum sit amet finibus eu, mollis at tellus. Cras at nibh tempus, ultrices eros at, iaculis augue. 
Cras finibus dui at dolor sagittis, suscipit consequat ligula dapibus. Nunc in sapien ut libero facilisis efficitur id et quam.');

/* test
SELECT * FROM Diagnosis;
*/


--------- Treatment -------------

INSERT INTO Treatment (Treatment_Type)
VALUES ('Consultation');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Profilaxis');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Fluoride Treatment');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Wisdom teeth removal');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Dental exams and teeth cleanings');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Skin biopsy');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Shave removal');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Conservative therapy');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Vascular care');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Autonomic disorder');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Treatment of amiodarone');
INSERT INTO Treatment (Treatment_Type)
VALUES ('Treatment of atheroscelerosis');

/* test
SELECT * FROM Treatment;
*/


------- Position -------

INSERT INTO Position (Position_Name)
VALUES ('Dentist');
INSERT INTO Position (Position_Name)
VALUES ('Endocrinologist');
INSERT INTO Position (Position_Name)
VALUES ('Neurologist');
INSERT INTO Position (Position_Name)
VALUES ('Dermotologist');
INSERT INTO Position (Position_Name)
VALUES ('Receptionist');
INSERT INTO Position (Position_Name)
VALUES ('Security');
INSERT INTO Position (Position_Name)
VALUES ('Administrator');

/* test
SELECT * FROM Position
*/


------- Schedule ---------

INSERT INTO Schedule (Time_Start, Time_End, Work_Month)
VALUES ('08:00', '16:00', TO_DATE('JAN-2020', 'MM/YY'));
INSERT INTO Schedule (Time_Start, Time_End, Work_Month)
VALUES ('16:00', '00:00', TO_DATE('JAN-2020', 'MM/YY'));
INSERT INTO Schedule (Time_Start, Time_End, Work_Month)
VALUES ('00:00', '08:00', TO_DATE('JAN-2020', 'MM/YY'));
INSERT INTO Schedule (Time_Start, Time_End, Work_Month)
VALUES ('08:00', '16:00', TO_DATE('FEB-2020', 'MM/YY'));
INSERT INTO Schedule (Time_Start, Time_End, Work_Month)
VALUES ('16:00', '00:00', TO_DATE('FEB-2020', 'MM/YY'));
INSERT INTO Schedule (Time_Start, Time_End, Work_Month)
VALUES ('00:00', '08:00', TO_DATE('FEB-2020', 'MM/YY'));
INSERT INTO Schedule (Time_Start, Time_End, Work_Month)
VALUES ('08:00', '16:00', TO_DATE('MAR-2020', 'MM/YY'));
INSERT INTO Schedule (Time_Start, Time_End, Work_Month)
VALUES ('16:00', '00:00', TO_DATE('MAR-2020', 'MM/YY'));
INSERT INTO Schedule (Time_Start, Time_End, Work_Month)
VALUES ('00:00', '08:00', TO_DATE('MAR-2020', 'MM/YY'));

/* test
SELECT * FROM Schedule;
*/
--------- Employee --------

INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Azeem', 'Franks','drAz@gmail.com', '656-855-952', 3000);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Cherie', 'Braun','Cher@gmail.com', '626-876-452', 2500);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Jo', 'Mair','Jo@gmail.com', '321-259-942', 3500);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Manveer', 'Brennan','Mar@gmail.com', '411-819-902', 4000);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Eryn', 'Sims','Eryn@gmail.com', '432-820-902', 3000);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Sulayman', 'Hobs','Hobs@gmail.com', '243-869-962', 27000);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Saoirse', 'Rasmussen','Saoirse@gmail.com', '497-879-737', 2850);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Veer', 'Barron','Bar@gmail.com', '486-219-535', 3100);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Dillan', 'Finch','drDill@gmail.com', '121-822-944', 3400);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Manraj', 'Crawford','Crawf@gmail.com', '893-979-762', 2360);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Marcel', 'Mcpherson','marc@gmail.com', '212-255-562', 2050);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Robin', 'Holden','Rob@gmail.com', '413-229-332', 1850);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Sid', 'Dunkley','dunk@gmail.com', '443-359-962', 1950);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Nala', 'Scoto','Nala@gmail.com', '412-259-944', 1650);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Bella', 'Terry','Terry21@gmail.com', '289-299-862', 1900);
INSERT INTO Employee (First_Name, Last_Name, Email, Phone_Number, Salary)
VALUES ('Kishan', 'Schaefer','Kishan95@gmail.com', '414-449-332', 1750);

/* test
SELECT  * FROM Employee;
*/



----- Employee Schedule ----------

INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (1, 1);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (1, 4);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (1, 7);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (2, 2);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (2, 5);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (2, 8);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (3, 3);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (3, 6);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (3, 9);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (4, 1);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (4, 5);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (4, 9);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (5, 2);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (5, 4);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (5, 7);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (6, 3);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (6, 5);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (6, 8);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (7, 2);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (7, 4);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (7, 7);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (8, 1);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (8, 6);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (8, 9);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (9, 3);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (9, 5);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (9, 7);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (10, 2);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (10, 6);
INSERT INTO Employee_Schedule (Employee_Id, Schedule_Id)
VALUES (10, 9);

/* test
SELECT * FROM Employee_Schedule;
*/


----- Employee Position ----------

INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (1, 1);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (1, 2);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (2, 1);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (2, 4);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (3, 3);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (4, 4);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (5, 4);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (6, 2);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (7, 1);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (7, 3);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (8, 2);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (9, 4);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (9, 1);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (10, 2);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (11, 5);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (12, 5);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (13, 6);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (14, 6);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (15, 7);
INSERT INTO Employee_Position (Employee_Id, Position_Id)
VALUES (16, 7);

/* test
SELECT * FROM Employee_Position
*/


----- Appointment ---------

INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (1, 1, 1, TO_DATE('05-JAN-2020 10:00', 'DD-MM-YYYY HH24:MI'), 212.20);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (1, 1, 2, TO_DATE('07-FEB-2020 15:00', 'DD-MM-YYYY HH24:MI'), 200);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (1, 2, 3, TO_DATE('09-MAR-2020 19:00', 'DD-MM-YYYY HH24:MI'), 180);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (2, 10, 1, TO_DATE('04-JAN-2020 20:00', 'DD-MM-YYYY HH24:MI'), 192.20);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (2, 10, 4, TO_DATE('03-JAN-2020 23:00', 'DD-MM-YYYY HH24:MI'), 190.52);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (2, 8, 5, TO_DATE('02-JAN-2020 22:00', 'DD-MM-YYYY HH24:MI'), 180.85);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (3, 7, 6, TO_DATE('15-JAN-2020 15:00', 'DD-MM-YYYY HH24:MI'), 190.52);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (3, 6, 7, TO_DATE('14-JAN-2020 14:00', 'DD-MM-YYYY HH24:MI'), 180);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (4, 5, 8, TO_DATE('13-JAN-2020 13:00', 'DD-MM-YYYY HH24:MI'), 170);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (4, 3, 9, TO_DATE('12-JAN-2020 12:00', 'DD-MM-YYYY HH24:MI'), 160);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (5, 2, 10, TO_DATE('14-JAN-2020 11:00', 'DD-MM-YYYY HH24:MI'), 165.42);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (5, 4, 12, TO_DATE('15-JAN-2020 10:00', 'DD-MM-YYYY HH24:MI'), 210.25);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (6, 10, 13, TO_DATE('16-JAN-2020 15:00', 'DD-MM-YYYY HH24:MI'), 50.21);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (7, 9, 14, TO_DATE('16-JAN-2020 12:00', 'DD-MM-YYYY HH24:MI'), 40.52);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (7, 8, 15, TO_DATE('17-JAN-2020 13:00', 'DD-MM-YYYY HH24:MI'), 20.50);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (7, 7, 16, TO_DATE('18-JAN-2020 11:00', 'DD-MM-YYYY HH24:MI'), 250.50);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (8, 6, 16, TO_DATE('18-JAN-2020 09:00', 'DD-MM-YYYY HH24:MI'), 135.60);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (8, 5, 2, TO_DATE('19-MAR-2020 08:00', 'DD-MM-YYYY HH24:MI'), 300);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (8, 4, 2, TO_DATE('20-MAR-2020 04:00', 'DD-MM-YYYY HH24:MI'), 224.40);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (8, 2, 3, TO_DATE('21-MAR-2020 08:00', 'DD-MM-YYYY HH24:MI'), 230.20);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (9, 3, 3, TO_DATE('22-MAR-2020 07:00', 'DD-MM-YYYY HH24:MI'), 190.52);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (9, 10, 4, TO_DATE('24-MAR-2020 08:00', 'DD-MM-YYYY HH24:MI'), 150.52);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (10, 6, 5, TO_DATE('23-MAR-2020 11:00', 'DD-MM-YYYY HH24:MI'), 170.42);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (11, 7, 5, TO_DATE('25-FEB-2020 12:00', 'DD-MM-YYYY HH24:MI'), 192.20);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (12, 10, 5, TO_DATE('08-FEB-2020 13:00', 'DD-MM-YYYY HH24:MI'), 140.42);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (12, 9, 5, TO_DATE('09-FEB-2020 14:00', 'DD-MM-YYYY HH24:MI'), 160.83);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (13, 8, 6, TO_DATE('10-FEB-2020 15:00', 'DD-MM-YYYY HH24:MI'), 180.52);
INSERT INTO AppOintment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (13, 7, 7, TO_DATE('11-FEB-2020 16:00', 'DD-MM-YYYY HH24:MI'), 50);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (13, 6, 8, TO_DATE('12-FEB-2020 17:00', 'DD-MM-YYYY HH24:MI'), 40.50);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (14, 5, 9, TO_DATE('03-FEB-2020 18:00', 'DD-MM-YYYY HH24:MI'), 42.80);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (14, 4, 2, TO_DATE('04-FEB-2020 19:00', 'DD-MM-YYYY HH24:MI'), 120.42);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (14, 3, 1, TO_DATE('08-FEB-2020 20:00', 'DD-MM-YYYY HH24:MI'), 385.52);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (15, 1, 3, TO_DATE('12-FEB-2020 21:00', 'DD-MM-YYYY HH24:MI'), 210.35);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (15, 1, 3, TO_DATE('14-FEB-2020 22:00', 'DD-MM-YYYY HH24:MI'), 110.52);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (15, 2, 4, TO_DATE('15-MAR-2020 23:00', 'DD-MM-YYYY HH24:MI'), 120);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (15, 9, 5, TO_DATE('27-MAR-2020 10:00', 'DD-MM-YYYY HH24:MI'), 150);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (16, 10, 6, TO_DATE('01-MAR-2020 10:30', 'DD-MM-YYYY HH24:MI'), 50.50);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (16, 8, 7, TO_DATE('07-MAR-2020 10:40', 'DD-MM-YYYY HH24:MI'), 50.20);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (17, 7, 8, TO_DATE('08-MAR-2020 12:50', 'DD-MM-YYYY HH24:MI'), 40);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (17, 7, 9, TO_DATE('25-MAR-2020 13:20', 'DD-MM-YYYY HH24:MI'), 350);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (18, 7, 8, TO_DATE('22-MAR-2020 14:30', 'DD-MM-YYYY HH24:MI'), 300);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (18, 6, 3, TO_DATE('25-MAR-2020 15:50', 'DD-MM-YYYY HH24:MI'), 250);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (19, 5, 1, TO_DATE('28-MAR-2020 12:50', 'DD-MM-YYYY HH24:MI'), 150);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (19, 3, 2, TO_DATE('29-MAR-2020 13:30', 'DD-MM-YYYY HH24:MI'), 50);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (19, 4, 5, TO_DATE('30-MAR-2020 10:10', 'DD-MM-YYYY HH24:MI'), 40.50);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (20, 3, 6, TO_DATE('03-MAR-2020 10:20', 'DD-MM-YYYY HH24:MI'), 50);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (20, 2, 7, TO_DATE('06-APR-2020 21:20', 'DD-MM-YYYY HH24:MI'), 140.52);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (20, 1, 8, TO_DATE('9-APR-2020 14:30', 'DD-MM-YYYY HH24:MI'), 120);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (20, 10, 1, TO_DATE('11-APR-2020 15:50', 'DD-MM-YYYY HH24:MI'), 150);
INSERT INTO Appointment (Patient_Id, Doctor_Id, Diagnosis_Id, Treatment_Date, Price)
VALUES (20, 10, 2, TO_DATE('05-JAN-2020 10:00', 'DD-MM-YYYY HH24:MI'), 200);

/* test
SELECT * FROM Appointment;
*/

------ Appointment Treatment ----------

INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (1, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (1, 6);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (2, 9);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (2, 8);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (2, 7);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (3, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (3, 4);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (3, 3);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (4, 5);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (4, 6);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (5, 6);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (6, 5);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (7, 4);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (8, 3);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (8, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (8, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (9, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (9, 12);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (10, 11);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (11, 10);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (12, 9);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (13, 8);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (13, 7);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (14, 6);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (15, 5);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (15, 4);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (15, 3);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (16, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (16, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (17, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (17, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (17, 3);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (18, 4);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (18, 9);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (18, 10);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (19, 11);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (19, 12);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (20, 12);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (21, 11);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (22, 10);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (22, 9);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (22, 8);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (23, 7);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (23, 6);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (24, 5);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (24, 4);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (25, 3);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (25, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (26, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (27, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (28, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (29, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (30, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (31, 9);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (32, 8);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (33, 7);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (33, 6);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (33, 5);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (33, 4);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (34, 3);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (35, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (35, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (36, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (36, 9);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (36, 8);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (36, 7);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (37, 6);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (38, 5);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (38, 4);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (38, 3);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (39, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (39, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (40, 1);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (40, 2);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (41, 3);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (41, 4);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (42, 5);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (42, 9);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (43, 8);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (44, 8);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (45, 7);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (45, 9);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (46, 9);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (47, 11);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (47, 10);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (47, 12);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (48, 11);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (49, 11);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (49, 10);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (50, 11);
INSERT INTO Appointment_Treatment (Appointment_Id, Treatment_Id)
VALUES (50, 12);

/* test
SELECT * FROM Appointment_Treatment;
*/