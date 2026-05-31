/*
CREATE TABLE Reservation (
    reservationId VARCHAR2(4) NOT NULL, 
    memberId VARCHAR2(4) NOT NULL, 
    copyId VARCHAR2(4) NOT NULL, 
    reservationDate DATE DEFAULT SYSDATE NOT NULL, 
    reservationStatus VARCHAR2(20) CHECK (reservationStatus IN ('Pending', 'Available', 'Cancelled')) NOT NULL,
    CONSTRAINT pk_Reservation PRIMARY KEY (reservationId), 
    CONSTRAINT fk_reservation_members FOREIGN KEY (memberId) REFERENCES Members(memberId) ON DELETE CASCADE, 
    CONSTRAINT fk_reservation_bookCopies FOREIGN KEY (copyId) REFERENCES BookCopies(copyId) ON DELETE CASCADE
);
*/

INSERT INTO Reservation VALUES ('R001', 'M068', 'C175', TO_DATE('02-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R002', 'M002', 'C237', TO_DATE('02-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R003', 'M146', 'C204', TO_DATE('02-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R004', 'M011', 'C279', TO_DATE('02-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R005', 'M062', 'C220', TO_DATE('03-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R006', 'M069', 'C298', TO_DATE('03-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R007', 'M008', 'C272', TO_DATE('04-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R008', 'M149', 'C276', TO_DATE('04-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R009', 'M064', 'C335', TO_DATE('05-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R010', 'M150', 'C248', TO_DATE('05-JAN-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R011', 'M011', 'C311', TO_DATE('05-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R012', 'M110', 'C174', TO_DATE('09-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R013', 'M061', 'C075', TO_DATE('09-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R014', 'M089', 'C109', TO_DATE('09-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R015', 'M131', 'C036', TO_DATE('09-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R016', 'M086', 'C217', TO_DATE('10-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R017', 'M093', 'C064', TO_DATE('10-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R018', 'M077', 'C059', TO_DATE('10-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R019', 'M131', 'C192', TO_DATE('11-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R020', 'M132', 'C275', TO_DATE('11-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R021', 'M066', 'C334', TO_DATE('11-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R022', 'M119', 'C139', TO_DATE('12-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R023', 'M120', 'C196', TO_DATE('12-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R024', 'M113', 'C112', TO_DATE('12-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R025', 'M005', 'C106', TO_DATE('12-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R026', 'M033', 'C177', TO_DATE('12-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R027', 'M069', 'C111', TO_DATE('12-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R028', 'M003', 'C210', TO_DATE('15-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R029', 'M022', 'C212', TO_DATE('15-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R030', 'M125', 'C206', TO_DATE('15-JAN-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R031', 'M080', 'C157', TO_DATE('16-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R032', 'M115', 'C104', TO_DATE('16-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R033', 'M118', 'C321', TO_DATE('17-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R034', 'M032', 'C330', TO_DATE('17-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R035', 'M026', 'C150', TO_DATE('17-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R036', 'M121', 'C163', TO_DATE('19-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R037', 'M018', 'C109', TO_DATE('19-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R038', 'M126', 'C276', TO_DATE('19-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R039', 'M032', 'C042', TO_DATE('22-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R040', 'M035', 'C130', TO_DATE('22-JAN-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R041', 'M035', 'C291', TO_DATE('22-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R042', 'M056', 'C252', TO_DATE('22-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R043', 'M032', 'C154', TO_DATE('22-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R044', 'M114', 'C009', TO_DATE('23-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R045', 'M032', 'C151', TO_DATE('24-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R046', 'M049', 'C135', TO_DATE('24-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R047', 'M007', 'C094', TO_DATE('24-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R048', 'M112', 'C195', TO_DATE('25-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R049', 'M049', 'C155', TO_DATE('25-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R050', 'M109', 'C211', TO_DATE('25-JAN-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R051', 'M034', 'C255', TO_DATE('25-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R052', 'M130', 'C081', TO_DATE('25-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R053', 'M065', 'C312', TO_DATE('25-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R054', 'M039', 'C123', TO_DATE('25-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R055', 'M007', 'C083', TO_DATE('26-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R056', 'M093', 'C246', TO_DATE('26-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R057', 'M130', 'C328', TO_DATE('26-JAN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R058', 'M042', 'C220', TO_DATE('26-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R059', 'M086', 'C042', TO_DATE('30-JAN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R060', 'M001', 'C179', TO_DATE('31-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R061', 'M002', 'C278', TO_DATE('31-JAN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R062', 'M119', 'C315', TO_DATE('01-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R063', 'M133', 'C159', TO_DATE('01-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R064', 'M020', 'C158', TO_DATE('01-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R065', 'M054', 'C232', TO_DATE('02-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R066', 'M086', 'C035', TO_DATE('05-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R067', 'M045', 'C328', TO_DATE('05-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R068', 'M116', 'C178', TO_DATE('05-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R069', 'M090', 'C161', TO_DATE('05-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R070', 'M045', 'C158', TO_DATE('05-FEB-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R071', 'M048', 'C094', TO_DATE('06-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R072', 'M079', 'C120', TO_DATE('06-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R073', 'M020', 'C176', TO_DATE('07-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R074', 'M128', 'C191', TO_DATE('07-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R075', 'M143', 'C347', TO_DATE('07-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R076', 'M063', 'C192', TO_DATE('07-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R077', 'M120', 'C231', TO_DATE('08-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R078', 'M066', 'C340', TO_DATE('08-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R079', 'M122', 'C266', TO_DATE('09-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R080', 'M129', 'C058', TO_DATE('09-FEB-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R081', 'M103', 'C306', TO_DATE('09-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R082', 'M144', 'C008', TO_DATE('09-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R083', 'M041', 'C309', TO_DATE('09-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R084', 'M089', 'C089', TO_DATE('09-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R085', 'M076', 'C211', TO_DATE('12-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R086', 'M051', 'C131', TO_DATE('12-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R087', 'M060', 'C223', TO_DATE('13-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R088', 'M004', 'C335', TO_DATE('13-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R089', 'M097', 'C142', TO_DATE('13-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R090', 'M131', 'C245', TO_DATE('13-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R091', 'M047', 'C316', TO_DATE('13-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R092', 'M003', 'C086', TO_DATE('13-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R093', 'M035', 'C225', TO_DATE('14-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R094', 'M147', 'C015', TO_DATE('14-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R095', 'M017', 'C157', TO_DATE('15-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R096', 'M056', 'C024', TO_DATE('19-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R097', 'M053', 'C328', TO_DATE('19-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R098', 'M060', 'C284', TO_DATE('19-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R099', 'M100', 'C330', TO_DATE('19-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R100', 'M074', 'C065', TO_DATE('20-FEB-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R101', 'M108', 'C027', TO_DATE('20-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R102', 'M113', 'C028', TO_DATE('20-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R103', 'M100', 'C065', TO_DATE('20-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R104', 'M084', 'C334', TO_DATE('20-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R105', 'M106', 'C154', TO_DATE('21-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R106', 'M013', 'C184', TO_DATE('21-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R107', 'M075', 'C147', TO_DATE('22-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R108', 'M021', 'C054', TO_DATE('22-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R109', 'M007', 'C212', TO_DATE('22-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R110', 'M076', 'C037', TO_DATE('23-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R111', 'M101', 'C049', TO_DATE('23-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R112', 'M133', 'C048', TO_DATE('23-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R113', 'M134', 'C115', TO_DATE('23-FEB-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R114', 'M066', 'C314', TO_DATE('26-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R115', 'M143', 'C222', TO_DATE('26-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R116', 'M061', 'C323', TO_DATE('26-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R117', 'M003', 'C292', TO_DATE('26-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R118', 'M059', 'C137', TO_DATE('26-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R119', 'M069', 'C297', TO_DATE('28-FEB-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R120', 'M087', 'C337', TO_DATE('28-FEB-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R121', 'M052', 'C345', TO_DATE('28-FEB-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R122', 'M111', 'C122', TO_DATE('01-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R123', 'M147', 'C198', TO_DATE('01-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R124', 'M011', 'C341', TO_DATE('02-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R125', 'M008', 'C176', TO_DATE('02-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R126', 'M062', 'C001', TO_DATE('03-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R127', 'M102', 'C199', TO_DATE('03-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R128', 'M049', 'C012', TO_DATE('04-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R129', 'M044', 'C157', TO_DATE('04-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R130', 'M057', 'C045', TO_DATE('05-MAR-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R131', 'M144', 'C224', TO_DATE('05-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R132', 'M077', 'C149', TO_DATE('05-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R133', 'M071', 'C112', TO_DATE('06-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R134', 'M074', 'C112', TO_DATE('07-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R135', 'M063', 'C312', TO_DATE('07-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R136', 'M032', 'C334', TO_DATE('07-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R137', 'M050', 'C320', TO_DATE('07-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R138', 'M085', 'C050', TO_DATE('08-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R139', 'M136', 'C185', TO_DATE('08-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R140', 'M146', 'C239', TO_DATE('08-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R141', 'M007', 'C332', TO_DATE('08-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R142', 'M076', 'C112', TO_DATE('08-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R143', 'M048', 'C085', TO_DATE('11-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R144', 'M016', 'C319', TO_DATE('11-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R145', 'M018', 'C315', TO_DATE('11-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R146', 'M065', 'C256', TO_DATE('11-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R147', 'M047', 'C295', TO_DATE('11-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R148', 'M097', 'C025', TO_DATE('11-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R149', 'M026', 'C200', TO_DATE('12-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R150', 'M072', 'C289', TO_DATE('13-MAR-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R151', 'M083', 'C088', TO_DATE('13-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R152', 'M042', 'C251', TO_DATE('13-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R153', 'M006', 'C246', TO_DATE('14-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R154', 'M016', 'C055', TO_DATE('14-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R155', 'M086', 'C093', TO_DATE('15-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R156', 'M143', 'C128', TO_DATE('15-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R157', 'M033', 'C181', TO_DATE('15-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R158', 'M005', 'C183', TO_DATE('15-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R159', 'M054', 'C139', TO_DATE('18-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R160', 'M014', 'C088', TO_DATE('19-MAR-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R161', 'M120', 'C038', TO_DATE('19-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R162', 'M088', 'C133', TO_DATE('19-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R163', 'M010', 'C268', TO_DATE('20-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R164', 'M046', 'C119', TO_DATE('20-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R165', 'M023', 'C205', TO_DATE('20-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R166', 'M052', 'C220', TO_DATE('20-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R167', 'M112', 'C174', TO_DATE('20-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R168', 'M079', 'C143', TO_DATE('20-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R169', 'M028', 'C151', TO_DATE('22-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R170', 'M026', 'C013', TO_DATE('22-MAR-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R171', 'M128', 'C105', TO_DATE('22-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R172', 'M020', 'C261', TO_DATE('25-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R173', 'M028', 'C227', TO_DATE('26-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R174', 'M079', 'C213', TO_DATE('26-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R175', 'M135', 'C127', TO_DATE('27-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R176', 'M147', 'C014', TO_DATE('27-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R177', 'M028', 'C128', TO_DATE('27-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R178', 'M040', 'C167', TO_DATE('27-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R179', 'M085', 'C347', TO_DATE('28-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R180', 'M058', 'C237', TO_DATE('28-MAR-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R181', 'M056', 'C170', TO_DATE('28-MAR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R182', 'M005', 'C046', TO_DATE('29-MAR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R183', 'M136', 'C114', TO_DATE('29-MAR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R184', 'M047', 'C266', TO_DATE('01-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R185', 'M052', 'C175', TO_DATE('01-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R186', 'M110', 'C035', TO_DATE('01-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R187', 'M142', 'C336', TO_DATE('01-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R188', 'M055', 'C191', TO_DATE('03-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R189', 'M012', 'C047', TO_DATE('04-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R190', 'M124', 'C332', TO_DATE('05-APR-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R191', 'M003', 'C065', TO_DATE('05-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R192', 'M091', 'C099', TO_DATE('08-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R193', 'M034', 'C090', TO_DATE('08-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R194', 'M148', 'C241', TO_DATE('08-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R195', 'M108', 'C090', TO_DATE('09-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R196', 'M043', 'C174', TO_DATE('09-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R197', 'M118', 'C264', TO_DATE('09-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R198', 'M005', 'C077', TO_DATE('10-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R199', 'M028', 'C167', TO_DATE('10-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R200', 'M011', 'C206', TO_DATE('10-APR-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R201', 'M003', 'C288', TO_DATE('10-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R202', 'M084', 'C010', TO_DATE('11-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R203', 'M097', 'C111', TO_DATE('11-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R204', 'M053', 'C294', TO_DATE('11-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R205', 'M047', 'C105', TO_DATE('11-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R206', 'M086', 'C299', TO_DATE('11-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R207', 'M142', 'C186', TO_DATE('11-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R208', 'M062', 'C028', TO_DATE('12-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R209', 'M116', 'C229', TO_DATE('12-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R210', 'M086', 'C158', TO_DATE('15-APR-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R211', 'M048', 'C138', TO_DATE('15-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R212', 'M104', 'C251', TO_DATE('15-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R213', 'M115', 'C318', TO_DATE('15-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R214', 'M104', 'C214', TO_DATE('16-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R215', 'M072', 'C276', TO_DATE('17-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R216', 'M049', 'C197', TO_DATE('17-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R217', 'M069', 'C233', TO_DATE('17-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R218', 'M087', 'C329', TO_DATE('17-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R219', 'M136', 'C240', TO_DATE('18-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R220', 'M032', 'C203', TO_DATE('18-APR-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R221', 'M074', 'C057', TO_DATE('18-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R222', 'M117', 'C105', TO_DATE('18-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R223', 'M112', 'C230', TO_DATE('18-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R224', 'M112', 'C215', TO_DATE('19-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R225', 'M016', 'C048', TO_DATE('19-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R226', 'M065', 'C118', TO_DATE('19-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R227', 'M104', 'C244', TO_DATE('22-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R228', 'M085', 'C212', TO_DATE('22-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R229', 'M040', 'C184', TO_DATE('22-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R230', 'M016', 'C057', TO_DATE('22-APR-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R231', 'M010', 'C199', TO_DATE('23-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R232', 'M040', 'C172', TO_DATE('23-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R233', 'M118', 'C167', TO_DATE('24-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R234', 'M144', 'C166', TO_DATE('24-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R235', 'M081', 'C174', TO_DATE('24-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R236', 'M124', 'C293', TO_DATE('25-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R237', 'M109', 'C290', TO_DATE('25-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R238', 'M016', 'C253', TO_DATE('25-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R239', 'M032', 'C079', TO_DATE('25-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R240', 'M118', 'C135', TO_DATE('26-APR-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R241', 'M065', 'C114', TO_DATE('26-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R242', 'M011', 'C022', TO_DATE('26-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R243', 'M017', 'C204', TO_DATE('26-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R244', 'M066', 'C080', TO_DATE('29-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R245', 'M072', 'C126', TO_DATE('29-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R246', 'M114', 'C303', TO_DATE('29-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R247', 'M040', 'C238', TO_DATE('29-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R248', 'M100', 'C039', TO_DATE('29-APR-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R249', 'M147', 'C118', TO_DATE('30-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R250', 'M124', 'C344', TO_DATE('30-APR-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R251', 'M032', 'C271', TO_DATE('30-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R252', 'M149', 'C022', TO_DATE('30-APR-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R253', 'M122', 'C328', TO_DATE('30-APR-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R254', 'M115', 'C065', TO_DATE('02-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R255', 'M097', 'C193', TO_DATE('02-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R256', 'M125', 'C246', TO_DATE('02-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R257', 'M055', 'C206', TO_DATE('02-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R258', 'M018', 'C263', TO_DATE('02-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R259', 'M080', 'C281', TO_DATE('03-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R260', 'M149', 'C078', TO_DATE('06-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R261', 'M070', 'C202', TO_DATE('06-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R262', 'M114', 'C295', TO_DATE('06-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R263', 'M125', 'C266', TO_DATE('06-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R264', 'M006', 'C084', TO_DATE('07-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R265', 'M055', 'C261', TO_DATE('07-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R266', 'M094', 'C263', TO_DATE('07-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R267', 'M099', 'C294', TO_DATE('07-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R268', 'M057', 'C134', TO_DATE('07-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R269', 'M075', 'C333', TO_DATE('07-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R270', 'M037', 'C082', TO_DATE('09-MAY-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R271', 'M116', 'C236', TO_DATE('09-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R272', 'M073', 'C118', TO_DATE('09-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R273', 'M100', 'C105', TO_DATE('10-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R274', 'M087', 'C019', TO_DATE('13-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R275', 'M008', 'C326', TO_DATE('14-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R276', 'M045', 'C142', TO_DATE('15-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R277', 'M129', 'C020', TO_DATE('15-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R278', 'M078', 'C347', TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R279', 'M051', 'C160', TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R280', 'M041', 'C212', TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R281', 'M075', 'C203', TO_DATE('20-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R282', 'M143', 'C159', TO_DATE('21-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R283', 'M001', 'C050', TO_DATE('21-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R284', 'M102', 'C210', TO_DATE('21-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R285', 'M123', 'C077', TO_DATE('22-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R286', 'M087', 'C260', TO_DATE('23-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R287', 'M055', 'C137', TO_DATE('23-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R288', 'M125', 'C031', TO_DATE('23-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R289', 'M096', 'C163', TO_DATE('23-MAY-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R290', 'M116', 'C161', TO_DATE('27-MAY-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R291', 'M097', 'C025', TO_DATE('29-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R292', 'M033', 'C338', TO_DATE('31-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R293', 'M097', 'C185', TO_DATE('31-MAY-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R294', 'M053', 'C096', TO_DATE('31-MAY-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R295', 'M047', 'C317', TO_DATE('03-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R296', 'M030', 'C318', TO_DATE('03-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R297', 'M130', 'C060', TO_DATE('04-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R298', 'M021', 'C098', TO_DATE('04-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R299', 'M115', 'C228', TO_DATE('05-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R300', 'M097', 'C346', TO_DATE('05-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R301', 'M143', 'C256', TO_DATE('05-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R302', 'M089', 'C310', TO_DATE('05-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R303', 'M116', 'C005', TO_DATE('05-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R304', 'M042', 'C170', TO_DATE('06-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R305', 'M073', 'C248', TO_DATE('06-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R306', 'M107', 'C200', TO_DATE('07-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R307', 'M090', 'C143', TO_DATE('11-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R308', 'M087', 'C289', TO_DATE('11-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R309', 'M021', 'C129', TO_DATE('11-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R310', 'M100', 'C034', TO_DATE('11-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R311', 'M034', 'C001', TO_DATE('12-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R312', 'M007', 'C214', TO_DATE('12-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R313', 'M006', 'C101', TO_DATE('12-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R314', 'M139', 'C019', TO_DATE('12-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R315', 'M090', 'C069', TO_DATE('12-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R316', 'M071', 'C284', TO_DATE('13-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R317', 'M013', 'C179', TO_DATE('14-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R318', 'M122', 'C301', TO_DATE('14-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R319', 'M047', 'C290', TO_DATE('14-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R320', 'M037', 'C240', TO_DATE('14-JUN-2024', 'DD-MON-YYYY'), 'Pending');

INSERT INTO Reservation VALUES ('R321', 'M131', 'C036', TO_DATE('14-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R322', 'M051', 'C210', TO_DATE('14-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R323', 'M130', 'C326', TO_DATE('17-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R324', 'M005', 'C241', TO_DATE('17-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R325', 'M030', 'C107', TO_DATE('17-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R326', 'M135', 'C175', TO_DATE('17-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R327', 'M005', 'C119', TO_DATE('18-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R328', 'M139', 'C029', TO_DATE('19-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R329', 'M144', 'C039', TO_DATE('19-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R330', 'M030', 'C067', TO_DATE('19-JUN-2024', 'DD-MON-YYYY'), 'Available');

INSERT INTO Reservation VALUES ('R331', 'M009', 'C190', TO_DATE('19-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R332', 'M052', 'C212', TO_DATE('20-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R333', 'M125', 'C082', TO_DATE('20-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R334', 'M037', 'C281', TO_DATE('20-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R335', 'M115', 'C144', TO_DATE('21-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R336', 'M009', 'C075', TO_DATE('21-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R337', 'M067', 'C006', TO_DATE('21-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R338', 'M064', 'C007', TO_DATE('21-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R339', 'M094', 'C243', TO_DATE('21-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R340', 'M131', 'C274', TO_DATE('24-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');

INSERT INTO Reservation VALUES ('R341', 'M086', 'C104', TO_DATE('24-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R342', 'M042', 'C037', TO_DATE('25-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R343', 'M012', 'C258', TO_DATE('26-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R344', 'M119', 'C218', TO_DATE('26-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R345', 'M095', 'C002', TO_DATE('28-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R346', 'M108', 'C258', TO_DATE('28-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R347', 'M045', 'C002', TO_DATE('28-JUN-2024', 'DD-MON-YYYY'), 'Cancelled');
INSERT INTO Reservation VALUES ('R348', 'M122', 'C258', TO_DATE('28-JUN-2024', 'DD-MON-YYYY'), 'Pending');
INSERT INTO Reservation VALUES ('R349', 'M001', 'C002', TO_DATE('28-JUN-2024', 'DD-MON-YYYY'), 'Available');
INSERT INTO Reservation VALUES ('R350', 'M109', 'C258', TO_DATE('28-JUN-2024', 'DD-MON-YYYY'), 'Available');

COMMIT;