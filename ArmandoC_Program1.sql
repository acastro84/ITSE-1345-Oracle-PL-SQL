--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            <Programming Assignment Number>
--
--  File Name:            ArmandoCastro_Program1.sql
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             02/05/2021
--
--  Instructor:           Fred Kumi 
--
--  Chapter:              <1>
--
--  Description:
--     Declare a variable to store today's date and use the DBMS_OUTPUT.PUT_LINE procedure
--     to display it on the screen.
--
--/**************************************************************/
SET SERVEROUTPUT ON;
DECLARE

    hoy DATE := SYSDATE;
   
   
BEGIN
   
   
   DBMS_OUTPUT.put_line('This is my first PLSQL Block');
   DBMS_OUTPUT.put_line('Today''s date is:' || hoy);
   
END;
/
