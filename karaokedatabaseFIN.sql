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
-- Establish Songs
INSERT INTO Song (S_ID, Name, Artist, KaraokeFileID, Version)
VALUES
    ('S001', 'Yesterday', 'The Beatles', 'KFI001', 'Original'),
    ('S002', 'Bohemian Rhapsody', 'Queen', 'KFI002', 'Original'),
    ('S003', 'Stairway to Heaven', 'Led Zeppelin', 'KFI003', 'Original'),
    ('S004', 'Billie Jean', 'Michael Jackson', 'KFI004', 'Original'),
    ('S005', 'Imagine', 'John Lennon', 'KFI005', 'Original'),
    ('S006', 'Like a Rolling Stone', 'Bob Dylan', 'KFI006', 'Original'),
    ('S007', 'Smells Like Teen Spirit', 'Nirvana', 'KFI007', 'Original'),
    ('S008', 'Hey Jude', 'The Beatles', 'KFI008', 'Original'),
    ('S009', 'Hotel California', 'Eagles', 'KFI009', 'Original'),
    ('S010', 'Sweet Child O'' Mine', 'Guns N'' Roses', 'KFI010', 'Original'),
    ('S011', 'Born to Run', 'Bruce Springsteen', 'KFI011', 'Original'),
    ('S012', 'Purple Haze', 'Jimi Hendrix', 'KFI012', 'Original'),
    ('S013', 'Livin'' on a Prayer', 'Bon Jovi', 'KFI013', 'Original'),
    ('S014', 'Let It Be', 'The Beatles', 'KFI014', 'Original'),
    ('S015', 'Wonderwall', 'Oasis', 'KFI015', 'Original'),
    ('S016', 'My Generation', 'The Who', 'KFI016', 'Original'),
    ('S017', 'Smoking in the Boys Room', 'Motley Crue', 'KFI017', 'Original'),
    ('S018', 'Every Breath You Take', 'The Police', 'KFI018', 'Original'),
    ('S019', 'Back in Black', 'AC/DC', 'KFI019', 'Original'),
    ('S020', 'Wish You Were Here', 'Pink Floyd', 'KFI020', 'Original'),
    ('S021', 'Under the Bridge', 'Red Hot Chili Peppers', 'KFI021', 'Original'),
    ('S022', 'Dancing Queen', 'ABBA', 'KFI022', 'Original'),
    ('S023', 'Another Brick in the Wall', 'Pink Floyd', 'KFI023', 'Original'),
    ('S024', 'Hotel California', 'Eagles', 'KFI024', 'Original'),
    ('S025', 'Bohemian Rhapsody', 'Queen', 'KFI025', 'Original'),
    ('S026', 'Smells Like Teen Spirit', 'Nirvana', 'KFI026', 'Original'),
    ('S027', 'Stairway to Heaven', 'Led Zeppelin', 'KFI027', 'Original'),
    ('S028', 'Wonderwall', 'Oasis', 'KFI028', 'Original'),
    ('S029', 'Every Breath You Take', 'The Police', 'KFI029', 'Original'),
    ('S030', 'Hey Jude', 'The Beatles', 'KFI030', 'Original');
-- Establish Contributors
INSERT INTO Contributor (CID, CNAME)
VALUES
    ('C001', 'Paul McCartney'),
    ('C002', 'John Lennon'),
    ('C003', 'George Harrison'),
    ('C004', 'Ringo Starr'),
    ('C005', 'Freddie Mercury'),
    ('C006', 'Brian May'),
    ('C007', 'Roger Taylor'),
    ('C008', 'Robert Plant'),
    ('C009', 'Jimmy Page'),
    ('C010', 'John Paul Jones'),
    ('C011', 'John Deacon'),
    ('C012', 'Robert Smith'),
    ('C013', 'Simon Gallup'),
    ('C014', 'Roger Waters'),
    ('C015', 'David Gilmour'),
    ('C016', 'Syd Barrett'),
    ('C017', 'Roger Waters'),
    ('C018', 'Nick Mason'),
    ('C019', 'David Bowie'),
    ('C020', 'Mick Jagger'),
    ('C021', 'Keith Richards'),
    ('C022', 'Charlie Watts'),
    ('C023', 'Ronnie Wood'),
    ('C024', 'Freddy Mercury'),
    ('C025', 'Roger Taylor'),
    ('C026', 'John Deacon'),
    ('C027', 'Brian May'),
    ('C028', 'Robert Plant'),
    ('C029', 'John Paul Jones'),
    ('C030', 'Jimmy Page');
-- Establish Contributions    
INSERT INTO Contributes (S_ID, CID, Contribution)
VALUES
    ('S001', 'C001', 'Singer, Guitarist, Songwriter'),
    ('S001', 'C002', 'Singer, Guitarist, Songwriter'),
    ('S001', 'C003', 'Singer, Guitarist, Songwriter'),
    ('S001', 'C004', 'Singer, Guitarist, Songwriter'),
    ('S002', 'C005', 'Singer, Guitarist'),
    ('S002', 'C006', 'Guitarist'),
    ('S002', 'C007', 'Drummer'),
    ('S003', 'C008', 'Singer'),
    ('S003', 'C009', 'Guitarist'),
    ('S003', 'C010', 'Bassist'),
    ('S003', 'C011', 'Drummer'),
    ('S004', 'C012', 'Singer'),
    ('S005', 'C013', 'Singer, Songwriter'),
    ('S006', 'C014', 'Singer, Guitarist, Songwriter'),
    ('S006', 'C015', 'Guitarist'),
    ('S007', 'C016', 'Singer, Guitarist'),
    ('S007', 'C017', 'Bassist'),
    ('S007', 'C018', 'Drummer'),
    ('S008', 'C001', 'Singer, Guitarist, Songwriter'),
    ('S008', 'C002', 'Singer, Guitarist, Songwriter'),
    ('S009', 'C003', 'Singer, Guitarist, Songwriter'),
    ('S010', 'C004', 'Singer, Guitarist, Songwriter'),
    ('S011', 'C005', 'Singer, Guitarist'),
    ('S012', 'C006', 'Guitarist'),
    ('S013', 'C007', 'Drummer'),
    ('S014', 'C008', 'Singer'),
    ('S015', 'C009', 'Guitarist'),
    ('S016', 'C010', 'Bassist'),
    ('S017', 'C011', 'Drummer'),
    ('S018', 'C012', 'Singer');
-- Establish Base Requesters
INSERT INTO Requester(RID, RNAME)
    VALUES ('123456789', 'jef'),
    ('111111111', 'bill'),
    ('222222222', 'jill');
-- Establish Base DJ
INSERT INTO DJ(DID, DNAME)
    VALUES('987654321','tom');

--Establish Base Queue
INSERT INTO Queues(RID, DID, S_ID, PRIO)
    VALUES ('123456789','987654321','S001',0),
    ('123456789','987654321','S002',1),
    ('111111111','987654321','S001',0),
    ('222222222','987654321','S001',1);