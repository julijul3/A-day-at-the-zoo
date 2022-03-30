# part 7

# All employees (ordered by ids)
SELECT employee.employee_ID, employee.employee_name
FROM employee
ORDER BY employee_ID; 

# Find the smallest enclosure type in Copenhagen Zoo
SELECT enclosure_type as smallest_enclosure 
FROM enclosure
NATURAL JOIN Zoo
WHERE zoo_name = 'Copenhagen zoo' AND enclosure_size = (SELECT MIN(enclosure_size) FROM enclosure);#

# Find the name and average enclosure size for caretakers who are resposible for more than 2 enclosure types
SELECT employee_name, AVG(enclosure_size) 
FROM Employee
NATURAL JOIN Enclosure
WHERE employee_role = 'caretaker' 
GROUP BY employee_name
HAVING COUNT(zoo_id) > 2;

# part 8

# Update timeslot 2A to a start time = 13:00:00 and an end time = 14:00:00
UPDATE time_slot 
SET start_time = '13:00', end_time = '14:00'
WHERE time_slot_ID = '2A';

# part 9

# function that returns the number of caretakers for one enclosure
DROP FUNCTION IF EXISTS numberCaretaker;
DELIMITER //
CREATE FUNCTION numberCaretaker(vEnclosureId int) RETURNS int
BEGIN
	DECLARE vCaretakerCount int;
    SELECT COUNT(*) INTO vCaretakerCount FROM caretaker
    WHERE vEnclosureId = enclosure_ID;
    RETURN vCaretakerCount;
END; //
DELIMITER ;

SELECT numberCaretaker(21);

# create procedure to add a new show

DROP PROCEDURE IF EXISTS addShow;
DELIMITER //
Create Procedure addShow 
(IN vshow_ID int, IN vanimal_ID int, IN vzoo_Id int, IN vtimeslotID VARCHAR(2), vorganizer_ID int)
BEGIN
	INSERT shows(show_ID, animal_ID, zoo_ID, time_slot_ID) 
    VALUES (vshow_ID, vanimal_ID, vzoo_Id, vtimeslotID);
    INSERT organizer(employee_ID, show_ID)
    VALUES(vorganizer_ID, vshow_ID);
END//
DELIMITER ;

CALL addShow(4, 21, 1, "2A", 28);



