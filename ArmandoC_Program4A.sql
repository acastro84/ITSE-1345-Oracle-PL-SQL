--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            4  version A
--
--  File Name:            <Program4ArmandoCastro.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             2/14/2021
--
--  Instructor:           Fred Kumi 
--
--  Chapter:              5
--
--  Description:
--     Determine customer purchase rating using IF statement.
--	   Deteremines rating then prints the rating on the screen. 
--
--/**************************************************************/
SET SERVEROUTPUT ON;

DECLARE

   hiRank		NUMBER(6) := 500;		
   mediumRank	NUMBER(6,2) := 350;
   lowRank		NUMBER(6,2) := 250;
   totPurchase  NUMBER(6,2) := 349;
   ranking VARCHAR(25); 


BEGIN
   IF totPurchase >= 500 THEN
      ranking := 'High';
	  dbms_output.put_line('Your ranking is :' || ranking );
	
   ELSE
      IF (totPurchase >= 350) AND (totPurchase <= 500) THEN
		 ranking := 'Medium';
	     dbms_output.put_line('Your ranking is :' || ranking );
	  ELSE
         ranking := 'Low';
	     dbms_output.put_line('Your ranking is :' || ranking );
	  
	  END IF;
	  
   END IF;
END;
