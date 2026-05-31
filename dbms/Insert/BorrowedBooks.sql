/*
CREATE TABLE BorrowedBooks (
    borrowId VARCHAR2(5) NOT NULL,
    memberId VARCHAR2(4) NOT NULL,
    copyId VARCHAR2(4) NOT NULL,
    borrowDate DATE NOT NULL,
    dueDate DATE NOT NULL,
    returnDate DATE,
    returnStatus VARCHAR2(10) DEFAULT 'On loan' NOT NULL CHECK (
        returnStatus IN ('On loan', 'Returned', 'Overdue', 'Lost')
    ),
    extendStatus VARCHAR2(20) DEFAULT 'Unsubmitted' CHECK (
        extendStatus IN ('Unsubmitted', 'Pending', 'Approved', 'Rejected', 'Canceled')
    ),
    CONSTRAINT pk_BorrowedBooks PRIMARY KEY (borrowId),
    CONSTRAINT fk_BorrowedBooks_Members FOREIGN KEY (memberId) REFERENCES Members(memberId) ON DELETE CASCADE,
    CONSTRAINT fk_BorrowedBooks_BookCopies FOREIGN KEY (copyId) REFERENCES BookCopies(copyId) ON DELETE CASCADE
);
*/

INSERT INTO BorrowedBooks VALUES ('BB001', 'M001', 'C043', TO_DATE('02-Jan-2024', 'DD-MON-YYYY'), TO_DATE('12-Jan-2024', 'DD-MON-YYYY'), TO_DATE('10-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB002', 'M002', 'C333', TO_DATE('02-Jan-2024', 'DD-MON-YYYY'), TO_DATE('12-Jan-2024', 'DD-MON-YYYY'), TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB003', 'M002', 'C237', TO_DATE('03-Jan-2024', 'DD-MON-YYYY'), TO_DATE('13-Jan-2024', 'DD-MON-YYYY'), TO_DATE('09-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB004', 'M004', 'C322', TO_DATE('03-Jan-2024', 'DD-MON-YYYY'), TO_DATE('20-Jan-2024', 'DD-MON-YYYY'), TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB005', 'M006', 'C106', TO_DATE('03-Jan-2024', 'DD-MON-YYYY'), TO_DATE('20-Jan-2024', 'DD-MON-YYYY'), TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB006', 'M007', 'C144', TO_DATE('04-Jan-2024', 'DD-MON-YYYY'), TO_DATE('14-Jan-2024', 'DD-MON-YYYY'), TO_DATE('12-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB007', 'M008', 'C272', TO_DATE('05-Jan-2024', 'DD-MON-YYYY'), TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB008', 'M009', 'C342', TO_DATE('05-Jan-2024', 'DD-MON-YYYY'), TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB009', 'M010', 'C069', TO_DATE('05-Jan-2024', 'DD-MON-YYYY'), TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB010', 'M011', 'C143', TO_DATE('05-Jan-2024', 'DD-MON-YYYY'), TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB011', 'M011', 'C311', TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB012', 'M013', 'C079', TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB013', 'M014', 'C189', TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), TO_DATE('16-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB014', 'M001', 'C311', TO_DATE('09-Jan-2024', 'DD-MON-YYYY'), TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB015', 'M015', 'C062', TO_DATE('11-Jan-2024', 'DD-MON-YYYY'), TO_DATE('28-Jan-2024', 'DD-MON-YYYY'), TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB016', 'M016', 'C164', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB017', 'M017', 'C011', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB018', 'M010', 'C268', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB019', 'M015', 'C067', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), TO_DATE('01-Feb-2024', 'DD-MON-YYYY'), TO_DATE('27-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB020', 'M018', 'C102', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB021', 'M019', 'C125', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB022', 'M022', 'C212', TO_DATE('16-Jan-2024', 'DD-MON-YYYY'), TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), TO_DATE('28-Jan-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB023', 'M023', 'C148', TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), TO_DATE('27-Jan-2024', 'DD-MON-YYYY'), TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB024', 'M024', 'C263', TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), TO_DATE('27-Jan-2024', 'DD-MON-YYYY'), TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB025', 'M025', 'C197', TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), TO_DATE('27-Jan-2024', 'DD-MON-YYYY'), TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB026', 'M026', 'C150', TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), TO_DATE('28-Jan-2024', 'DD-MON-YYYY'), TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB027', 'M027', 'C065', TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), TO_DATE('28-Jan-2024', 'DD-MON-YYYY'), TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB028', 'M028', 'C325', TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB029', 'M029', 'C208', TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB030', 'M030', 'C329', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB031', 'M031', 'C165', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), TO_DATE('03-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB032', 'M032', 'C059', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), TO_DATE('07-Feb-2024', 'DD-MON-YYYY'), TO_DATE('30-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB033', 'M032', 'C042', TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB034', 'M035', 'C291', TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB035', 'M035', 'C130', TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB036', 'M036', 'C051', TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), TO_DATE('10-Feb-2024', 'DD-MON-YYYY'), TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB037', 'M037', 'C015', TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), TO_DATE('11-Feb-2024', 'DD-MON-YYYY'), TO_DATE('07-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB038', 'M038', 'C240', TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), TO_DATE('04-Feb-2024', 'DD-MON-YYYY'), TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB039', 'M040', 'C253', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB040', 'M041', 'C130', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB041', 'M042', 'C230', TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB042', 'M043', 'C176', TO_DATE('30-Jan-2024', 'DD-MON-YYYY'), TO_DATE('09-Feb-2024', 'DD-MON-YYYY'), TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB043', 'M041', 'C179', TO_DATE('31-Jan-2024', 'DD-MON-YYYY'), TO_DATE('17-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB044', 'M002', 'C278', TO_DATE('01-Feb-2024', 'DD-MON-YYYY'), TO_DATE('18-Feb-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB045', 'M028', 'C124', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB046', 'M043', 'C240', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB047', 'M032', 'C194', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB048', 'M044', 'C171', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB049', 'M021', 'C219', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB050', 'M009', 'C088', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB051', 'M011', 'C242', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB052', 'M011', 'C019', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB053', 'M011', 'C087', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB054', 'M011', 'C232', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB055', 'M045', 'C328', TO_DATE('06-Feb-2024', 'DD-MON-YYYY'), TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB056', 'M046', 'C177', TO_DATE('06-Feb-2024', 'DD-MON-YYYY'), TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB057', 'M003', 'C264', TO_DATE('07-Feb-2024', 'DD-MON-YYYY'), TO_DATE('17-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB058', 'M020', 'C176', TO_DATE('08-Feb-2024', 'DD-MON-YYYY'), TO_DATE('18-Feb-2024', 'DD-MON-YYYY'), TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB059', 'M047', 'C250', TO_DATE('08-Feb-2024', 'DD-MON-YYYY'), TO_DATE('25-Feb-2024', 'DD-MON-YYYY'), TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB060', 'M048', 'C093', TO_DATE('09-Feb-2024', 'DD-MON-YYYY'), TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Canceled');

