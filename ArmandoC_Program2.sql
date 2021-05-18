--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            2
--
--  File Name:            <Program2.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             2/9/2021
--
--  Instructor:           Fred Kumi 
--
--  Chapter:              ?
--
--  Description:
--     Stores 4 variables.  2 numbers, 1 string and one timestamp
--     Performs arithmetic with numbers, and concatenates with 
--     string varibles to present to serveroutput.
--
--/**************************************************************/
SET SERVEROUTPUT ON;

DECLARE


	numOne NUMBER(2);

	numTwo NUMBER(2);

	fullName VARCHAR(25);
	
	todays_Date TIMESTAMP;
	
BEGIN
	
	
	numOne := 10;
	numTwo := 20;
	fullName := 'Armando Castro';
	
	
	DBMS_OUTPUT.PUT_LINE('Variable 1 * Variable2 = ' || (numOne*numTwo));
	DBMS_OUTPUT.PUT_LINE('Variable 1 / Variable2 = ' || (numOne/numTwo));
	DBMS_OUTPUT.PUT_LINE('Variable 1 + Variable2 = ' || (numOne+numTwo));
	DBMS_OUTPUT.PUT_LINE('Variable 1 - Variable2 = ' || (numOne-numTwo));
	
	DBMS_OUTPUT.PUT_LINE('The current date and time is: ' || todays_Date);
	DBMS_OUTPUT.PUT_LINE('My full name is: ' || fullName);
	
	
END;
/
