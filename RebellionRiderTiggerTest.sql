/*-- This table has one column named sh_name
-- datatype of column is varchar2 and data width is 20
-- Print a user defined message every time someone tries to enter a row on this table. 
-- This is mostly to show proper process of triger creation. 
*/
/*Uncomment if you need to recreate table
CREATE TABLE superheroes (
	sh_name VARCHAR2(20)
);
/*Example1*/
SET SERVEROUTPUT ON;  
CREATE OR REPLACE TRIGGER bi_superheroes
BEFORE INSERT ON superheroes
FOR EACH ROW
ENABLE					/*--Detail part of trigger ends here.  Details tell you ABOUT the trigger. Working part starts on next line. */
DECLARE
	v_user VARCHAR2(20);
BEGIN
	SELECT user INTO v_user FROM dual;
	DBMS_OUTPUT.PUT_LINE('You just inserted a line Mr. '||v_user);
END;		/*--End of working part of trigger These lines show exactly what the trigger is doing.  Hence the "working" verbiage.. */ 
/


/*  Now lets check to see if this trigger is working or not.  
to do that we have to insert a row on the table. */
INSERT INTO superheroes VALUES('Ironman');


/*The above blocked worked after i took the comment off of the SET SERVER OUTPUT LINE. Comment the table creation block and hit the solid script green
arrow for recreation.  It is showing 2 deleted rows.  Not sure why.  
  Time for DDL statements.  We are copying the trigger from lines 12-21 below and changing some keywords and outputs. */

CREATE OR REPLACE TRIGGER bu_superheroes
BEFORE UPDATE ON superheroes
FOR EACH ROW
ENABLE					/*--Detail part of trigger ends here.  Details tell you ABOUT the trigger. Working part starts on next line. */
DECLARE
	v_user VARCHAR2(20);
BEGIN
	SELECT user INTO v_user FROM dual;
	DBMS_OUTPUT.PUT_LINE('You just updated a line Mr. '||v_user);
END;		/*--End of working part of trigger These lines show exactly what the trigger is doing.  Hence the "working" verbiage.. */ 
/

/* and here is the update statement to test the trigger.  Again.  comment out the table creation. */
UPDATE superheroes SET sh_name = 'Superman' WHERE sh_name = 'Ironman';

/* Now he gets into the DML statments.  Data manipulation statements.  This smart mofo shows us how to do all three DML statements at once. 
*/

CREATE OR REPLACE TRIGGER tr_superheroes
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
	v_user VARCHAR2(20);
BEGIN
	SELECT user INTO v_user FROM dual;
	IF INSERTING THEN
		DBMS_OUTPUT.PUT_LINE ('One Row Inserted By ' ||v_user);
	ELSIF DELETING THEN
		DBMS_OUTPUT.PUT_LINE ('One Row Deleted By' ||v_user);
	ELSIF UPDATING THEN
		DBMS_OUTPUT.PUT_LINE ('One Row Updated by '||v_user);
	END IF;
END;
/

/*Ok so He mentions predefined predicates. He states they can be used as a valid condition. 
INSERTING, DELETING and UPDATING are all predicates for DML events.  They will evaluate to true
when their respective DLM events occur. 
*/


/*Now to test these DML triggers.  We gotta insert, delete and update.  */
INSERT INTO superheroes VALUES ('Batman');
UPDATE superheroes SET sh_name ='Superman' WHERE sh_name ='Batman';
DELETE FROM superheroes WHERE sh_name = 'Superman';


/* and here is the output from sql developer:

Table SUPERHEROES created.


Trigger BI_SUPERHEROES compiled

You just inserted a line Mr. SYSTEM


1 row inserted.


Trigger BU_SUPERHEROES compiled

You just updated a line Mr. SYSTEM


1 row updated.


Trigger TR_SUPERHEROES compiled

One Row Inserted By SYSTEM
You just inserted a line Mr. SYSTEM


1 row inserted.

One Row Updated by SYSTEM
You just updated a line Mr. SYSTEM


1 row updated.

One Row Deleted BySYSTEM
One Row Deleted BySYSTEM


2 rows deleted.

*/
