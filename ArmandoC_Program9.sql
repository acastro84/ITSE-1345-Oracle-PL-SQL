SET SERVEROUTPUT ON

CREATE OR REPLACE Function ForceFunk
	(force_ID IN INT )
	RETURN varchar2 
IS
	in_Stock varchar2(60);
	cursor F1 IS
	SELECT (MOVIE_TITLE || ' is Available: ' || MOVIE_QTY || ' on the shelf') AS in_Stock
	FROM MM_MOVIE
	WHERE MOVIE_ID = force_ID;
	
	thisTitle MM_MOVIE.MOVIE_TITLE;
	
	riseUp EXCEPTION;
	
BEGIN
	open F1;
	fetch F1 into in_Stock;
	
	if F1%NOTFOUND then
		return thisTitle || ' not Available ';
		
	end if;
	
	close F1;
	
RETURN in_Stock;

EXCEPTION
WHEN OTHERS THEN
	raise_application_error(-20001, 'An error was encountered -' || SQLCODE || ' -ERROR- ' || SQLERRM);

END;

SET SERVEROUTPUT ON

DECLARE 
	theForceisWithyou varchar2(90);
	
BEGIN 
	theForceisWithyou := ForceFunk(20);
	DBMS_OUTPUT.PUT_line(theForceisWithyou);
	
END;
/
