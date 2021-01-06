USE wypozyczalnia_samochodow;
CREATE TABLE samochody (
id_samochodu int PRIMARY KEY NOT NULL AUTO_INCREMENT,
marka varchar(20) NOT NULL,
model varchar(30) NOT NULL,
rocznik varchar(4) NOT NULL,
moc varchar(4) NOT NULL,
kolor varchar(15) NOT NULL);

INSERT INTO samochody VALUES (null, "Mercedes","AMG C63S","2019","510","czarny"),
(null, "Mercedes","AMG A45S","2020","421","żółty"),
(null, "BMW","M4","2018","450","biały"),
(null, "Porshe","911 Turbo S","2020","650","niebieski"),
(null, "Nissan","GTR","2019","570","czerwony"),
(null, "BMW","M2","2020","400","niebieski"),
(null, "BMW","M5","2021","600","zielony"),
(null, "Audi","RS4","2017","450","czerwony"),
(null, "Audi","RS5","2015","450","czarny"),
(null, "Porshe","Panamera","2020","330","biały"),
(null, "Porshe","Tycan","2020","680","biały");

CREATE TABLE klienci (
id_klienta int PRIMARY KEY NOT NULL AUTO_INCREMENT,
imię varchar(20) NOT NULL,
nazwisko varchar(30) NOT NULL,
adres varchar(30) NOT NULL,
pesel varchar(11) NOT NULL);

INSERT INTO klienci VALUES (null, "Jan","Kowalski","Janowicza 1","07533627262"),
(null, "Kacper","Worek","Dworcowa 7","82541064495"),
(null, "Kuba","Wiewior","Halera 99","01553328364"),
(null, "Marcel","Lech","Barcza 3","62438452439"),
(null, "Oskar","Czaja","Lesna 6","00523478552"),
(null, "Sylwia","Noc","Ignacego 65","62432352439"),
(null, "Barbara","Guzik","Limanowskiego 54","61761845243"),
(null, "Patrycja","Pasek","Tuwima 7","67928452439"),
(null, "Paweł","Kredka","Synów 34","09528452439"),
(null, "Lukasz","Myszka","Pozorty 72","87428452439"),
(null, "Marcel","Pieta","Pukszty 11","62574332439");

CREATE TABLE pracownicy (
id_pracownika int PRIMARY KEY NOT NULL AUTO_INCREMENT,
imię varchar(20) NOT NULL,
nazwisko varchar(30) NOT NULL,
pesel varchar(11) NOT NULL,
zarobki varchar(4) NOT NULL);

INSERT INTO pracownicy VALUES (null, "Adrzej","Dobry","075336272625","5000"),
(null, "Michal","Pogodny","82547544495","3500"),
(null, "Alan","Zly","82547544495","6000"),
(null, "Marek","Cznny","82547544495","4200"),
(null, "Kuba","Trabant","82547544495","1300");

CREATE TABLE cennik (
cena_doba varchar(4) NOT NULL PRIMARY KEY,
id_samochodu int,
FOREIGN KEY (id_samochodu) REFERENCES samochody(id_samochodu));
INSERT INTO cennik VALUES("2400",5),
("3600",4),
("1200",3),
("1500",1),
("880",2),
("1000",6),
("1900",7),
("1500",8),
("2000",9),
("3000",10),
("4000",11);

CREATE TABLE wypozyczenia (
id_wypozyczenia int PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_klienta int,
id_samochodu int,
id_pracownika int,
data_wyp DATE,
ile_dob varchar(2),
cena_doba varchar(4),
FOREIGN KEY (id_samochodu) REFERENCES samochody(id_samochodu),
FOREIGN KEY (id_klienta) REFERENCES klienci(id_klienta),
FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika),
FOREIGN KEY (cena_doba) REFERENCES cennik(cena_doba)
);
INSERT INTO wypozyczenia VALUES (null,1,5,1,'2020-12-15',"5","2400"),
(null,3,4,2,'2020-11-26',"8","3600"),
(null,5,2,1,'2020-12-30',"5","880"),
(null,4,3,2,'2020-12-11',"3","1200"),
(null,2,5,1,'2020-11-10',"1","2400"),
(null,11,1,2,'2020-12-16',"10","1500"),
(null,9,6,2,'2020-10-17',"8","1000"),
(null,5,7,2,'2020-11-15',"5","1900"),
(null,7,9,2,'2020-09-30',"16","2000"),
(null,8,11,2,'2020-01-11',"12","4000"),
(null,9,10,2,'2020-06-19',"14","3000");