INSERT INTO BorrowedBooks VALUES ('BB061', 'M049', 'C175', TO_DATE('09-Feb-2024', 'DD-MON-YYYY'), TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB062', 'M049', 'C048', TO_DATE('09-Feb-2024', 'DD-MON-YYYY'), TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB063', 'M050', 'C105', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), TO_DATE('22-Feb-2024', 'DD-MON-YYYY'), TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB064', 'M051', 'C098', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), TO_DATE('22-Feb-2024', 'DD-MON-YYYY'), TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB065', 'M052', 'C337', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), TO_DATE('22-Feb-2024', 'DD-MON-YYYY'), TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB066', 'M053', 'C032', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), TO_DATE('22-Feb-2024', 'DD-MON-YYYY'), TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB067', 'M054', 'C230', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), TO_DATE('22-Feb-2024', 'DD-MON-YYYY'), TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB068', 'M055', 'C014', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), TO_DATE('22-Feb-2024', 'DD-MON-YYYY'), TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB069', 'M056', 'C256', TO_DATE('13-Feb-2024', 'DD-MON-YYYY'), TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), TO_DATE('06-May-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB070', 'M001', 'C116', TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), TO_DATE('24-Feb-2024', 'DD-MON-YYYY'), TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB071', 'M027', 'C233', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), TO_DATE('25-Feb-2024', 'DD-MON-YYYY'), TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB072', 'M057', 'C281', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), TO_DATE('03-Mar-2024', 'DD-MON-YYYY'), TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB073', 'M058', 'C208', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB074', 'M030', 'C007', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB075', 'M017', 'C157', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB076', 'M059', 'C115', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB077', 'M059', 'C327', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB078', 'M059', 'C295', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB079', 'M060', 'C227', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB080', 'M045', 'C047', TO_DATE('20-Feb-2024', 'DD-MON-YYYY'), TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');

