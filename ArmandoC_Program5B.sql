--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            5
--
--  File Name:            <Program5ArmandoCastro.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             3/22/2021
--
--  Instructor:           Fred Kumi
--
--  Chapter:              5 a
--
--  Description:
--     Program creates a schedule for a donor's pledge.  
--   Uses while loop to iterate payment date, total paid and
--     Payment number.
--
--/**************************************************************/

SET SERVEROUTPUT ON

DECLARE

   numberOfPayments NUMBER(2) := 24;
   paymentNumber NUMBER(2) := 0;
   startDate DATE := SYSDATE;
   dueDate DATE := startDate;
   biMonthlyPaymentAmt NUMBER(8,2) := 60;
   currentBalance NUMBER(8,2) := numberOfPayments * biMonthlyPaymentAmt;
   totalPledgeAmt NUMBER(8,2) := 0;
   
   BEGIN
   
   startDate := SYSDATE;
   dueDate := startDate;
   
   
   WHILE numberOfPayments > 0
   
   LOOP
      
      paymentNumber := paymentNumber + 1;
	  dueDate := add_months(dueDate, 1);
	  
	  DBMS_OUTPUT.PUT_LINE('Payment Number: '|| paymentNumber || ' Due Date: ' || dueDate || 
	  ' Paid: ' || biMonthlyPaymentAmt || ' Remaining Balance:' || to_char(currentBalance,'$9999.99'));
	  
	  currentBalance := currentBalance - biMonthlyPaymentAmt;
	  numberOfPayments := numberOfPayments - 1;
   
   END LOOP;
   
   DBMS_OUTPUT.PUT_LINE('The donation goal will be reached by: ' || to_char(dueDate, 'DD-MON-YY'));
   
END;
/
