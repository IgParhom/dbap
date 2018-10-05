CREATE SEQUENCE idsCycle MINVALUE 1 NO MAXVALUE NO CYCLE;
CREATE TABLE cycle (
    idCycle INTEGER PRIMARY KEY DEFAULT nextval('idsCycle'),
    nCycle VARCHAR UNIQUE NOT NULL
);

CREATE SEQUENCE idsDisc MINVALUE 1 NO MAXVALUE NO CYCLE;
CREATE TABLE discipline (
    idDisc INTEGER PRIMARY KEY DEFAULT nextval('idsDisc'),
    nDisc VARCHAR UNIQUE NOT NULL,
    idCycle INTEGER,
    FOREIGN KEY(idCycle) REFERENCES cycle(idCycle) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE SEQUENCE idsBook MINVALUE 1 NO MAXVALUE NO CYCLE;
CREATE TABLE book (
    idBook INTEGER PRIMARY KEY DEFAULT nextval('idsBook'),
    nBook VARCHAR NOT NULL,
    author VARCHAR NOT NULL,
    publPlace VARCHAR NOT NULL,
    year INTEGER NOT NULL
);

CREATE SEQUENCE idsSpec MINVALUE 1 NO MAXVALUE NO CYCLE;
CREATE TABLE special (
    idSpec INTEGER PRIMARY KEY DEFAULT nextval('idsSpec'),
    nSpec VARCHAR UNIQUE NOT NULL
);

CREATE TABLE bookAmount (
    idSpec INTEGER NOT NULL,
    idBook INTEGER NOT NULL,
    Amount INTEGER NOT NULL DEFAULT '1',
    UNIQUE(idSpec, idBook),
    FOREIGN KEY(idSpec) REFERENCES special(idSpec) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idBook) REFERENCES book(idBook) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE library (
    idSpec INTEGER NOT NULL,
    idDisc INTEGER NOT NULL,
    idBook INTEGER NOT NULL,
    UNIQUE(idSpec, idDisc, idBook),
    FOREIGN KEY(idSpec) REFERENCES special(idSpec) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idDisc) REFERENCES discipline(idDisc) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idBook) REFERENCES book(idBook) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE discInCycle (
    idDisc INTEGER PRIMARY KEY,
    idCycle INTEGER NOT NULL,
    isSet BOOLEAN NOT NULL,
    FOREIGN KEY(idDisc) REFERENCES discipline(idDisc) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idCycle) REFERENCES cycle(idCycle) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO cycle (nCycle) VALUES ('Гуманитарные и социально экономические дисциплины');
INSERT INTO cycle (nCycle) VALUES ('Математические и общие естественнонаучные дисциплины');

INSERT INTO discipline (nDisc,idCycle) VALUES ('История России',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Философия',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Социология и политология',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Культурология',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Иностранный язык',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Экономическая теория',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Высшая математика',2);

INSERT INTO book (nBook,author,publPlace,year) VALUES ('История России','Бакаев Ю.И.','Москва',1993);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('История России 1917-1995','Геллер М.','Москва',1996);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('История России','Горинов М.М.','Москва',1994);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Мир философии. Хрестоматия','-','Москва',1991);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Введение в философию','-','Москва',1989);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Философия','Коган Л.И.','-',1990);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Социология','Збровский Г.Е.','Москва',1995);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Введение в социологию','Кравченко А.И.','Москва',1991);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Социология курс лекций','Радугин А.А.','Москва',1996);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Игры, в которые играют люди','Берн Э.','Москва',1996);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Логика смысла','Далеез Ж.','Москва',1995);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Культурология 20 века','-','Москва',1995);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Английский язык. Интенсивный курс','Игнатова Т.Н.','Москва',1992);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Человек - компьютер - будущее','Кутыкова А.С.','Москва',1987);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Экономика','Филлер С.','Москва',1993);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Макроэкономика','Менкью Г.','Москва',1996);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Организация предпринимательской деятельности','Бакаев А.С.','Хабаровск',1993);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Курс высшей математики','Матуров О.В.','Москва',1986);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Курс теории вероятностей','Чистяков В.П.','Москва',1987);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Элементы линейной алгебры и аналитической геометрии','Бугров Я.С.','Москва',1983);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Уравнения математической физики','Бицадзе А.В.','Москва',1988);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Уравнения с частными производными для работников и инженеров','Фарлоу С.','Москва',1989);

INSERT INTO special (nSpec) VALUES ('Программная инженерия');
INSERT INTO special (nSpec) VALUES ('Физика');

INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,1,3);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,2,14);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,3,2);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,4,15);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,5,7);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,6,4);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,7,2);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,8,10);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,9,15);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,10,2);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,11,6);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,12,3);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,13,38);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,14,34);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,15,13);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,16,4);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,17,23);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,18,15);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,19,10);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,20,24);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,21,2);
INSERT INTO bookAmount (idSpec,idBook,Amount) VALUES (1,22,2);

INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,1,1);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,1,2);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,1,3);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,2,4);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,2,5);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,2,6);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,3,7);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,3,8);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,3,9);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,4,10);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,4,11);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,4,12);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,5,13);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,5,14);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,6,15);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,6,16);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,6,17);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,7,18);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,7,19);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,7,20);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,7,21);
INSERT INTO library (idSpec,idDisc,idBook) VALUES (1,7,22);

INSERT INTO discInCycle (idDisc,idCycle,isSet) VALUES (1,1,TRUE);
INSERT INTO discInCycle (idDisc,idCycle,isSet) VALUES (2,1,TRUE);
INSERT INTO discInCycle (idDisc,idCycle,isSet) VALUES (3,1,TRUE);
INSERT INTO discInCycle (idDisc,idCycle,isSet) VALUES (4,1,TRUE);
INSERT INTO discInCycle (idDisc,idCycle,isSet) VALUES (5,1,TRUE);
INSERT INTO discInCycle (idDisc,idCycle,isSet) VALUES (6,1,TRUE);
INSERT INTO discInCycle (idDisc,idCycle,isSet) VALUES (7,2,TRUE);
