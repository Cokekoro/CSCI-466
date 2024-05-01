
DROP TABLE Contributor;
DROP TABLE Queues;
DROP TABLE Contributes;
DROP TABLE Requester;
DROP TABLE DJ;
DROP TABLE Song;
CREATE TABLE Requester(
    RID CHAR(9),
    RNAME CHAR(25),
    PRIMARY KEY (RID)
);

CREATE TABLE DJ(
    DID CHAR(9),
    DNAME CHAR(25),
    PRIMARY KEY (DID)
);

CREATE TABLE Song(
    S_ID VARCHAR(10),
    SNAME CHAR(25),
    VERNUM INT,
    PRIMARY KEY (S_ID)
);

CREATE TABLE Contributor(
    CID CHAR(9),
    CNAME CHAR(25),
    PRIMARY KEY (CID)
);

CREATE TABLE Queues(
    RID CHAR(9),
    DID CHAR(9),
    S_ID VARCHAR(10),
    PRIO INT,
    PRIMARY KEY (RID,DID,S_ID),
    FOREIGN KEY (RID) REFERENCES Requester(RID),
    FOREIGN KEY (DID) REFERENCES DJ(DID),
    FOREIGN KEY (S_ID) REFERENCES Song(S_ID)
);

CREATE TABLE Contributes(
    SID VARCHAR(10),
    CID CHAR(9),
    PRIMARY KEY(SID, CID),
    Contirbution CHAR(50)
);