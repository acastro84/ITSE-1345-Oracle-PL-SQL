CREATE TABLE Marvelettes
( hero_powerlvl number(10),
  hero_name varchar2(50), 
  hero_chipID number(10) NOT NULL
 );


/

INSERT INTO Marvelettes
VALUES (99, 'Marvel', 1);


INSERT INTO Marvelettes
VALUES (80, 'Logan', 2);


INSERT INTO Marvelettes
VALUES (90, 'Xavier', 3);


INSERT INTO Marvelettes
VALUES (60, 'Mystique', 4);

INSERT INTO Marvelettes
VALUES (70, 'Nightcrawler', 5);

INSERT INTO Marvelettes
VALUES (30, 'Cyclops', 6);


INSERT INTO Marvelettes
VALUES (99, 'Jean', 7);

COMMIT
/

SET SERVEROUTPUT ON

DECLARE
   heroName VARCHAR2(15) := 'Magneto';
   powerLvl NUMBER(3) := 99;
   herochipID NUMBER(3) := 8;
BEGIN
   INSERT INTO Marvelettes (hero_name, hero_powerlvl, hero_chipid)
          VALUES (Marvelettes_seq.NEXTVAL,heroName,powerLvl, herochipID);
   COMMIT;
END;
/


SELECT hero_name, hero_powerlvl, hero_chipid
  FROM Marvelettes
  WHERE hero_chipid = 8;


DECLARE
   lv_id_num NUMBER(3) := 30;
BEGIN
   DELETE FROM Marvelettes
       WHERE hero_chipid = lv_id_num;
   COMMIT;
END;
/
