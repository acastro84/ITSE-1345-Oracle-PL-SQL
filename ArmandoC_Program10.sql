--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            10
--
--  File Name:            <ArmandoCastro_program10.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             4/22/2021
--
--  Instructor:           Fred Kumi
--
--  Chapter:              7 
--
--  Description:
--  Uses overloaded procedures in a package to search for a record
--  in BB_SHOPPER.  Each procedure uses a Ref cursor to pull data 
--  from the BB_SHOPPER table. Every time I added more to the 
--  select, I also had to add to fetch, and create a %type
--  variable for that column.  This is what you didn't understand
--  before.  Dont forget.  
--
--/**************************************************************/

-- Working, but uses DBMS, do not overwrite!!! Find the "return" way.

CREATE OR REPLACE PACKAGE Program10_PKG AS
	PROCEDURE find_shopper(s_id BB_SHOPPER.IDSHOPPER%TYPE, outcursor OUT SYS_REFCURSOR);
	PROCEDURE find_shopper(s_id BB_SHOPPER.LASTNAME%TYPE,outcursor OUT SYS_REFCURSOR);
END Program10_PKG;
/
CREATE OR REPLACE PACKAGE BODY Program10_PKG AS

	PROCEDURE find_shopper(s_id BB_SHOPPER.IDSHOPPER%TYPE, outcursor OUT SYS_REFCURSOR) IS
	
	
	BEGIN
    open
    outcursor for
		SELECT FIRSTNAME, LASTNAME, CITY, STATE, PHONE, EMAIL
		from BB_SHOPPER
		WHERE IDSHOPPER = s_id;
	
		
	END find_shopper;
	
	PROCEDURE find_shopper(s_id BB_SHOPPER.LASTNAME%TYPE,outcursor OUT SYS_REFCURSOR ) IS
	
	BEGIN
    open outcursor 
    for
		SELECT FIRSTNAME, LASTNAME, CITY, STATE, PHONE, EMAIL
		from BB_SHOPPER
		WHERE LASTNAME = s_id;
	
	
	END find_shopper;
	
	
	
END Program10_PKG;
/
SET SERVEROUTPUT ON
DECLARE	
    shopperCursor SYS_REFCURSOR;
    shopfName  BB_SHOPPER.FIRSTNAME%TYPE;	
    shoplName  BB_SHOPPER.LASTNAME%TYPE;
    shopcity BB_SHOPPER.CITY%TYPE;
	shopState BB_SHOPPER.STATE%TYPE;
	shopPhone BB_SHOPPER.PHONE%TYPE;
	shopEmail BB_SHOPPER.EMAIL%TYPE;
BEGIN
	Program10_PKG.find_shopper('Ratman',shopperCursor);    
    LOOP
    fetch shopperCursor into shopfName,shoplName,shopcity,shopState,shopPhone,shopEmail;
    EXIT when shopperCursor%NOTFOUND;
    dbms_output.put_line('FirstName  LastName	 	  City	 		   State	 	Phone 			        Email');
	dbms_output.put_line( shopfName || '      ' ||shoplName||'      '||shopcity||'			'||shopState||'			'||shopPhone||'			'||shopEmail);
    END LOOP;
    if shopperCursor%Rowcount = 0
    then
    dbms_output.put_line('No matching Records');
    end if;
    CLOSE shopperCursor;    

END;

/


