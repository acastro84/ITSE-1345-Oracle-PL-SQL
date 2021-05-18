--/***************************************************************/
--  Developer:            Armando Castro
--
--  Program #:            12
--
--  File Name:            <ArmandoCastroProgram12.sql>
--
--  Course:               ITSE 1345 Introduction to Oracle SQL and PL/SQL
--
--  Due Date:             5.7.2021
--
--  Instructor:           Fred Kumi
--
--  Chapter:              10
--
--  Description:  Using native dynamic SQL, create a
--  procedure name SEARCH_SP that returns a product name, description, and price based
--  on users’ search criteria. The procedure needs to handle multiple rows being returned.
--  
--
--  **This solution asks you for both search variables on every search.  I could not figure out
--	how to get it to just ask for the selected variable only AND differentiate the 
--  procedures for overiding at the same time. It meets all criteria, but repeats a user input step.**
--
--/**************************************************************/

create or replace package search as
 Procedure SEARCH_SP1(product  BB_PRODUCT.PRODUCTNAME%TYPE, outcursor OUT SYS_REFCURSOR);
  Procedure SEARCH_SP2(descrp  BB_PRODUCT.DESCRIPTION%TYPE, outcursor OUT SYS_REFCURSOR);
END search;
/

CREATE or replace PACKAGE BODY search as
    procedure SEARCH_SP1(product  BB_PRODUCT.PRODUCTNAME%TYPE, outcursor OUT SYS_REFCURSOR )
    IS
       
     
       stmt varchar(255);
  BEGIN
    stmt:= 'SELECT productname, description, price FROM bb_product     WHERE productname =  :1';
    open outcursor 
    for stmt
     using  product ;
       
     
       
    end;
    
    procedure SEARCH_SP2 (descrp  BB_PRODUCT.DESCRIPTION%TYPE, outcursor OUT SYS_REFCURSOR )
    IS
       
     
       stmt varchar(255);
  BEGIN
    stmt:= 'SELECT productname, description, price FROM bb_product     WHERE description =  :1';
    open outcursor 
    for stmt
     using  descrp ;
       
     
       
    end;
    
  end;
  
 / 
  
SET SERVEROUTPUT ON
accept X number prompt 'please enter 1 for productname search and 2 for description search'
DECLARE	
    prodCursor SYS_REFCURSOR;
    prd  BB_PRODUCT.PRODUCTNAME%TYPE;
    prdname  BB_PRODUCT.PRODUCTNAME%TYPE;
    prdDesc BB_PRODUCT.DESCRIPTION%TYPE;
    descp BB_PRODUCT.DESCRIPTION%TYPE;
    prPrice BB_PRODUCT.PRICE%TYPE;
    X number;
 begin
   X := '&X';
   if (X=1)
   then
  
   prdname := '&prodname';
   search.SEARCH_SP1(prdname, prodCursor); 
   else
    
     prdDesc := '&prdDesc';
   search.SEARCH_SP2(prdDesc, prodCursor); 
    end if;
   LOOP
       Fetch prodCursor into prd, descp, prPrice;
       EXIT when prodCursor% NOTFOUND;
       DBMS_OUTPUT.PUT_LINE(prd||' '||descp||' '||prPrice);
       end loop;

end;
/


