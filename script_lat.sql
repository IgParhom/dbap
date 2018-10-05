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

INSERT INTO cycle (nCycle) VALUES ('Humanitarian and social economic disciplines');
INSERT INTO cycle (nCycle) VALUES ('Mathematical and general natural sciences');

INSERT INTO discipline (nDisc,idCycle) VALUES ('Russian history',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Philosophy',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Sociology and Political Science',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Culturology',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Foreign language',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Economic theory',1);
INSERT INTO discipline (nDisc,idCycle) VALUES ('Higher Mathematics',2);

INSERT INTO book (nBook,author,publPlace,year) VALUES ('Russian history','Bakaev Yu.I.','Moscow',1993);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Russian history 1917-1995','Geller M.','Moscow',1996);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Russian history','Gorinov M.M.','Moscow',1994);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('The world of philosophy. Chrestomathy','-','Moscow',1991);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Introduction to Philosophy','-','Moscow',1989);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Philosophy','Kogan L.I.','-',1990);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Sociology','Zbrovsky G.E.','Moscow',1995);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Introduction to Sociology','Kravchenko A.I..','Moscow',1991);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Sociology lecture course','Radugin A.A.','Moscow',1996);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Games People Play','Bern E.','Moscow',1996);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('The logic of meaning','Daleyez J.','Moscow',1995);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Culturology of the 20th century','-','Moscow',1995);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('English. Intensive course','Ignatova T.N.','Moscow',1992);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Man - computer - the future','Kutykova A.S.','Moscow',1987);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Economy','Filler S.','Moscow',1993);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Macroeconomics','Menciu G.','Moscow',1996);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Organization of business activities','Bakaev A.S.','Khabarovsk',1993);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Course of Higher Mathematics','Maturov O.V.','Moscow',1986);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Course of the theory of probability','Chistyakov V.P.','Moscow',1987);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Elements of linear algebra and analytic geometry','Bugrov Ya.S.','Moscow',1983);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Equations of mathematical physics','Bitsadze A.V..','Moscow',1988);
INSERT INTO book (nBook,author,publPlace,year) VALUES ('Partial differential equations for workers and engineers','Farlow S.','Moscow',1989);

INSERT INTO special (nSpec) VALUES ('Software Engineering');
INSERT INTO special (nSpec) VALUES ('Physics');

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