INSERT INTO BorrowedBooks VALUES ('BB081', 'M056', 'C024', TO_DATE('20-Feb-2024', 'DD-MON-YYYY'), TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB082', 'M042', 'C211', TO_DATE('21-Feb-2024', 'DD-MON-YYYY'), TO_DATE('09-Mar-2024', 'DD-MON-YYYY'), TO_DATE('31-Mar-2024', 'DD-MON-YYYY'), 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB083', 'M060', 'C284', TO_DATE('21-Feb-2024', 'DD-MON-YYYY'), TO_DATE('02-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB084', 'M053', 'C030', TO_DATE('22-Feb-2024', 'DD-MON-YYYY'), TO_DATE('10-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB085', 'M018', 'C154', TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB086', 'M051', 'C019', TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB087', 'M051', 'C305', TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB088', 'M020', 'C056', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB089', 'M062', 'C014', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB090', 'M061', 'C098', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Canceled');

INSERT INTO BorrowedBooks VALUES ('BB091', 'M061', 'C323', TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB092', 'M061', 'C335', TO_DATE('28-Feb-2024', 'DD-MON-YYYY'), TO_DATE('09-Mar-2024', 'DD-MON-YYYY'), TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB093', 'M062', 'C306', TO_DATE('28-Feb-2024', 'DD-MON-YYYY'), TO_DATE('09-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB094', 'M063', 'C151', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), TO_DATE('10-Mar-2024', 'DD-MON-YYYY'), TO_DATE('13-Feb-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB095', 'M063', 'C020', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), TO_DATE('17-Mar-2024', 'DD-MON-YYYY'), TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB096', 'M064', 'C099', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), TO_DATE('10-Mar-2024', 'DD-MON-YYYY'), TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB097', 'M038', 'C042', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB098', 'M001', 'C327', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB099', 'M063', 'C314', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB100', 'M026', 'C144', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');

INSERT INTO BorrowedBooks VALUES ('BB101', 'M065', 'C001', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB102', 'M037', 'C120', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB103', 'M047', 'C019', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB104', 'M049', 'C012', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), TO_DATE('13-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB105', 'M011', 'C152', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB106', 'M036', 'C002', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), TO_DATE('22-Mar-2024', 'DD-MON-YYYY'), TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB107', 'M048', 'C075', TO_DATE('06-Mar-2024', 'DD-MON-YYYY'), TO_DATE('16-Mar-2024', 'DD-MON-YYYY'), TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB108', 'M057', 'C045', TO_DATE('06-Mar-2024', 'DD-MON-YYYY'), TO_DATE('16-Mar-2024', 'DD-MON-YYYY'), TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB109', 'M038', 'C300', TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), TO_DATE('17-Mar-2024', 'DD-MON-YYYY'), TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB110', 'M077', 'C149', TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), TO_DATE('17-Mar-2024', 'DD-MON-YYYY'), TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB111', 'M016', 'C146', TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB112', 'M073', 'C223', TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), TO_DATE('24-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB113', 'M024', 'C089', TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB114', 'M058', 'C004', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB115', 'M013', 'C259', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB116', 'M003', 'C172', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), TO_DATE('19-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB117', 'M068', 'C093', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB118', 'M065', 'C256', TO_DATE('12-Mar-2024', 'DD-MON-YYYY'), TO_DATE('22-Mar-2024', 'DD-MON-YYYY'), TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB119', 'M013', 'C028', TO_DATE('13-Mar-2024', 'DD-MON-YYYY'), TO_DATE('23-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB120', 'M076', 'C283', TO_DATE('13-Mar-2024', 'DD-MON-YYYY'), TO_DATE('23-Mar-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB121', 'M072', 'C289', TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), TO_DATE('24-Mar-2024', 'DD-MON-YYYY'), TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB122', 'M071', 'C094', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB123', 'M078', 'C084', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB124', 'M018', 'C217', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB125', 'M027', 'C222', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB126', 'M083', 'C244', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB127', 'M009', 'C169', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB128', 'M065', 'C102', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), TO_DATE('18-May-2024', 'DD-MON-YYYY'), 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB129', 'M019', 'C080', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB130', 'M048', 'C038', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');

