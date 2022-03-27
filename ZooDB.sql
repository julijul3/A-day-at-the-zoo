# A day at the zoo

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
    
CREATE TABLE enclosure
	(enclosure_ID	int,
	 zoo_ID			int,
	 enclosure_type	VARCHAR(10),
	 size			double(7,2),
	 PRIMARY KEY(enclosure_ID),
     FOREIGN KEY(zoo_ID) REFERENCES zoo(zoo_ID)
	);
    
CREATE TABLE employee
	(employee_ID	int,
	 zoo_ID			int,
     employee_name	VARCHAR(8),
	 employee_role			VARCHAR(10),
	 PRIMARY KEY(employee_ID),
     FOREIGN KEY(zoo_ID) REFERENCES zoo(zoo_ID)
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
    
CREATE TABLE time_slot
	(time_slot_ID	VARCHAR(2),
	 week_day		VARCHAR(7),
	 start_time		time,
     end_time		time,
	 PRIMARY KEY(time_slot_ID)
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