-- Clear Exisiting Tables
DROP TABLE Contributes;
DROP TABLE Contributor;
DROP TABLE Queues;
DROP TABLE Requester;
DROP TABLE DJ;
DROP TABLE Song;
-- Establish Tables
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

CREATE TABLE Song (
    S_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Artist VARCHAR(100),
    Version VARCHAR(50),
    KaraokeFileID VARCHAR(10)
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

CREATE TABLE Contributes (
    S_ID VARCHAR(10),
    CID CHAR(6),
    Contribution VARCHAR(100),
    PRIMARY KEY (S_ID, CID),
    FOREIGN KEY (S_ID) REFERENCES Song(S_ID),
    FOREIGN KEY (CID) REFERENCES Contributor(CID)
);