INSERT INTO BorrowedBooks VALUES ('BB131', 'M014', 'C088', TO_DATE('19-Mar-2024', 'DD-MON-YYYY'), TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB132', 'M044', 'C211', TO_DATE('20-Mar-2024', 'DD-MON-YYYY'), TO_DATE('30-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB133', 'M013', 'C322', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), TO_DATE('31-Mar-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Pending');
INSERT INTO BorrowedBooks VALUES ('BB134', 'M037', 'C191', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), TO_DATE('07-Apr-2024', 'DD-MON-YYYY'), TO_DATE('18-May-2024', 'DD-MON-YYYY'), 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB135', 'M079', 'C337', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), TO_DATE('31-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB136', 'M046', 'C119', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), TO_DATE('31-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB137', 'M080', 'C331', TO_DATE('22-Mar-2024', 'DD-MON-YYYY'), TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB138', 'M025', 'C228', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB139', 'M026', 'C039', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), NULL, 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB140', 'M020', 'C042', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');

INSERT INTO BorrowedBooks VALUES ('BB141', 'M027', 'C018', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), NULL, 'Lost','Canceled');
INSERT INTO BorrowedBooks VALUES ('BB142', 'M020', 'C261', TO_DATE('26-Mar-2024', 'DD-MON-YYYY'), TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB143', 'M068', 'C341', TO_DATE('26-Mar-2024', 'DD-MON-YYYY'), TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB144', 'M025', 'C205', TO_DATE('26-Mar-2024', 'DD-MON-YYYY'), TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB145', 'M022', 'C235', TO_DATE('27-Mar-2024', 'DD-MON-YYYY'), TO_DATE('06-Apr-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB146', 'M028', 'C128', TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), TO_DATE('07-Apr-2024', 'DD-MON-YYYY'), TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB147', 'M084', 'C001', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), TO_DATE('07-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB148', 'M001', 'C237', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB149', 'M085', 'C347', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB150', 'M071', 'C196', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB151', 'M035', 'C156', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB152', 'M029', 'C283', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB153', 'M022', 'C189', TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB154', 'M071', 'C328', TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), TO_DATE('21-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB155', 'M034', 'C290', TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), TO_DATE('21-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB156', 'M056', 'C025', TO_DATE('03-Apr-2024', 'DD-MON-YYYY'), TO_DATE('13-Apr-2024', 'DD-MON-YYYY'), TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB157', 'M028', 'C164', TO_DATE('03-Apr-2024', 'DD-MON-YYYY'), TO_DATE('13-Apr-2024', 'DD-MON-YYYY'), TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB158', 'M067', 'C129', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB159', 'M124', 'C332', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB160', 'M042', 'C230', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');

INSERT INTO BorrowedBooks VALUES ('BB161', 'M044', 'C298', TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB162', 'M094', 'C105', TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB163', 'M067', 'C059', TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB164', 'M034', 'C090', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB165', 'M004', 'C089', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB166', 'M085', 'C182', TO_DATE('10-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Apr-2024', 'DD-MON-YYYY'), TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB167', 'M043', 'C174', TO_DATE('10-Apr-2024', 'DD-MON-YYYY'), TO_DATE('20-Apr-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB168', 'M081', 'C132', TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), TO_DATE('21-Apr-2024', 'DD-MON-YYYY'), TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB169', 'M090', 'C001', TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), TO_DATE('21-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB170', 'M097', 'C111', TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB171', 'M098', 'C057', TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), TO_DATE('21-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB172', 'M047', 'C105', TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB173', 'M064', 'C138', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB174', 'M100', 'C002', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB175', 'M066', 'C075', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB176', 'M104', 'C251', TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB177', 'M104', 'C214', TO_DATE('17-Apr-2024', 'DD-MON-YYYY'), TO_DATE('27-Apr-2024', 'DD-MON-YYYY'), TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB178', 'M064', 'C091', TO_DATE('17-Apr-2024', 'DD-MON-YYYY'), TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('07-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB179', 'M101', 'C280', TO_DATE('17-Apr-2024', 'DD-MON-YYYY'), TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB180', 'M004', 'C219', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB181', 'M057', 'C254', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB182', 'M063', 'C034', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB183', 'M055', 'C339', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB184', 'M058', 'C025', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB185', 'M074', 'C057', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB186', 'M029', 'C173', TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), TO_DATE('02-May-2024', 'DD-MON-YYYY'), TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB187', 'M104', 'C108', TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), TO_DATE('02-May-2024', 'DD-MON-YYYY'), TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB188', 'M055', 'C183', TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), TO_DATE('09-May-2024', 'DD-MON-YYYY'), TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB189', 'M032', 'C032', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), TO_DATE('10-May-2024', 'DD-MON-YYYY'), TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB190', 'M104', 'C244', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), TO_DATE('03-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB191', 'M100', 'C248', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), TO_DATE('03-May-2024', 'DD-MON-YYYY'), TO_DATE('06-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB192', 'M040', 'C172', TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB193', 'M103', 'C302', TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), TO_DATE('11-May-2024', 'DD-MON-YYYY'), TO_DATE('09-May-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB194', 'M027', 'C244', TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), TO_DATE('05-May-2024', 'DD-MON-YYYY'), TO_DATE('07-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB195', 'M050', 'C348', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB196', 'M032', 'C230', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB197', 'M100', 'C089', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB198', 'M070', 'C225', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), TO_DATE('09-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB199', 'M109', 'C281', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB200', 'M101', 'C142', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), TO_DATE('14-May-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');

