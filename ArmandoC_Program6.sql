--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            6
--
--  File Name:            <ArmandoCastro_program6.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             3/22/2021
--
--  Instructor:           Fred Kumi
--
--  Chapter:              6
--
--  Description:
--     Program creates a schedule for a donor's pledge.  
--   Uses for loop to iterate payment date, total paid and
--     Payment number.
--
--/**************************************************************/

SET SERVEROUTPUT ON

DECLARE
PLEDGERTYPE            DD_PLEDGE%ROWTYPE;
TOTPAIDPLEDGE    DD_PLEDGE.PLEDGEAMT%TYPE;
curBalance            DD_PLEDGE.PLEDGEAMT%TYPE;
totMonthsPaid NUMBER(5);

BEGIN
SELECT *
INTO PLEDGERTYPE
FROM DD_PLEDGE
WHERE IDPLEDGE =& PLEDGE_ID;

totMonthsPaid := PLEDGERTYPE.PAYMONTHS;

IF PLEDGERTYPE.PAYMONTHS = 0 THEN
TOTPAIDPLEDGE := PLEDGERTYPE.PLEDGEAMT;
ELSE TOTPAIDPLEDGE := totMonthsPaid * (PLEDGERTYPE.PLEDGEAMT/PLEDGERTYPE.PAYMONTHS);
END IF;

curBalance := PLEDGERTYPE.PLEDGEAMT - TOTPAIDPLEDGE;

DBMS_OUTPUT.PUT_LINE('Pledge ID: ' || PLEDGERTYPE.IDPLEDGE || ', Donor ID: ' || PLEDGERTYPE.IDDONOR ||
', Pledge Amount: ' || TOTPAIDPLEDGE || ' ' || ', Remaining Balance: ' || curBalance);

END;

/

