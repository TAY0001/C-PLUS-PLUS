/*
CREATE TABLE Payments (
	paymentId VARCHAR2(4) NOT NULL,
	memberId VARCHAR2(4) NOT NULL,
	paymentDate DATE NOT NULL,	
	payAmount NUMBER(8,2) NULL,		
    	paymentMethod VARCHAR2(9) NOT NULL,
	paymentType VARCHAR2(25) NOT NULL,	
	receiptNo VARCHAR2(6) NOT NULL,	
	CONSTRAINT pk_Payments PRIMARY KEY (paymentId),	
	CONSTRAINT fk_Payments_Members FOREIGN KEY (memberId) REFERENCES Members (memberId),
	CONSTRAINT chk_paymentMethod CHECK (paymentMethod IN ('Tng', 'Cash', 'Duitnow')),
	CONSTRAINT chk_paymentType CHECK (paymentType IN ('Fines', 'Membership Registration'))
);
*/

INSERT INTO Payments VALUES('P001', 'M001', TO_DATE('02-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV001');
INSERT INTO Payments VALUES('P002', 'M002', TO_DATE('02-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV002');
INSERT INTO Payments VALUES('P003', 'M003', TO_DATE('02-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV003');
INSERT INTO Payments VALUES('P004', 'M004', TO_DATE('02-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV004');
INSERT INTO Payments VALUES('P005', 'M005', TO_DATE('03-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV005');
INSERT INTO Payments VALUES('P006', 'M006', TO_DATE('03-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV006');
INSERT INTO Payments VALUES('P007', 'M007', TO_DATE('04-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV007');
INSERT INTO Payments VALUES('P008', 'M008', TO_DATE('04-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV008');
INSERT INTO Payments VALUES('P009', 'M009', TO_DATE('04-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV009');
INSERT INTO Payments VALUES('P010', 'M010', TO_DATE('05-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV010');

INSERT INTO Payments VALUES('P011', 'M011', TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV011');
INSERT INTO Payments VALUES('P012', 'M012', TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV012');
INSERT INTO Payments VALUES('P013', 'M013', TO_DATE('09-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV013');
INSERT INTO Payments VALUES('P014', 'M014', TO_DATE('09-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV014');
INSERT INTO Payments VALUES('P015', 'M015', TO_DATE('10-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV015');
INSERT INTO Payments VALUES('P016', 'M016', TO_DATE('10-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV016');
INSERT INTO Payments VALUES('P017', 'M017', TO_DATE('11-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV017');
INSERT INTO Payments VALUES('P018', 'M018', TO_DATE('11-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV018');
INSERT INTO Payments VALUES('P019', 'M019', TO_DATE('12-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV019');
INSERT INTO Payments VALUES('P020', 'M020', TO_DATE('12-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV020');

INSERT INTO Payments VALUES('P021', 'M021', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV021');
INSERT INTO Payments VALUES('P022', 'M022', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV022');
INSERT INTO Payments VALUES('P023', 'M023', TO_DATE('16-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV023');
INSERT INTO Payments VALUES('P024', 'M024', TO_DATE('16-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV024');
INSERT INTO Payments VALUES('P025', 'M025', TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV025');
INSERT INTO Payments VALUES('P026', 'M026', TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV026');
INSERT INTO Payments VALUES('P027', 'M027', TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV027');
INSERT INTO Payments VALUES('P028', 'M028', TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV028');
INSERT INTO Payments VALUES('P029', 'M010', TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV029');
INSERT INTO Payments VALUES('P030', 'M029', TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV030');

INSERT INTO Payments VALUES('P031', 'M030', TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV031');
INSERT INTO Payments VALUES('P032', 'M011', TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV032');
INSERT INTO Payments VALUES('P033', 'M031', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV033');
INSERT INTO Payments VALUES('P034', 'M032', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV034');
INSERT INTO Payments VALUES('P035', 'M001', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV035');
INSERT INTO Payments VALUES('P036', 'M033', TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV036');
INSERT INTO Payments VALUES('P037', 'M004', TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV037');
INSERT INTO Payments VALUES('P038', 'M013', TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV038');
INSERT INTO Payments VALUES('P039', 'M034', TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV039');
INSERT INTO Payments VALUES('P040', 'M035', TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV040');

INSERT INTO Payments VALUES('P041', 'M036', TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV041');
INSERT INTO Payments VALUES('P042', 'M008', TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV042');
INSERT INTO Payments VALUES('P043', 'M023', TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV043');
INSERT INTO Payments VALUES('P044', 'M037', TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV044');
INSERT INTO Payments VALUES('P045', 'M038', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV045');
INSERT INTO Payments VALUES('P046', 'M039', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV046');
INSERT INTO Payments VALUES('P047', 'M040', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV047');
INSERT INTO Payments VALUES('P048', 'M018', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV048');
INSERT INTO Payments VALUES('P049', 'M041', TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV049');
INSERT INTO Payments VALUES('P050', 'M016', TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV050');

INSERT INTO Payments VALUES('P051', 'M027', TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV051');
INSERT INTO Payments VALUES('P052', 'M042', TO_DATE('30-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV052');
INSERT INTO Payments VALUES('P053', 'M022', TO_DATE('30-Jan-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV053');
INSERT INTO Payments VALUES('P054', 'M043', TO_DATE('31-Jan-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV054');
INSERT INTO Payments VALUES('P055', 'M044', TO_DATE('01-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV055');
INSERT INTO Payments VALUES('P056', 'M045', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV056');
INSERT INTO Payments VALUES('P057', 'M038', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV057');
INSERT INTO Payments VALUES('P058', 'M046', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV058');
INSERT INTO Payments VALUES('P059', 'M030', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV059');
INSERT INTO Payments VALUES('P060', 'M032', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV060');

INSERT INTO Payments VALUES('P061', 'M047', TO_DATE('06-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV061');
INSERT INTO Payments VALUES('P062', 'M048', TO_DATE('07-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV062');
INSERT INTO Payments VALUES('P063', 'M049', TO_DATE('08-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV063');
INSERT INTO Payments VALUES('P064', 'M050', TO_DATE('09-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV064');
INSERT INTO Payments VALUES('P065', 'M051', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV065');
INSERT INTO Payments VALUES('P066', 'M052', TO_DATE('13-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV066');
INSERT INTO Payments VALUES('P067', 'M053', TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV067');
INSERT INTO Payments VALUES('P068', 'M036', TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV068');
INSERT INTO Payments VALUES('P069', 'M043', TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV069');
INSERT INTO Payments VALUES('P070', 'M054', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV070');

INSERT INTO Payments VALUES('P071', 'M002', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV071');
INSERT INTO Payments VALUES('P072', 'M055', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV072');
INSERT INTO Payments VALUES('P073', 'M043', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV073');
INSERT INTO Payments VALUES('P074', 'M056', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV074');
INSERT INTO Payments VALUES('P075', 'M011', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV075');
INSERT INTO Payments VALUES('P076', 'M020', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV076');
INSERT INTO Payments VALUES('P077', 'M045', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV077');
INSERT INTO Payments VALUES('P078', 'M057', TO_DATE('20-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV078');
INSERT INTO Payments VALUES('P079', 'M058', TO_DATE('21-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV079');
INSERT INTO Payments VALUES('P080', 'M032', TO_DATE('21-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV080');

INSERT INTO Payments VALUES('P081', 'M059', TO_DATE('22-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV081');
INSERT INTO Payments VALUES('P082', 'M060', TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV082');
INSERT INTO Payments VALUES('P083', 'M061', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV083');
INSERT INTO Payments VALUES('P084', 'M001', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV084');
INSERT INTO Payments VALUES('P085', 'M011', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV085');
INSERT INTO Payments VALUES('P086', 'M011', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV086');
INSERT INTO Payments VALUES('P087', 'M062', TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV087');
INSERT INTO Payments VALUES('P088', 'M017', TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV088');
INSERT INTO Payments VALUES('P089', 'M027', TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV089');
INSERT INTO Payments VALUES('P090', 'M053', TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV090');

INSERT INTO Payments VALUES('P091', 'M059', TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV091');
INSERT INTO Payments VALUES('P092', 'M063', TO_DATE('28-Feb-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV092');
INSERT INTO Payments VALUES('P093', 'M064', TO_DATE('28-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV093');
INSERT INTO Payments VALUES('P094', 'M003', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV094');
INSERT INTO Payments VALUES('P095', 'M047', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV095');
INSERT INTO Payments VALUES('P096', 'M051', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV096');
INSERT INTO Payments VALUES('P097', 'M065', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV097');
INSERT INTO Payments VALUES('P098', 'M041', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV098');
INSERT INTO Payments VALUES('P099', 'M045', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV099');
INSERT INTO Payments VALUES('P100', 'M053', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV100');

INSERT INTO Payments VALUES('P101', 'M060', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV101');
INSERT INTO Payments VALUES('P102', 'M066', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV102');
INSERT INTO Payments VALUES('P103', 'M067', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV103');
INSERT INTO Payments VALUES('P104', 'M009', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV104');
INSERT INTO Payments VALUES('P105', 'M035', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV105');
INSERT INTO Payments VALUES('P106', 'M046', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV106');
INSERT INTO Payments VALUES('P107', 'M068', TO_DATE('06-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV107');
INSERT INTO Payments VALUES('P108', 'M069', TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV108');
INSERT INTO Payments VALUES('P109', 'M070', TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV109');
INSERT INTO Payments VALUES('P110', 'M020', TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV110');

INSERT INTO Payments VALUES('P111', 'M058', TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV111');
INSERT INTO Payments VALUES('P112', 'M071', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV112');
INSERT INTO Payments VALUES('P113', 'M061', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV113');
INSERT INTO Payments VALUES('P114', 'M061', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV114');
INSERT INTO Payments VALUES('P115', 'M072', TO_DATE('12-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV115');
INSERT INTO Payments VALUES('P116', 'M073', TO_DATE('12-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV116');
INSERT INTO Payments VALUES('P117', 'M074', TO_DATE('12-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV117');
INSERT INTO Payments VALUES('P118', 'M049', TO_DATE('13-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV118');
INSERT INTO Payments VALUES('P119', 'M001', TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV119');
INSERT INTO Payments VALUES('P120', 'M051', TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV120');

INSERT INTO Payments VALUES('P121', 'M060', TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV121');
INSERT INTO Payments VALUES('P122', 'M064', TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV122');
INSERT INTO Payments VALUES('P123', 'M075', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV123');
INSERT INTO Payments VALUES('P124', 'M047', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV124');
INSERT INTO Payments VALUES('P125', 'M061', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV125');
INSERT INTO Payments VALUES('P126', 'M076', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV126');
INSERT INTO Payments VALUES('P127', 'M048', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV127');
INSERT INTO Payments VALUES('P128', 'M057', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV128');
INSERT INTO Payments VALUES('P129', 'M059', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV129');
INSERT INTO Payments VALUES('P130', 'M077', TO_DATE('19-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV130');

INSERT INTO Payments VALUES('P131', 'M062', TO_DATE('19-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV131');
INSERT INTO Payments VALUES('P132', 'M078', TO_DATE('20-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV132');
INSERT INTO Payments VALUES('P133', 'M079', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV133');
INSERT INTO Payments VALUES('P134', 'M063', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV134');
INSERT INTO Payments VALUES('P135', 'M080', TO_DATE('22-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV135');
INSERT INTO Payments VALUES('P136', 'M081', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV136');
INSERT INTO Payments VALUES('P137', 'M036', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV137');
INSERT INTO Payments VALUES('P138', 'M065', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV138');
INSERT INTO Payments VALUES('P139', 'M068', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV139');
INSERT INTO Payments VALUES('P140', 'M082', TO_DATE('26-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV140');

INSERT INTO Payments VALUES('P141', 'M083', TO_DATE('27-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV141');
INSERT INTO Payments VALUES('P142', 'M084', TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV142');
INSERT INTO Payments VALUES('P143', 'M026', TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV143');
INSERT INTO Payments VALUES('P144', 'M038', TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV144');
INSERT INTO Payments VALUES('P145', 'M085', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV145');
INSERT INTO Payments VALUES('P146', 'M025', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV146');
INSERT INTO Payments VALUES('P147', 'M078', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV147');
INSERT INTO Payments VALUES('P148', 'M086', TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV148');
INSERT INTO Payments VALUES('P149', 'M065', TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV149');
INSERT INTO Payments VALUES('P150', 'M087', TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV150');

INSERT INTO Payments VALUES('P151', 'M042', TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV151');
INSERT INTO Payments VALUES('P152', 'M071', TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV152');
INSERT INTO Payments VALUES('P153', 'M088', TO_DATE('03-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV153');
INSERT INTO Payments VALUES('P154', 'M020', TO_DATE('03-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV154');
INSERT INTO Payments VALUES('P155', 'M024', TO_DATE('03-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV155');
INSERT INTO Payments VALUES('P156', 'M089', TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV156');
INSERT INTO Payments VALUES('P157', 'M018', TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV157');
INSERT INTO Payments VALUES('P158', 'M035', TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV158');
INSERT INTO Payments VALUES('P159', 'M046', TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV159');
INSERT INTO Payments VALUES('P160', 'M079', TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV160');

INSERT INTO Payments VALUES('P161', 'M090', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV161');
INSERT INTO Payments VALUES('P162', 'M009', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV162');
INSERT INTO Payments VALUES('P163', 'M020', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV163');
INSERT INTO Payments VALUES('P164', 'M026', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV164');
INSERT INTO Payments VALUES('P165', 'M030', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV165');
INSERT INTO Payments VALUES('P166', 'M091', TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV166');
INSERT INTO Payments VALUES('P167', 'M092', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV167');
INSERT INTO Payments VALUES('P168', 'M001', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV168');
INSERT INTO Payments VALUES('P169', 'M011', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV169');
INSERT INTO Payments VALUES('P170', 'M019', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV170');

INSERT INTO Payments VALUES('P171', 'M028', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV171');
INSERT INTO Payments VALUES('P172', 'M035', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV172');
INSERT INTO Payments VALUES('P173', 'M044', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV173');
INSERT INTO Payments VALUES('P174', 'M085', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV174');
INSERT INTO Payments VALUES('P175', 'M093', TO_DATE('10-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV175');
INSERT INTO Payments VALUES('P176', 'M014', TO_DATE('10-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV176');
INSERT INTO Payments VALUES('P177', 'M094', TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV177');
INSERT INTO Payments VALUES('P178', 'M095', TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV178');
INSERT INTO Payments VALUES('P179', 'M063', TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV179');
INSERT INTO Payments VALUES('P180', 'M096', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV180');

INSERT INTO Payments VALUES('P181', 'M025', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV181');
INSERT INTO Payments VALUES('P182', 'M027', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV182');
INSERT INTO Payments VALUES('P183', 'M056', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV183');
INSERT INTO Payments VALUES('P184', 'M097', TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV184');
INSERT INTO Payments VALUES('P185', 'M025', TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV185');
INSERT INTO Payments VALUES('P186', 'M026', TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV186');
INSERT INTO Payments VALUES('P187', 'M063', TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV187');
INSERT INTO Payments VALUES('P188', 'M098', TO_DATE('17-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV188');
INSERT INTO Payments VALUES('P189', 'M022', TO_DATE('17-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV189');
INSERT INTO Payments VALUES('P190', 'M099', TO_DATE('18-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV190');

INSERT INTO Payments VALUES('P191', 'M029', TO_DATE('18-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV191');
INSERT INTO Payments VALUES('P192', 'M100', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV192');
INSERT INTO Payments VALUES('P193', 'M101', TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV193');
INSERT INTO Payments VALUES('P194', 'M071', TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV194');
INSERT INTO Payments VALUES('P195', 'M102', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV195');
INSERT INTO Payments VALUES('P196', 'M034', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV196');
INSERT INTO Payments VALUES('P197', 'M103', TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV197');
INSERT INTO Payments VALUES('P198', 'M004', TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV198');
INSERT INTO Payments VALUES('P199', 'M047', TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV199');
INSERT INTO Payments VALUES('P200', 'M081', TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV200');

INSERT INTO Payments VALUES('P201', 'M104', TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV201');
INSERT INTO Payments VALUES('P202', 'M097', TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV202');
INSERT INTO Payments VALUES('P203', 'M105', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV203');
INSERT INTO Payments VALUES('P204', 'M042', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV204');
INSERT INTO Payments VALUES('P205', 'M044', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV205');
INSERT INTO Payments VALUES('P206', 'M106', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV206');
INSERT INTO Payments VALUES('P207', 'M094', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV207');
INSERT INTO Payments VALUES('P208', 'M100', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV208');
INSERT INTO Payments VALUES('P209', 'M107', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV209');
INSERT INTO Payments VALUES('P210', 'M108', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV210');

INSERT INTO Payments VALUES('P211', 'M109', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV211');
INSERT INTO Payments VALUES('P212', 'M043', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV212');
INSERT INTO Payments VALUES('P213', 'M057', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV213');
INSERT INTO Payments VALUES('P214', 'M063', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV214');
INSERT INTO Payments VALUES('P215', 'M104', TO_DATE('02-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV215');
INSERT INTO Payments VALUES('P216', 'M110', TO_DATE('03-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV216');
INSERT INTO Payments VALUES('P217', 'M111', TO_DATE('06-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV217');
INSERT INTO Payments VALUES('P218', 'M056', TO_DATE('06-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV218');
INSERT INTO Payments VALUES('P219', 'M100', TO_DATE('06-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV219');
INSERT INTO Payments VALUES('P220', 'M112', TO_DATE('07-May-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV220');

INSERT INTO Payments VALUES('P221', 'M027', TO_DATE('07-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV221');
INSERT INTO Payments VALUES('P222', 'M064', TO_DATE('07-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV222');
INSERT INTO Payments VALUES('P223', 'M113', TO_DATE('08-May-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV223');
INSERT INTO Payments VALUES('P224', 'M114', TO_DATE('09-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV224');
INSERT INTO Payments VALUES('P225', 'M115', TO_DATE('10-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV225');
INSERT INTO Payments VALUES('P226', 'M032', TO_DATE('10-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV226');
INSERT INTO Payments VALUES('P227', 'M072', TO_DATE('10-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV227');
INSERT INTO Payments VALUES('P228', 'M116', TO_DATE('13-May-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV228');
INSERT INTO Payments VALUES('P229', 'M117', TO_DATE('14-May-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV229');
INSERT INTO Payments VALUES('P230', 'M069', TO_DATE('14-May-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV230');

INSERT INTO Payments VALUES('P231', 'M118', TO_DATE('15-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV231');
INSERT INTO Payments VALUES('P232', 'M039', TO_DATE('15-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV232');
INSERT INTO Payments VALUES('P233', 'M068', TO_DATE('15-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV233');
INSERT INTO Payments VALUES('P234', 'M119', TO_DATE('16-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV234');
INSERT INTO Payments VALUES('P235', 'M018', TO_DATE('16-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV235');
INSERT INTO Payments VALUES('P236', 'M053', TO_DATE('16-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV236');
INSERT INTO Payments VALUES('P237', 'M120', TO_DATE('17-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV237');
INSERT INTO Payments VALUES('P238', 'M022', TO_DATE('17-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV238');
INSERT INTO Payments VALUES('P239', 'M037', TO_DATE('17-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV239');
INSERT INTO Payments VALUES('P240', 'M070', TO_DATE('17-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV240');

INSERT INTO Payments VALUES('P241', 'M112', TO_DATE('17-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV241');
INSERT INTO Payments VALUES('P242', 'M121', TO_DATE('20-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV242');
INSERT INTO Payments VALUES('P243', 'M065', TO_DATE('20-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV243');
INSERT INTO Payments VALUES('P244', 'M107', TO_DATE('20-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV244');
INSERT INTO Payments VALUES('P245', 'M107', TO_DATE('20-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV245');
INSERT INTO Payments VALUES('P246', 'M122', TO_DATE('21-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV246');
INSERT INTO Payments VALUES('P247', 'M116', TO_DATE('21-May-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV247');
INSERT INTO Payments VALUES('P248', 'M123', TO_DATE('22-May-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV248');
INSERT INTO Payments VALUES('P249', 'M124', TO_DATE('23-May-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV249');
INSERT INTO Payments VALUES('P250', 'M125', TO_DATE('24-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV250');

INSERT INTO Payments VALUES('P251', 'M025', TO_DATE('24-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV251');
INSERT INTO Payments VALUES('P252', 'M109', TO_DATE('24-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV252');
INSERT INTO Payments VALUES('P253', 'M126', TO_DATE('27-May-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV253');
INSERT INTO Payments VALUES('P254', 'M127', TO_DATE('28-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV254');
INSERT INTO Payments VALUES('P255', 'M006', TO_DATE('28-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV255');
INSERT INTO Payments VALUES('P256', 'M059', TO_DATE('28-May-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV256');
INSERT INTO Payments VALUES('P257', 'M080', TO_DATE('28-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV257');
INSERT INTO Payments VALUES('P258', 'M101', TO_DATE('28-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV258');
INSERT INTO Payments VALUES('P259', 'M103', TO_DATE('28-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV259');
INSERT INTO Payments VALUES('P260', 'M128', TO_DATE('29-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV260');

INSERT INTO Payments VALUES('P261', 'M129', TO_DATE('30-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV261');
INSERT INTO Payments VALUES('P262', 'M130', TO_DATE('31-May-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV262');
INSERT INTO Payments VALUES('P263', 'M131', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV263');
INSERT INTO Payments VALUES('P264', 'M010', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV264');
INSERT INTO Payments VALUES('P265', 'M075', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV265');
INSERT INTO Payments VALUES('P266', 'M123', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV266');
INSERT INTO Payments VALUES('P267', 'M132', TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV267');
INSERT INTO Payments VALUES('P268', 'M063', TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV268');
INSERT INTO Payments VALUES('P269', 'M133', TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV269');
INSERT INTO Payments VALUES('P270', 'M043', TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV270');

INSERT INTO Payments VALUES('P271', 'M134', TO_DATE('06-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV271');
INSERT INTO Payments VALUES('P272', 'M092', TO_DATE('06-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV272');
INSERT INTO Payments VALUES('P273', 'M135', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV273');
INSERT INTO Payments VALUES('P274', 'M136', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV274');
INSERT INTO Payments VALUES('P275', 'M069', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV275');
INSERT INTO Payments VALUES('P276', 'M125', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV276');
INSERT INTO Payments VALUES('P277', 'M137', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV277');
INSERT INTO Payments VALUES('P278', 'M042', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV278');
INSERT INTO Payments VALUES('P279', 'M045', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV279');
INSERT INTO Payments VALUES('P280', 'M049', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV280');

INSERT INTO Payments VALUES('P281', 'M138', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV281');
INSERT INTO Payments VALUES('P282', 'M034', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV282');
INSERT INTO Payments VALUES('P283', 'M139', TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Membership Registration', 'INV283');
INSERT INTO Payments VALUES('P284', 'M030', TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV284');
INSERT INTO Payments VALUES('P285', 'M140', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV285');
INSERT INTO Payments VALUES('P286', 'M074', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV286');
INSERT INTO Payments VALUES('P287', 'M076', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV287');
INSERT INTO Payments VALUES('P288', 'M100', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV288');
INSERT INTO Payments VALUES('P289', 'M109', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV289');
INSERT INTO Payments VALUES('P290', 'M141', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV290');

INSERT INTO Payments VALUES('P291', 'M085', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV291');
INSERT INTO Payments VALUES('P292', 'M097', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV292');
INSERT INTO Payments VALUES('P293', 'M100', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV293');
INSERT INTO Payments VALUES('P294', 'M125', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV294');
INSERT INTO Payments VALUES('P295', 'M142', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV295');
INSERT INTO Payments VALUES('P296', 'M130', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV296');
INSERT INTO Payments VALUES('P297', 'M143', TO_DATE('19-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV297');
INSERT INTO Payments VALUES('P298', 'M144', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV298');
INSERT INTO Payments VALUES('P299', 'M145', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV299');
INSERT INTO Payments VALUES('P300', 'M036', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV300');

INSERT INTO Payments VALUES('P301', 'M146', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV301');
INSERT INTO Payments VALUES('P302', 'M006', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV302');
INSERT INTO Payments VALUES('P303', 'M045', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV303');
INSERT INTO Payments VALUES('P304', 'M051', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV304');
INSERT INTO Payments VALUES('P305', 'M058', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV305');
INSERT INTO Payments VALUES('P306', 'M100', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV306');
INSERT INTO Payments VALUES('P307', 'M118', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV307');
INSERT INTO Payments VALUES('P308', 'M122', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV308');
INSERT INTO Payments VALUES('P309', 'M147', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV309');
INSERT INTO Payments VALUES('P310', 'M017', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV310');

INSERT INTO Payments VALUES('P311', 'M125', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV311');
INSERT INTO Payments VALUES('P312', 'M148', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Membership Registration', 'INV312');
INSERT INTO Payments VALUES('P313', 'M001', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV313');
INSERT INTO Payments VALUES('P314', 'M061', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV314');
INSERT INTO Payments VALUES('P315', 'M074', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV315');
INSERT INTO Payments VALUES('P316', 'M149', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV316');
INSERT INTO Payments VALUES('P317', 'M010', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV317');
INSERT INTO Payments VALUES('P318', 'M018', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV318');
INSERT INTO Payments VALUES('P319', 'M067', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV319'); 
INSERT INTO Payments VALUES('P320', 'M075', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV320');

INSERT INTO Payments VALUES('P321', 'M090', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV321');
INSERT INTO Payments VALUES('P322', 'M150', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Membership Registration', 'INV322');
INSERT INTO Payments VALUES('P323', 'M011', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV323');
INSERT INTO Payments VALUES('P324', 'M056', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV324');   
INSERT INTO Payments VALUES('P325', 'M076', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), NULL, 'Duitnow', 'Fines', 'INV325');
INSERT INTO Payments VALUES('P326', 'M105', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), NULL, 'Cash', 'Fines', 'INV326');
INSERT INTO Payments VALUES('P327', 'M118', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV327');
INSERT INTO Payments VALUES('P328', 'M136', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV328');
INSERT INTO Payments VALUES('P329', 'M041', TO_DATE('01-July-2024', 'DD-MON-YYYY'), NULL, 'Tng', 'Fines', 'INV329'); 

COMMIT;