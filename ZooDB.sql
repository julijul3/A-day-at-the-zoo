# A day at the zoo

DROP DATABASE IF EXISTS ZooDB;
CREATE DATABASE ZooDB;

USE ZooDB;

#drop tables
DROP TABLE IF EXISTS zoo;
DROP TABLE IF EXISTS specie;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS enclosure;
DROP TABLE IF EXISTS shows;
DROP TABLE IF EXISTS time_slot;
DROP TABLE IF EXISTS organiser;
DROP TABLE IF EXISTS caretaker;

CREATE TABLE zoo
	(zoo_ID			int NOT NULL,
	 zoo_name		VARCHAR(15),
	 country		VARCHAR(15),
     animal_count	int,
	 PRIMARY KEY(zoo_ID)
	);
    
CREATE TABLE enclosure
	(enclosure_ID	int,
    enclosure_type	VARCHAR(10),
    enclosure_size			double(7,2),  #from size to enclosure_size and changed order of atributes, so that it sync with excel sheet as i made commandes in excel to ovid any typo, 
    zoo_ID			int,
	 PRIMARY KEY(enclosure_ID),
     FOREIGN KEY(zoo_ID) REFERENCES zoo(zoo_ID)
	);
    
CREATE TABLE specie
	(specie_name	VARCHAR(15),
	 enclosure_ID	int,
	 PRIMARY KEY(specie_name),
     FOREIGN KEY(enclosure_ID) REFERENCES enclosure(enclosure_ID)
	);

CREATE TABLE animal
	(animal_ID		int,
	 zoo_ID			int,
	 specie_name	VARCHAR(15),
     stay_type		VARCHAR(10),
	 PRIMARY KEY(animal_ID),
     FOREIGN KEY(zoo_ID) REFERENCES zoo(zoo_ID),
     FOREIGN KEY(specie_name) REFERENCES specie(specie_name)
	);
    
CREATE TABLE employee
	(employee_ID	int,
	 zoo_ID			int,
     employee_name	VARCHAR(15),  
	 employee_role			VARCHAR(15),
	 PRIMARY KEY(employee_ID),
     FOREIGN KEY(zoo_ID) REFERENCES zoo(zoo_ID)
	);
    
CREATE TABLE time_slot
	(time_slot_ID	VARCHAR(2),
	 week_day		VARCHAR(10),
	 start_time		time,
     end_time		time,
	 PRIMARY KEY(time_slot_ID)
	);
    
CREATE TABLE shows
	(show_ID		int,
	 animal_ID		int,
	 zoo_ID			int,
     time_slot_ID	VARCHAR(2),
	 PRIMARY KEY(show_ID),
     FOREIGN KEY(animal_ID) REFERENCES animal(animal_ID),
     FOREIGN KEY(zoo_ID) REFERENCES zoo(zoo_ID),
     FOREIGN KEY(time_slot_ID) REFERENCES time_slot(time_slot_ID)
	);
    
    
CREATE TABLE organizer
	(employee_ID	int,
	 show_ID		int,
	 PRIMARY KEY(employee_ID, show_ID),
     FOREIGN KEY(employee_ID) REFERENCES employee(employee_ID),
     FOREIGN KEY(show_ID) REFERENCES shows(show_ID)
	);
    
CREATE TABLE caretaker
	(employee_ID	int,
	 enclosure_ID	int,
	 PRIMARY KEY(employee_ID, enclosure_ID),
     FOREIGN KEY(employee_ID) REFERENCES employee(employee_ID),
     FOREIGN KEY(enclosure_ID) REFERENCES enclosure(enclosure_ID)
	);
    
CREATE VIEW Animals_IDs AS 
SELECT animal_ID
FROM animal;

# insert in zoo # DONE
INSERT zoo VALUES(1,'Copenhagen zoo','Denmark',7);
INSERT zoo VALUES(3,'Geneva zoo','Switzerland',2);

#insert inclosure # Done
INSERT enclosure VALUES(3,'savanna','200',1);
INSERT enclosure VALUES(9,'savanna','150',1);
INSERT enclosure VALUES(12,'ice','50',1);
INSERT enclosure VALUES(21,'savanna','150',3);
INSERT enclosure VALUES(22,'aquarium','300',3);

#insert specie 
INSERT specie VALUES('Lion',12);
INSERT specie VALUES('Giraffe',3);
INSERT specie VALUES('Elephant',3);
INSERT specie VALUES('Pinguin',9);
INSERT specie VALUES('Camel',21);
INSERT specie VALUES('Dolphin',22);

#insert animal 
INSERT animal VALUES(11,1,'Lion','permanent');
INSERT animal VALUES(12,1,'Lion','temporary');
INSERT animal VALUES(21,1,'Camel','permanent');
INSERT animal VALUES(22,1,'Giraffe','permanent');
INSERT animal VALUES(31,1,'Elephant','temporary');
INSERT animal VALUES(41,1,'Pinguin','permanent');
INSERT animal VALUES(42,1,'Pinguin','permanent');
INSERT animal VALUES(23,3,'Giraffe','temporary');
INSERT animal VALUES(51,3,'Dolphin','permanent');

#insert employee 
INSERT employee VALUES(33,1,'john','manager');
INSERT employee VALUES(69,1,'Olivia','caretaker');
INSERT employee VALUES(28,1,'Sam','organiser');
INSERT employee VALUES(42,3,'Josephine','caretaker');
INSERT employee VALUES(56,3,'Paul','organiser');

#insert time_slot 
INSERT time_slot VALUES('2A','saturday','14:00','15:00');
INSERT time_slot VALUES('5B','wednesday','15:30','16:00');

#insert shows 
INSERT shows VALUES(1,21,1,'2A');
INSERT shows VALUES(3,42,1,'5B');
INSERT shows VALUES(5,51,3,'2A');


#insert organizer 
INSERT organizer VALUES(28,1);
INSERT organizer VALUES(28,3);
INSERT organizer VALUES(56,5);

#insert caretaker
INSERT caretaker VALUES(69,3);
INSERT caretaker VALUES(69,9);
INSERT caretaker VALUES(69,12);
INSERT caretaker VALUES(42,21);
INSERT caretaker VALUES(42,22);




























