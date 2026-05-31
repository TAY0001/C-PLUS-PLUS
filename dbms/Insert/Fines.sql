/*
CREATE TABLE Fines (
    fineId VARCHAR2(4) NOT NULL,        
    borrowId VARCHAR2(5) NOT NULL,        
    paymentId VARCHAR2(4) NULL,
    fineType VARCHAR2(12) NOT NULL,        
    fineAmount NUMBER(8,2) NULL,        
    fineDate DATE NOT NULL,        
    fineStatus VARCHAR2(6) NOT NULL,        
    CONSTRAINT pk_Fines PRIMARY KEY (fineId),        
    CONSTRAINT fk_Fines_BorrowedBooks FOREIGN KEY (borrowId) REFERENCES BorrowedBooks (borrowId),                
    CONSTRAINT chk_fineType CHECK (fineType IN ('Late Return', 'Lost Book', 'Damage')),        
    CONSTRAINT chk_fineStatus CHECK (fineStatus IN ('Unpaid', 'Paid'))
);
*/

INSERT INTO Fines VALUES('F001', 'BB009', 'P029', 'Late Return', NULL, TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F002', 'BB010', 'P032', 'Late Return', NULL, TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F003', 'BB014', 'P035', 'Late Return', NULL, TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F004', 'BB004', 'P037', 'Late Return', NULL, TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F005', 'BB004', 'P037', 'Damage', NULL, TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F006', 'BB012', 'P038', 'Late Return', NULL, TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F007', 'BB007', 'P042', 'Late Return', NULL, TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F008', 'BB007', 'P042', 'Damage', NULL, TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F009', 'BB023', 'P043', 'Damage', NULL, TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F010', 'BB011', 'P323', 'Lost Book', NULL, TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F011', 'BB020', 'P048', 'Late Return', NULL, TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F012', 'BB016', 'P050', 'Late Return', NULL, TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F013', 'BB027', 'P051', 'Late Return', NULL, TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F014', 'BB008', 'P104', 'Lost Book', NULL, TO_DATE('30-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F015', 'BB022', 'P053', 'Late Return', NULL, TO_DATE('30-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F016', 'BB017', 'P310', 'Lost Book', NULL, TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F017', 'BB018', 'P317', 'Lost Book', NULL, TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F018', 'BB038', 'P057', 'Damage', NULL, TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F019', 'BB030', 'P059', 'Late Return', NULL, TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F020', 'BB033', 'P060', 'Late Return', NULL, TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F021', 'BB026', 'P143', 'Lost Book', NULL, TO_DATE('06-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F022', 'BB025', 'P146', 'Lost Book', NULL, TO_DATE('08-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F023', 'BB031', NULL, 'Lost Book', NULL, TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F024', 'BB034', 'P158', 'Lost Book', NULL, TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F025', 'BB035', 'P105', 'Lost Book', NULL, TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F026', 'BB040', 'P098', 'Lost Book', NULL, TO_DATE('13-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F027', 'BB036', 'P068', 'Late Return', NULL, TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F028', 'BB042', 'P069', 'Late Return', NULL, TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F029', 'BB044', 'P071', 'Damage', NULL, TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F030', 'BB046', 'P073', 'Late Return', NULL, TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F031', 'BB053', 'P075', 'Late Return', NULL, TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F032', 'BB055', 'P077', 'Late Return', NULL, TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F033', 'BB058', 'P076', 'Late Return', NULL, TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F034', 'BB058', 'P076', 'Damage', NULL, TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F035', 'BB047', 'P080', 'Lost Book', NULL, TO_DATE('20-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F036', 'BB041', 'P278', 'Lost Book', NULL, TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F037', 'BB051', 'P085', 'Lost Book', NULL, TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F038', 'BB052', 'P086', 'Lost Book', NULL, TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F039', 'BB054', 'P169', 'Lost Book', NULL, TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F040', 'BB043', NULL, 'Lost Book', NULL, TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), 'Unpaid');

INSERT INTO Fines VALUES('F041', 'BB070', 'P084', 'Late Return', NULL, TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F042', 'BB045', NULL, 'Lost Book', NULL, TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F043', 'BB057', 'P094', 'Lost Book', NULL, TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F044', 'BB060', NULL, 'Lost Book', NULL, TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F045', 'BB061', 'P280', 'Lost Book', NULL, TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F046', 'BB066', 'P090', 'Late Return', NULL, TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F047', 'BB071', 'P089', 'Late Return', NULL, TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F048', 'BB075', 'P088', 'Late Return', NULL, TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F049', 'BB077', 'P091', 'Late Return', NULL, TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F050', 'BB059', 'P095', 'Late Return', NULL, TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F051', 'BB064', 'P096', 'Late Return', NULL, TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F052', 'BB056', 'P106', 'Lost Book', NULL, TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F053', 'BB069', 'P218', 'Lost Book', NULL, TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F054', 'BB079', 'P101', 'Late Return', NULL, TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F055', 'BB080', 'P099', 'Late Return', NULL, TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F056', 'BB084', 'P100', 'Damage', NULL, TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F057', 'BB073', 'P111', 'Lost Book', NULL, TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F058', 'BB074', 'P165', 'Lost Book', NULL, TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F059', 'BB088', 'P110', 'Late Return', NULL, TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F060', 'BB091', 'P113', 'Late Return', NULL, TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F061', 'BB092', 'P114', 'Late Return', NULL, TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F062', 'BB083', 'P121', 'Lost Book', NULL, TO_DATE('12-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F063', 'BB085', 'P318', 'Lost Book', NULL, TO_DATE('12-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F064', 'BB087', 'P120', 'Lost Book', NULL, TO_DATE('12-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F065', 'BB104', 'P118', 'Damage', NULL, TO_DATE('13-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F066', 'BB096', 'P122', 'Late Return', NULL, TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F067', 'BB098', 'P119', 'Late Return', NULL, TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F068', 'BB078', 'P129', 'Lost Book', NULL, TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F069', 'BB090', 'P125', 'Lost Book', NULL, TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F070', 'BB103', 'P124', 'Late Return', NULL, TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F071', 'BB082', 'P151', 'Lost Book', NULL, TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F072', 'BB093', 'P131', 'Lost Book', NULL, TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F073', 'BB107', 'P127', 'Late Return', NULL, TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F074', 'BB108', 'P128', 'Late Return', NULL, TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F075', 'BB094', 'P179', 'Lost Book', NULL, TO_DATE('19-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F076', 'BB099', 'P187', 'Lost Book', NULL, TO_DATE('19-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F077', 'BB100', 'P186', 'Lost Book', NULL, TO_DATE('19-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F078', 'BB095', 'P134', 'Late Return', NULL, TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F079', 'BB095', 'P134', 'Damage', NULL, TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F080', 'BB102', NULL, 'Lost Book', NULL, TO_DATE('22-Mar-2024', 'DD-MON-YYYY'), 'Unpaid');

INSERT INTO Fines VALUES('F081', 'BB106', 'P137', 'Late Return', NULL, TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F082', 'BB117', 'P139', 'Late Return', NULL, TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F083', 'BB118', 'P138', 'Late Return', NULL, TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F084', 'BB097', 'P144', 'Lost Book', NULL, TO_DATE('26-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F085', 'BB101', 'P149', 'Lost Book', NULL, TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F086', 'BB120', 'P287', 'Lost Book', NULL, TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F087', 'BB123', 'P147', 'Late Return', NULL, TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F088', 'BB119', NULL, 'Lost Book', NULL, TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F089', 'BB113', 'P155', 'Lost Book', NULL, TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F090', 'BB121', 'P227', 'Lost Book', NULL, TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F091', 'BB122', 'P152', 'Late Return', NULL, TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F092', 'BB124', 'P157', 'Lost Book', NULL, TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F093', 'BB142', 'P154', 'Damage', NULL, TO_DATE('03-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F094', 'BB135', 'P160', 'Late Return', NULL, TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F095', 'BB136', 'P159', 'Late Return', NULL, TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F096', 'BB114', 'P305', 'Lost Book', NULL, TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F097', 'BB115', NULL, 'Lost Book', NULL, TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F098', 'BB127', 'P162', 'Lost Book', NULL, TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F099', 'BB129', 'P170', 'Lost Book', NULL, TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F100', 'BB139', 'P164', 'Late Return', NULL, TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F101', 'BB140', 'P163', 'Late Return', NULL, TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F102', 'BB140', 'P163', 'Damage', NULL, TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F103', 'BB131', 'P176', 'Lost Book', NULL, TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F104', 'BB132', 'P173', 'Lost Book', NULL, TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F105', 'BB133', NULL, 'Lost Book', NULL, TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F106', 'BB146', 'P171', 'Late Return', NULL, TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F107', 'BB146', 'P171', 'Damage', NULL, TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F108', 'BB148', 'P168', 'Late Return', NULL, TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F109', 'BB149', 'P174', 'Late Return', NULL, TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F110', 'BB151', 'P172', 'Late Return', NULL, TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F111', 'BB128', 'P243', 'Lost Book', NULL, TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F112', 'BB138', 'P181', 'Lost Book', NULL, TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F113', 'BB141', 'P182', 'Lost Book', NULL, TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F114', 'BB143', 'P233', 'Lost Book', NULL, TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F115', 'BB144', 'P185', 'Lost Book', NULL, TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F116', 'BB145', 'P189', 'Lost Book', NULL, TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F117', 'BB156', 'P183', 'Late Return', NULL, TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F118', 'BB134', 'P239', 'Lost Book', NULL, TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F119', 'BB152', 'P191', 'Lost Book', NULL, TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F120', 'BB153', 'P238', 'Lost Book', NULL, TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F121', 'BB154', 'P194', 'Late Return', NULL, TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F122', 'BB155', 'P196', 'Late Return', NULL, TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F123', 'BB165', 'P198', 'Late Return', NULL, TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F124', 'BB168', 'P200', 'Late Return', NULL, TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F125', 'BB172', 'P199', 'Late Return', NULL, TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F126', 'BB170', 'P202', 'Late Return', NULL, TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F127', 'BB160', 'P204', 'Late Return', NULL, TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F128', 'BB161', 'P205', 'Late Return', NULL, TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F129', 'BB162', 'P207', 'Late Return', NULL, TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F130', 'BB164', NULL, 'Lost Book', NULL, TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Unpaid');

INSERT INTO Fines VALUES('F131', 'BB167', 'P212', 'Lost Book', NULL, TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F132', 'BB174', 'P208', 'Late Return', NULL, TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F133', 'BB181', 'P213', 'Late Return', NULL, TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F134', 'BB182', 'P214', 'Late Return', NULL, TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F135', 'BB169', 'P321', 'Lost Book', NULL, TO_DATE('01-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F136', 'BB177', 'P215', 'Late Return', NULL, TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F137', 'BB163', 'P319', 'Lost Book', NULL, TO_DATE('03-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F138', 'BB176', NULL, 'Lost Book', NULL, TO_DATE('06-May-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F139', 'BB191', 'P219', 'Late Return', NULL, TO_DATE('06-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F140', 'BB178', 'P222', 'Late Return', NULL, TO_DATE('07-May-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F141', 'BB194', 'P221', 'Late Return', NULL, TO_DATE('07-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F142', 'BB194', 'P221', 'Damage', NULL, TO_DATE('07-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F143', 'BB189', 'P226', 'Damage', NULL, TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F144', 'BB190', NULL, 'Lost Book', NULL, TO_DATE('13-May-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F145', 'BB185', 'P315', 'Lost Book', NULL, TO_DATE('14-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F146', 'BB202', 'P230', 'Late Return', NULL, TO_DATE('14-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F147', 'BB208', 'P232', 'Late Return', NULL, TO_DATE('15-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F148', 'BB204', 'P236', 'Late Return', NULL, TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F149', 'BB207', 'P235', 'Late Return', NULL, TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F150', 'BB153', 'P238', 'Damage', NULL, TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F151', 'BB198', 'P240', 'Lost Book', NULL, TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F152', 'BB212', 'P241', 'Late Return', NULL, TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F153', 'BB215', 'P244', 'Late Return', NULL, TO_DATE('20-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F154', 'BB217', 'P245', 'Late Return', NULL, TO_DATE('20-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F155', 'BB220', 'P247', 'Late Return', NULL, TO_DATE('21-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F156', 'BB199', 'P252', 'Lost Book', NULL, TO_DATE('24-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F157', 'BB209', 'P251', 'Late Return', NULL, TO_DATE('24-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F158', 'BB211', NULL, 'Lost Book', NULL, TO_DATE('24-May-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F159', 'BB216', 'P255', 'Lost Book', NULL, TO_DATE('27-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F160', 'BB218', 'P258', 'Late Return', NULL, TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F161', 'BB219', 'P257', 'Late Return', NULL, TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F162', 'BB225', 'P259', 'Damage', NULL, TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F163', 'BB231', 'P256', 'Late Return', NULL, TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F164', 'BB223', NULL, 'Lost Book', NULL, TO_DATE('31-May-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F165', 'BB226', 'P264', 'Lost Book', NULL, TO_DATE('31-May-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F166', 'BB228', NULL, 'Lost Book', NULL, TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F167', 'BB243', 'P265', 'Late Return', NULL, TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F168', 'BB244', 'P266', 'Late Return', NULL, TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F169', 'BB232', 'P272', 'Lost Book', NULL, TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F170', 'BB247', 'P268', 'Late Return', NULL, TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F171', 'BB247', 'P268', 'Damage', NULL, TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F172', 'BB252', 'P270', 'Damage', NULL, TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F173', 'BB224', NULL, 'Lost Book', NULL, TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F174', 'BB239', NULL, 'Lost Book', NULL, TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F175', 'BB240', 'P320', 'Lost Book', NULL, TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F176', 'BB245', 'P275', 'Late Return', NULL, TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F177', 'BB249', 'P276', 'Late Return', NULL, TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F178', 'BB229', 'P288', 'Lost Book', NULL, TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F179', 'BB230', 'P279', 'Lost Book', NULL, TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F180', 'BB242', 'P284', 'Lost Book', NULL, TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F181', 'BB248', 'P311', 'Lost Book', NULL, TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F182', 'BB258', 'P282', 'Late Return', NULL, TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F183', 'BB120', 'P287', 'Damage', NULL, TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F184', 'BB241', 'P294', 'Lost Book', NULL, TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F185', 'BB250', NULL, 'Lost Book', NULL, TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Unpaid');
INSERT INTO Fines VALUES('F186', 'BB256', 'P289', 'Late Return', NULL, TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F187', 'BB262', 'P286', 'Late Return', NULL, TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F188', 'BB255', 'P292', 'Late Return', NULL, TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F189', 'BB270', 'P291', 'Late Return', NULL, TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F190', 'BB271', 'P293', 'Late Return', NULL, TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F191', 'BB273', 'P296', 'Late Return', NULL, TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F192', 'BB266', 'P308', 'Lost Book', NULL, TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F193', 'BB283', 'P300', 'Late Return', NULL, TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F194', 'BB260', 'P306', 'Late Return', NULL, TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F195', 'BB265', 'P303', 'Late Return', NULL, TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F196', 'BB289', 'P304', 'Late Return', NULL, TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F197', 'BB296', 'P302', 'Late Return', NULL, TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F198', 'BB297', 'P307', 'Late Return', NULL, TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F199', 'BB185', 'P315', 'Damage', NULL, TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F200', 'BB275', 'P324', 'Lost Book', NULL, TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Paid');

INSERT INTO Fines VALUES('F201', 'BB300', 'P314', 'Late Return', NULL, TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F202', 'BB301', 'P313', 'Late Return', NULL, TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F203', 'BB240', 'P320', 'Damage', NULL, TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F204', 'BB011', 'P323', 'Damage', NULL, TO_DATE('28-Jan-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F205', 'BB281', 'P329', 'Lost Book', NULL, TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F206', 'BB282', 'P328', 'Late Return', NULL, TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F207', 'BB288', 'P326', 'Late Return', NULL, TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F208', 'BB295', 'P327', 'Late Return', NULL, TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Paid');
INSERT INTO Fines VALUES('F209', 'BB313', 'P325', 'Damage', NULL, TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Paid');

COMMIT;