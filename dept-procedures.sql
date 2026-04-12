-- Create procedure to insert new department
CREATE OR REPLACE PROCEDURE insertDepartment(p_dept_name TEXT, p_dept_loc TEXT)
LANGUAGE plpgsql AS 
$$
BEGIN
	INSERT INTO Department(DepartementName, DeptLocation) VALUES (p_dept_name, p_dept_loc);
END;
$$;

BEGIN;
SAVEPOINT before_insert_dept;
Call insertDepartment('Web Development',    'Cairo');  
Call insertDepartment('Data Engineering',   'Alexandria');  
Call insertDepartment('Cyber Security',     'Giza');  
Call insertDepartment('Mobile Development', 'Tanta');  
Call insertDepartment('Cloud Computing',    'Smart Village');  
SAVEPOINT after_insert_dept;

commit;


-- Create procedure to update department after check if passed department exists
CREATE OR REPLACE PROCEDURE updateDepartment(p_dept_id INT, p_dept_name TEXT, p_dept_loc TEXT)
LANGUAGE plpgsql AS 
$$
BEGIN
		IF NOT EXISTS(SELECT * FROM Department WHERE DepartmentID =  p_dept_id)
			THEN RAISE EXCEPTION 'This department does not exist';
		END IF;
	UPDATE Department SET DepartementName = p_dept_name, DeptLocation = p_dept_loc 
	WHERE DepartmentID =  p_dept_id;
END;
$$;

-- Create procedure to delete department after check if passed department exists
CREATE OR REPLACE PROCEDURE deleteDepartment(p_dept_id INT)
LANGUAGE plpgsql AS 
$$
BEGIN
	IF NOT EXISTS(SELECT * FROM Department WHERE DepartmentID =  p_dept_id)
		THEN RAISE EXCEPTION 'This department does not exist';
	END IF;
	DELETE FROM Department WHERE DepartmentID = p_dept_id;
END;
$$;

-- Create procedure to select from department (select all rows or with condition)
CREATE OR REPLACE PROCEDURE selectDepartment(inout dept_id INT, INOUT p_cursor REFCURSOR)
LANGUAGE plpgsql AS 
$$
BEGIN
	IF dept_id IS NULL THEN
	OPEN p_cursor FOR
		SELECT * FROM Department;
	ELSE
	OPEN p_cursor FOR
    SELECT * FROM Department WHERE DepartmentID = dept_id;
	END IF;
END;
$$;

BEGIN;
CALL selectDepartment(2, 'my_cursor');
FETCH ALL FROM my_cursor;
COMMIT;

