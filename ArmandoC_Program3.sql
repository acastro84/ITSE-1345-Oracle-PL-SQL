--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            3
--
--  File Name:            <Program3.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             2/14/2021
--
--  Instructor:           Fred Kumi 
--
--  Chapter:              3
--
--  Description:
--     Stores 4 variables.  2 numbers, 1 string and one timestamp
--     Performs arithmetic with numbers, and concatenates with 
--     string varibles to present to serveroutput.
--
--/**************************************************************/
SET SERVEROUTPUT ON;

DECLARE
   milesPerDay		NUMBER(6) := 40;		
   costPerGallon	NUMBER(6,2) := 2.25;
   avgMPG			NUMBER(6,2) := 30;
   parkingFees		NUMBER(6,2) := 5.00;
   tollsPerDay		NUMBER(6,2) := 1.45;
   dailyDrivingCost		NUMBER(6,2);
   
BEGIN
   dailyDrivingCost := (((costPerGallon * milesPerDay) / avgMPG) + (parkingFees + tollsPerDay));
   
   DBMS_OUTPUT.PUT_LINE('Total miles driven per day: ' || milesPerDay);
   DBMS_OUTPUT.PUT_LINE('Cost of gallon of gasoline: $' || costPerGallon);
   DBMS_OUTPUT.PUT_LINE('Average miles per gallong of gasoline: ' || avgMPG);
   DBMS_OUTPUT.PUT_LINE('Parking fees: $' || parkingFees);
   DBMS_OUTPUT.PUT_LINE('Total tolls for day: $' || tollsPerDay);
   
   DBMS_OUTPUT.PUT_LINE('Daily driving cost: $' || dailyDrivingCost);
   
   END;
   /
