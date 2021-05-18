SET SERVEROUTPUT ON


--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            8
--
--  File Name:            <ArmandoCastro_program8.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             4.3.2021
--
--  Instructor:           Fred Kumi
--
--  Chapter:              n/a
--
--  Description:
--  Confirms whether a monthly pledge payment is correct or not. 
--  Accepts two values as input, (payment amount and pledge)
--  Confirms that the payment amount matches the assigned payment amount
--  Custom erro message using 20050 is raised if not. To be tested with 
--  Values of:
--
--
--  Pledge ID Payment Amount
--   104 			25
--   104 			20
--   100 			250
--   200 			300
--
--/**************************************************************/

CREATE OR REPLACE PROCEDURE DDCK_SP 
  (P_ID IN NUMBER, 
   P_AMT IN NUMBER)
 IS
  thisMonth DD_PLEDGE.PAYMONTHS%TYPE;
  thisID    DD_PLEDGE.IDPLEDGE%TYPE;
  thisAmount   DD_PLEDGE.PLEDGEAMT%TYPE;
  finalAmt   DD_PLEDGE.PLEDGEAMT%TYPE;
  
  NO_MONTH EXCEPTION;
  
  
BEGIN
	
        SELECT IDPLEDGE , PLEDGEAMT , PAYMONTHS
        INTO   thisID , thisAmount , thisMonth
        FROM DD_PLEDGE
        WHERE IDPLEDGE = P_ID;
        
    IF thisMonth = 0 THEN 
        RAISE NO_MONTH;
    END IF;
    
    
    finalAmt :=  thisAmount / thisMonth;
    
    IF P_AMT = finalAmt THEN
		DBMS_OUTPUT.PUT_LINE('Payment amount matches.');
    ELSIF P_AMT != finalAmt THEN 
        RAISE_APPLICATION_ERROR(-20050 , 'Incorrect payment amount - planned payment = ' || finalAmt || ' should be raised');
    END IF;
	
EXCEPTION
	
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No Payment information.');
	
	WHEN NO_MONTH THEN
		DBMS_OUTPUT.PUT_LINE('No Payment information.');

END DDCK_SP;

/

begin

	DDCK_SP(200,300);


end;
/
