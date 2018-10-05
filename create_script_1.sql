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
