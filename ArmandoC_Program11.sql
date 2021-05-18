/*ALTER TABLE BB_SALES_SUM
DROP CONSTRAINT sum_pk;

DROP TABLE BB_SALES_SUM;

CREATE TABLE BB_SALES_SUM
	AS (select idproduct, price, quantity from BB_BASKETITEM);*/
/*		
ALTER TABLE BB_SALES_SUM
ADD CONSTRAINT sum_pk
PRIMARY KEY (idproduct);
*/
/

CREATE OR REPLACE TRIGGER product_inventory_trg
	AFTER UPDATE OF orderplaced ON bb_basket
	FOR EACH ROW
	WHEN (OLD.orderplaced <> 2 AND NEW.orderplaced = 2)
DECLARE
	CURSOR basketitem_cur IS
	SELECT idproduct, quantity, price
		FROM bb_basketitem
		WHERE idbasket = :NEW.idbasket;
		lv_chg_num NUMBER(3,1);
BEGIN
	FOR basketitem_rec IN basketitem_cur LOOP
	lv_chg_num := basketitem_rec.price;
	UPDATE BB_SALES_SUM
	SET price = price * quantity
		WHERE idproduct = basketitem_rec.idproduct;
	END LOOP;
END;

/

update bb_basket
	SET orderplaced = 2
	WHERE idbasket =15;
commit;

/*
Test trigger
*/


/

update bb_basket
	SET orderplaced = 2
	WHERE idbasket =14;
commit;

update bb_basket
	SET orderplaced = 2
	WHERE idbasket =15;
commit;

update bb_basket
	SET orderplaced = 2
	WHERE idbasket =16;
commit;

/