INSERT INTO BorrowedBooks VALUES ('BB201', 'M107', 'C248', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), TO_DATE('09-May-2024', 'DD-MON-YYYY'), TO_DATE('07-May-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB202', 'M069', 'C044', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), TO_DATE('10-May-2024', 'DD-MON-YYYY'), TO_DATE('14-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB203', 'M040', 'C238', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), TO_DATE('10-May-2024', 'DD-MON-YYYY'), TO_DATE('09-May-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB204', 'M053', 'C098', TO_DATE('01-May-2024', 'DD-MON-YYYY'), TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB205', 'M080', 'C341', TO_DATE('02-May-2024', 'DD-MON-YYYY'), TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB206', 'M070', 'C301', TO_DATE('02-May-2024', 'DD-MON-YYYY'), TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB207', 'M018', 'C263', TO_DATE('03-May-2024', 'DD-MON-YYYY'), TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB208', 'M039', 'C152', TO_DATE('03-May-2024', 'DD-MON-YYYY'), TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('15-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB209', 'M025', 'C099', TO_DATE('03-May-2024', 'DD-MON-YYYY'), TO_DATE('20-May-2024', 'DD-MON-YYYY'), TO_DATE('24-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB210', 'M102', 'C120', TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), TO_DATE('13-May-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB211', 'M076', 'C155', TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB212', 'M112', 'C222', TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB213', 'M035', 'C145', TO_DATE('06-May-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), TO_DATE('15-May-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB214', 'M102', 'C236', TO_DATE('07-May-2024', 'DD-MON-YYYY'), TO_DATE('17-May-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB215', 'M107', 'C136', TO_DATE('07-May-2024', 'DD-MON-YYYY'), TO_DATE('17-May-2024', 'DD-MON-YYYY'), TO_DATE('20-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB216', 'M006', 'C084', TO_DATE('08-May-2024', 'DD-MON-YYYY'), TO_DATE('18-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB217', 'M107', 'C299', TO_DATE('09-May-2024', 'DD-MON-YYYY'), TO_DATE('19-May-2024', 'DD-MON-YYYY'), TO_DATE('20-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB218', 'M101', 'C086', TO_DATE('10-May-2024', 'DD-MON-YYYY'), TO_DATE('27-May-2024', 'DD-MON-YYYY'), TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB219', 'M080', 'C330', TO_DATE('10-May-2024', 'DD-MON-YYYY'), TO_DATE('27-May-2024', 'DD-MON-YYYY'), TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB220', 'M116', 'C236', TO_DATE('10-May-2024', 'DD-MON-YYYY'), TO_DATE('20-May-2024', 'DD-MON-YYYY'), TO_DATE('21-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB221', 'M058', 'C213', TO_DATE('10-May-2024', 'DD-MON-YYYY'), TO_DATE('20-May-2024', 'DD-MON-YYYY'), TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB222', 'M107', 'C268', TO_DATE('10-May-2024', 'DD-MON-YYYY'), TO_DATE('20-May-2024', 'DD-MON-YYYY'), TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB223', 'M106', 'C008', TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('23-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB224', 'M079', 'C249', TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('30-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB225', 'M103', 'C013', TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('30-May-2024', 'DD-MON-YYYY'), TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB226', 'M010', 'C258', TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('23-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB227', 'M109', 'C250', TO_DATE('13-May-2024', 'DD-MON-YYYY'), TO_DATE('30-May-2024', 'DD-MON-YYYY'), TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB228', 'M087', 'C019', TO_DATE('14-May-2024', 'DD-MON-YYYY'), TO_DATE('24-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB229', 'M100', 'C032', TO_DATE('15-May-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB230', 'M045', 'C142', TO_DATE('16-May-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');

INSERT INTO BorrowedBooks VALUES ('BB231', 'M059', 'C268', TO_DATE('17-May-2024', 'DD-MON-YYYY'), TO_DATE('27-May-2024', 'DD-MON-YYYY'), TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB232', 'M092', 'C121', TO_DATE('17-May-2024', 'DD-MON-YYYY'), TO_DATE('27-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB233', 'M015', 'C067', TO_DATE('17-May-2024', 'DD-MON-YYYY'), TO_DATE('27-May-2024', 'DD-MON-YYYY'), TO_DATE('23-May-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB234', 'M092', 'C286', TO_DATE('17-May-2024', 'DD-MON-YYYY'), TO_DATE('27-May-2024', 'DD-MON-YYYY'), TO_DATE('22-May-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB235', 'M070', 'C187', TO_DATE('20-May-2024', 'DD-MON-YYYY'), TO_DATE('30-May-2024', 'DD-MON-YYYY'), TO_DATE('29-May-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB236', 'M051', 'C017', TO_DATE('20-May-2024', 'DD-MON-YYYY'), TO_DATE('30-May-2024', 'DD-MON-YYYY'), TO_DATE('29-May-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB237', 'M123', 'C222', TO_DATE('20-May-2024', 'DD-MON-YYYY'), TO_DATE('30-May-2024', 'DD-MON-YYYY'), TO_DATE('29-May-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB238', 'M121', 'C081', TO_DATE('20-May-2024', 'DD-MON-YYYY'), TO_DATE('30-May-2024', 'DD-MON-YYYY'), TO_DATE('29-May-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB239', 'M076', 'C173', TO_DATE('21-May-2024', 'DD-MON-YYYY'), TO_DATE('31-May-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB240', 'M075', 'C203', TO_DATE('21-May-2024', 'DD-MON-YYYY'), TO_DATE('31-May-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB241', 'M125', 'C314', TO_DATE('22-May-2024', 'DD-MON-YYYY'), TO_DATE('08-Jun-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB242', 'M030', 'C262', TO_DATE('22-May-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB243', 'M075', 'C134', TO_DATE('23-May-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB244', 'M123', 'C077', TO_DATE('23-May-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB245', 'M069', 'C003', TO_DATE('23-May-2024', 'DD-MON-YYYY'), TO_DATE('09-Jun-2024', 'DD-MON-YYYY'), TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB246', 'M120', 'C291', TO_DATE('24-May-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('30-May-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB247', 'M063', 'C044', TO_DATE('24-May-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB248', 'M125', 'C031', TO_DATE('24-May-2024', 'DD-MON-YYYY'), TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB249', 'M125', 'C322', TO_DATE('27-May-2024', 'DD-MON-YYYY'), TO_DATE('06-Jun-2024', 'DD-MON-YYYY'), TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB250', 'M114', 'C026', TO_DATE('27-May-2024', 'DD-MON-YYYY'), TO_DATE('06-Jun-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB251', 'M084', 'C325', TO_DATE('27-May-2024', 'DD-MON-YYYY'), TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB252', 'M043', 'C299', TO_DATE('27-May-2024', 'DD-MON-YYYY'), TO_DATE('06-Jun-2024', 'DD-MON-YYYY'), TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB253', 'M124', 'C163', TO_DATE('28-May-2024', 'DD-MON-YYYY'), TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), TO_DATE('06-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB254', 'M051', 'C075', TO_DATE('29-May-2024', 'DD-MON-YYYY'), TO_DATE('08-Jun-2024', 'DD-MON-YYYY'), TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB255', 'M097', 'C025', TO_DATE('30-May-2024', 'DD-MON-YYYY'), TO_DATE('16-Jun-2024', 'DD-MON-YYYY'), TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB256', 'M109', 'C050', TO_DATE('31-May-2024', 'DD-MON-YYYY'), TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB257', 'M121', 'C002', TO_DATE('31-May-2024', 'DD-MON-YYYY'), TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB258', 'M034', 'C001', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB259', 'M123', 'C095', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB260', 'M100', 'C191', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('23-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB261', 'M034', 'C333', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB262', 'M074', 'C203', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'),'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB263', 'M035', 'C170', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), TO_DATE('19-Jun-2024', 'DD-MON-YYYY'),'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB264', 'M098', 'C065', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB265', 'M045', 'C262', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'),'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB266', 'M122', 'C042', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), NULL, 'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB267', 'M131', 'C147', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), TO_DATE('12-Jun-2024', 'DD-MON-YYYY'),'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB268', 'M132', 'C272', TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), TO_DATE('13-Jun-2024', 'DD-MON-YYYY'),'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB269', 'M132', 'C129', TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), TO_DATE('13-Jun-2024', 'DD-MON-YYYY'),'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB270', 'M085', 'C158', TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB271', 'M100', 'C231', TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB272', 'M043', 'C284', TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), TO_DATE('22-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'),'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB273', 'M130', 'C060', TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), TO_DATE('15-Jun-2024', 'DD-MON-YYYY'), TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB274', 'M060', 'C215', TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), TO_DATE('15-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB275', 'M056', 'C297', TO_DATE('06-Jun-2024', 'DD-MON-YYYY'), TO_DATE('16-Jun-2024', 'DD-MON-YYYY'), TO_DATE('28-Jun-2024', 'DD-MON-YYYY'),'Lost', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB276', 'M121', 'C315', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB277', 'M131', 'C252', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB278', 'M100', 'C294', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB279', 'M004', 'C190', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB280', 'M116', 'C005', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB281', 'M041', 'C138', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), TO_DATE('29-Jun-2024', 'DD-MON-YYYY'), 'Lost', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB282', 'M136', 'C103', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), TO_DATE('29-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB283', 'M036', 'C324', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB284', 'M137', 'C094', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB285', 'M111', 'C299', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), TO_DATE('19-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB286', 'M137', 'C023', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB287', 'M011', 'C196', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB288', 'M105', 'C220', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB289', 'M051', 'C082', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), TO_DATE('22-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB290', 'M021', 'C129', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), TO_DATE('22-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'),'Returned', 'Canceled');

INSERT INTO BorrowedBooks VALUES ('BB291', 'M022', 'C126', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), TO_DATE('22-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB292', 'M143', 'C197', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), TO_DATE('22-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'),'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB293', 'M136', 'C076', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), TO_DATE('22-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB294', 'M032', 'C177', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), TO_DATE('22-Jun-2024', 'DD-MON-YYYY'), TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB295', 'M118', 'C138', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB296', 'M006', 'C101', TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), TO_DATE('23-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB297', 'M118', 'C181', TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), TO_DATE('23-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB298', 'M090', 'C069', TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), TO_DATE('23-Jun-2024', 'DD-MON-YYYY'), TO_DATE('21-Jun-2024', 'DD-MON-YYYY'),'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB299', 'M142', 'C106', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), TO_DATE('01-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB300', 'M061', 'C183', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('26-Jun-2024', 'DD-MON-YYYY'),'Overdue', 'Rejected');

INSERT INTO BorrowedBooks VALUES ('BB301', 'M001', 'C160', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Overdue', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB302', 'M050', 'C061', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), TO_DATE('01-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB303', 'M047', 'C333', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB304', 'M020', 'C228', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB305', 'M057', 'C242', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB306', 'M062', 'C020', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB307', 'M073', 'C293', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB308', 'M005', 'C241', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB309', 'M096', 'C145', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB310', 'M019', 'C126', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');

INSERT INTO BorrowedBooks VALUES ('BB311', 'M021', 'C194', TO_DATE('19-Jun-2024', 'DD-MON-YYYY'), TO_DATE('29-Jun-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'),'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB312', 'M022', 'C213', TO_DATE('19-Jun-2024', 'DD-MON-YYYY'), TO_DATE('29-Jun-2024', 'DD-MON-YYYY'), TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB313', 'M076', 'C262', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), TO_DATE('30-Jun-2024', 'DD-MON-YYYY'), TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB314', 'M030', 'C067', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), TO_DATE('30-Jun-2024', 'DD-MON-YYYY'), TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Returned', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB315', 'M144', 'C214', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), TO_DATE('01-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB316', 'M146', 'C027', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), TO_DATE('08-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB317', 'M143', 'C062', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), TO_DATE('01-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB318', 'M122', 'C214', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), TO_DATE('01-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB319', 'M125', 'C082', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), TO_DATE('01-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Pending');
INSERT INTO BorrowedBooks VALUES ('BB320', 'M059', 'C046', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), TO_DATE('08-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');

