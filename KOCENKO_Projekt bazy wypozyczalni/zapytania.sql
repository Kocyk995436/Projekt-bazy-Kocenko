USE wypozyczalnia;
/*1.Wszystkie wypożyczenia*/
CREATE VIEW zapytanie1 AS SELECT *
FROM wypozyczenia
INNER JOIN klienci ON wypozyczenia.id_klienta=klienci.id_klienta;

/*2.Jakie jest zużycie aut?*/
CREATE VIEW zapytanie2 AS SELECT *
FROM samochody
RIGHT JOIN wypozyczenia ON wypozyczenia.id_samochodu=samochody.id_samochodu;

/*3.Jaka jest cena dobe auta?*/
CREATE VIEW zapytanie3 AS SELECT *
FROM cennik
LEFT JOIN samochody ON cennik.id_samochodu = samochody.id_samochodu;                      

/*4.Kto nie wypożyczył auta pomiędzy 10-31 grudnia?*/
CREATE VIEW zapytanie4 AS SELECT *
FROM wypozyczenia
WHERE
(data_wyp NOT BETWEEN '2020-12-10'
 AND '2020-12-31');

/*5.Ile dob przejechały auta?*/
CREATE VIEW zapytanie5 AS SELECT SUM(ile_dob) AS laczna_ilosc_dob_aut
FROM wypozyczenia INNER JOIN klienci
ON wypozyczenia.id_klienta = klienci.id_klienta;

/*6.Jaka jest średnia moc danej marki auta?*/
CREATE VIEW zapytanie6 AS SELECT marka, AVG(moc) AS srednia_moc
FROM samochody
GROUP BY marka;

/*7.Ile aut wypozyczył pracownik z inteksem 2?*/
CREATE VIEW zapytanie7 AS SELECT COUNT(*) AS wypozyczyl_pracownik2
FROM wypozyczenia
WHERE id_pracownika LIKE "2";

/*8.Kto ma największe zarobki?*/
CREATE VIEW zapytanie8 AS SELECT *
FROM pracownicy WHERE zarobki = (SELECT MAX(zarobki)FROM pracownicy);

/*9.Które auto jest najstarsze?*/
CREATE VIEW zapytanie9 AS SELECT *
FROM samochody WHERE rocznik = (SELECT MIN(rocznik)FROM samochody);

/*10.ile jest aut o danym kolorze?*/
CREATE VIEW zapytanie10 AS SELECT kolor, Count(id_samochodu) AS Liczba_aut_koloru
FROM samochody
GROUP BY kolor; 



