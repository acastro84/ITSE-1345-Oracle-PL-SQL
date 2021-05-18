SET SERVEROUTPUT ON

--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            7
--
--  File Name:            <ArmandoCastro_program6.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             3/29/2021
--
--  Instructor:           Fred Kumi
--
--  Chapter:              7
--
--  Description:
--  Adds an extra Column to MM_MOVIE called STK_FLAG. 
--
--/**************************************************************/
DECLARE
	CURSOR exCURSOR IS
	SELECT MOVIE_TITLE, MOVIE_VALUE, MOVIE_QTY, STK_FLAG FROM MM_MOVIE
	WHERE MOVIE_QTY * MOVIE_VALUE >= 75
	FOR UPDATE;
BEGIN
	FOR MM_MOVIE_rec IN exCURSOR
	LOOP
		UPDATE 
			MM_MOVIE
		SET
			STK_FLAG = '*'
		WHERE CURRENT OF exCURSOR;
	
			
	END LOOP;
	COMMIT;
	EXCEPTION
		WHEN ZERO_DIVIDE THEN
			dbms_output.put_line('A problem has occurred.  Tech support will be notified.');
		WHEN OTHERS THEN
			dbms_output.put_line('A problem has occurred.  Tech support will be notified.');
	
END;

/


--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            7
--
--  File Name:            <ArmandoCastro_program6.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             3/29/2021
--
--  Instructor:           Fred Kumi
--
--  Chapter:              7
--
--  Description:
--  Adds an extra Column to MM_MOVIE called STK_FLAG. 
--
--/**************************************************************/

ALTER TABLE
MM_MOVIE
ADD STK_FLAG char(1) default null;
COMMIT;


--dbms_output.put_line('A problem has occurred.  Tech support will be notified.');