INSERT INTO BorrowedBooks VALUES ('BB321', 'M098', 'C197', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB322', 'M016', 'C193', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('11-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB323', 'M146', 'C005', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB324', 'M146', 'C333', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Pending');
INSERT INTO BorrowedBooks VALUES ('BB325', 'M147', 'C018', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('11-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB326', 'M147', 'C185', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Pending');
INSERT INTO BorrowedBooks VALUES ('BB327', 'M143', 'C224', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB328', 'M065', 'C015', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Pending');
INSERT INTO BorrowedBooks VALUES ('BB329', 'M131', 'C197', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Pending');
INSERT INTO BorrowedBooks VALUES ('BB330', 'M131', 'C208', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), TO_DATE('04-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB331', 'M131', 'C274', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), TO_DATE('05-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB332', 'M148', 'C335', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), TO_DATE('12-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB333', 'M140', 'C257', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), TO_DATE('05-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB334', 'M042', 'C037', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), TO_DATE('13-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB335', 'M137', 'C312', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), TO_DATE('06-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Pending');
INSERT INTO BorrowedBooks VALUES ('BB336', 'M052', 'C163', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), TO_DATE('06-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Pending');
INSERT INTO BorrowedBooks VALUES ('BB337', 'M030', 'C186', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), TO_DATE('06-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB338', 'M119', 'C218', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), TO_DATE('07-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB339', 'M005', 'C041', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('15-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');
INSERT INTO BorrowedBooks VALUES ('BB340', 'M052', 'C063', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('08-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Unsubmitted');

INSERT INTO BorrowedBooks VALUES ('BB341', 'M003', 'C347', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('08-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB342', 'M149', 'C335', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('08-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Unsubmitted');
INSERT INTO BorrowedBooks VALUES ('BB343', 'M149', 'C018', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('08-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Canceled');
INSERT INTO BorrowedBooks VALUES ('BB344', 'M150', 'C042', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('08-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Rejected');
INSERT INTO BorrowedBooks VALUES ('BB345', 'M150', 'C184', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), TO_DATE('15-Jul-2024', 'DD-MON-YYYY'), NULL, 'On loan', 'Approved');

COMMIT;