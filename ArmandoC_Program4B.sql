--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            4  version B
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
--     Determine customer purchase rating using CASE statement.
--	   Deteremines rating then prints the rating on the screen. 
--
--/**************************************************************/
SET SERVEROUTPUT ON;

DECLARE

   hiRank		NUMBER(6) := 500;		
   mediumRank	NUMBER(6,2) := 350;
   lowRank		NUMBER(6,2) := 250;
   totPurchase  NUMBER(6,2) := 100;
   ranking VARCHAR(25); 


BEGIN
   
   
   CASE 
	  WHEN totPurchase >= hiRank THEN
	     ranking := 'High';
		 dbms_output.put_line('Your ranking is :' || ranking );
	  
	  WHEN totPurchase >= mediumRank AND totPurchase < hiRank THEN
         ranking := 'Medium';
		 dbms_output.put_line('Your ranking is :' || ranking );
		
	  WHEN totPurchase >= lowRank AND totPurchase < mediumRank THEN
	     ranking := 'Low';
		 dbms_output.put_line('Your ranking is :' || ranking );
	    
	  ELSE 
	     dbms_output.put_line('Your purchase did not rank.' );
   
   END CASE;
END;
