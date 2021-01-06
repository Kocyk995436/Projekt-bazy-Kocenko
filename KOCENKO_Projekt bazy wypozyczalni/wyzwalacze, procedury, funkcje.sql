/*wprowadza aktualną date*/
DELIMITER //
CREATE DEFINER = CURRENT_USER TRIGGER `wypozyczalnia`.`wypozyczenia_BEFORE_INSERT` 
BEFORE INSERT ON `wypozyczenia` 
FOR EACH ROW
BEGIN
SET new.data_wyp = curdate();
END//

/*sprawdza poprawne id*/
DELIMITER //
CREATE DEFINER = CURRENT_USER TRIGGER `wypozyczalnia2`.`pracownicy_BEFORE_INSERT` 
BEFORE INSERT ON pracownicy
FOR EACH ROW
BEGIN
IF(new.id_pracownika_wypozyczenie>5);
END //

/*wyświetla wszystkie auta*/
DELIMITER //
CREATE PROCEDURE `Wszystkie auta` ()
BEGIN
SELECT * FROM samochody;
END //

/*wypozyczenia w danym roku*/
DELIMITER //
CREATE FUNCTION `wypozyczenia_z_danego_roku` (n int)
RETURNS INTEGER
BEGIN
SELECT COUNT(id_wypozyczenia) FROM wypozyczenia WHERE YEAR(data_wyp)=n INTO n; 
RETURN n; 



