/*
CREATE TABLE BookAudit (
    auditId VARCHAR2 (5) NOT NULL,
    borrowId VARCHAR2 (5) NOT NULL,
    staffId VARCHAR2 (4) NOT NULL,
    actionType  VARCHAR2(10) CHECK (actionType IN ('Loaned', 'Returned', 'Lost')) NOT NULL,
    actionDate  DATE DEFAULT SYSDATE NOT NULL,
    notes VARCHAR2 (100),
    CONSTRAINT pk_BookAudit PRIMARY KEY (auditId),
    CONSTRAINT fk_bookAudit_borrowedBooks FOREIGN KEY (borrowId) REFERENCES BorrowedBooks(borrowId) ON DELETE CASCADE,
    CONSTRAINT fk_bookAudit_staff FOREIGN KEY (staffId) REFERENCES Staff(staffId) ON DELETE CASCADE
);
*/

/* 
DELETE FROM BookAudit;
COMMIT;
*/

INSERT INTO BookAudit VALUES ('BA001', 'BB001', 'S007', 'Loaned', TO_DATE('02-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA002', 'BB001', 'S007', 'Returned', TO_DATE('10-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA003', 'BB002', 'S006', 'Loaned', TO_DATE('02-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA004', 'BB002', 'S006', 'Returned', TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA005', 'BB003', 'S005', 'Loaned', TO_DATE('03-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA006', 'BB003', 'S005', 'Returned', TO_DATE('09-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA007', 'BB004', 'S006', 'Loaned', TO_DATE('03-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA008', 'BB005', 'S003', 'Loaned', TO_DATE('03-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA009', 'BB005', 'S003', 'Returned', TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA010', 'BB006', 'S007', 'Loaned', TO_DATE('04-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA011', 'BB006', 'S007', 'Returned', TO_DATE('12-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA012', 'BB007', 'S007', 'Loaned', TO_DATE('05-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA013', 'BB008', 'S004', 'Loaned', TO_DATE('05-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA014', 'BB008', 'S004', 'Lost', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA015', 'BB009', 'S007', 'Loaned', TO_DATE('05-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA016', 'BB010', 'S002', 'Loaned', TO_DATE('05-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA017', 'BB011', 'S007', 'Loaned', TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA018', 'BB011', 'S007', 'Lost', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA019', 'BB012', 'S003', 'Loaned', TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA020', 'BB013', 'S003', 'Loaned', TO_DATE('08-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA021', 'BB013', 'S003', 'Returned', TO_DATE('16-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA022', 'BB014', 'S007', 'Loaned', TO_DATE('09-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA023', 'BB015', 'S007', 'Loaned', TO_DATE('11-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA024', 'BB015', 'S007', 'Returned', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA025', 'BB016', 'S004', 'Loaned', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA026', 'BB017', 'S004', 'Loaned', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA027', 'BB017', 'S004', 'Lost', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA028', 'BB018', 'S003', 'Loaned', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA029', 'BB018', 'S003', 'Lost', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA030', 'BB019', 'S005', 'Loaned', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA031', 'BB019', 'S005', 'Returned', TO_DATE('27-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA032', 'BB020', 'S003', 'Loaned', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA033', 'BB021', 'S007', 'Loaned', TO_DATE('15-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA034', 'BB021', 'S007', 'Returned', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA035', 'BB022', 'S005', 'Loaned', TO_DATE('16-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA036', 'BB023', 'S006', 'Loaned', TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA037', 'BB023', 'S006', 'Returned', TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA038', 'BB024', 'S003', 'Loaned', TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA039', 'BB024', 'S003', 'Returned', TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA040', 'BB025', 'S004', 'Loaned', TO_DATE('17-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA041', 'BB025', 'S004', 'Lost', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA042', 'BB026', 'S003', 'Loaned', TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA043', 'BB026', 'S003', 'Lost', TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA044', 'BB027', 'S005', 'Loaned', TO_DATE('18-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA045', 'BB028', 'S004', 'Loaned', TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA046', 'BB028', 'S004', 'Returned', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA047', 'BB029', 'S004', 'Loaned', TO_DATE('19-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA048', 'BB029', 'S004', 'Returned', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA049', 'BB030', 'S003', 'Loaned', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA050', 'BB031', 'S003', 'Loaned', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA051', 'BB031', 'S003', 'Lost', TO_DATE('03-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA052', 'BB032', 'S005', 'Loaned', TO_DATE('22-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA053', 'BB032', 'S005', 'Returned', TO_DATE('30-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA054', 'BB033', 'S007', 'Loaned', TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA055', 'BB034', 'S004', 'Loaned', TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA056', 'BB034', 'S004', 'Lost', TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA057', 'BB035', 'S005', 'Loaned', TO_DATE('23-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA058', 'BB035', 'S005', 'Lost', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA059', 'BB036', 'S002', 'Loaned', TO_DATE('24-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA060', 'BB037', 'S003', 'Loaned', TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA061', 'BB037', 'S003', 'Returned', TO_DATE('07-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA062', 'BB038', 'S003', 'Loaned', TO_DATE('25-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA063', 'BB038', 'S003', 'Returned', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA064', 'BB039', 'S004', 'Loaned', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA065', 'BB039', 'S004', 'Returned', TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA066', 'BB040', 'S007', 'Loaned', TO_DATE('26-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA067', 'BB040', 'S007', 'Lost', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA068', 'BB041', 'S004', 'Loaned', TO_DATE('29-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA069', 'BB041', 'S004', 'Lost', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA070', 'BB042', 'S003', 'Loaned', TO_DATE('30-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA071', 'BB043', 'S004', 'Loaned', TO_DATE('31-Jan-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA072', 'BB043', 'S004', 'Lost', TO_DATE('17-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA073', 'BB044', 'S002', 'Loaned', TO_DATE('01-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA074', 'BB044', 'S002', 'Returned', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA075', 'BB045', 'S006', 'Loaned', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA076', 'BB045', 'S006', 'Lost', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA077', 'BB046', 'S002', 'Loaned', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA078', 'BB047', 'S003', 'Loaned', TO_DATE('02-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA079', 'BB047', 'S003', 'Lost', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA080', 'BB048', 'S005', 'Loaned', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA081', 'BB048', 'S005', 'Returned', TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA082', 'BB049', 'S004', 'Loaned', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA083', 'BB049', 'S004', 'Returned', TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA084', 'BB050', 'S003', 'Loaned', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA085', 'BB050', 'S003', 'Returned', TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA086', 'BB051', 'S002', 'Loaned', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA087', 'BB051', 'S002', 'Lost', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA088', 'BB052', 'S007', 'Loaned', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA089', 'BB052', 'S007', 'Lost', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA090', 'BB053', 'S003', 'Loaned', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA091', 'BB054', 'S006', 'Loaned', TO_DATE('05-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA092', 'BB054', 'S006', 'Lost', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA093', 'BB055', 'S002', 'Loaned', TO_DATE('06-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA094', 'BB056', 'S005', 'Loaned', TO_DATE('06-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA095', 'BB056', 'S005', 'Lost', TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA096', 'BB057', 'S003', 'Loaned', TO_DATE('07-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA097', 'BB057', 'S003', 'Lost', TO_DATE('17-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA098', 'BB058', 'S006', 'Loaned', TO_DATE('08-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA099', 'BB059', 'S006', 'Loaned', TO_DATE('08-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA100', 'BB060', 'S004', 'Loaned', TO_DATE('09-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA101', 'BB060', 'S004', 'Lost', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA102', 'BB061', 'S004', 'Loaned', TO_DATE('09-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA103', 'BB061', 'S004', 'Lost', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA104', 'BB062', 'S003', 'Loaned', TO_DATE('09-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA105', 'BB062', 'S003', 'Returned', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA106', 'BB063', 'S004', 'Loaned', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA107', 'BB063', 'S004', 'Returned', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA108', 'BB064', 'S006', 'Loaned', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA109', 'BB065', 'S002', 'Loaned', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA110', 'BB065', 'S002', 'Returned', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA111', 'BB066', 'S006', 'Loaned', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA112', 'BB067', 'S004', 'Loaned', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA113', 'BB067', 'S004', 'Returned', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA114', 'BB068', 'S003', 'Loaned', TO_DATE('12-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA115', 'BB068', 'S003', 'Returned', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA116', 'BB069', 'S002', 'Loaned', TO_DATE('13-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA117', 'BB069', 'S002', 'Lost', TO_DATE('06-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA118', 'BB070', 'S002', 'Loaned', TO_DATE('14-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA119', 'BB071', 'S003', 'Loaned', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA120', 'BB072', 'S006', 'Loaned', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA121', 'BB072', 'S006', 'Returned', TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA122', 'BB073', 'S006', 'Loaned', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA123', 'BB073', 'S006', 'Lost', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA124', 'BB074', 'S002', 'Loaned', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA125', 'BB074', 'S002', 'Lost', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA126', 'BB075', 'S004', 'Loaned', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA127', 'BB076', 'S002', 'Loaned', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA128', 'BB076', 'S002', 'Returned', TO_DATE('16-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA129', 'BB077', 'S007', 'Loaned', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA130', 'BB078', 'S006', 'Loaned', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA131', 'BB078', 'S006', 'Lost', TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA132', 'BB079', 'S007', 'Loaned', TO_DATE('19-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA133', 'BB080', 'S002', 'Loaned', TO_DATE('20-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA134', 'BB081', 'S003', 'Loaned', TO_DATE('20-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA135', 'BB081', 'S003', 'Returned', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA136', 'BB082', 'S003', 'Loaned', TO_DATE('21-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA137', 'BB082', 'S003', 'Lost', TO_DATE('31-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA138', 'BB083', 'S004', 'Loaned', TO_DATE('21-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA139', 'BB083', 'S004', 'Lost', TO_DATE('02-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA140', 'BB084', 'S002', 'Loaned', TO_DATE('22-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA141', 'BB084', 'S002', 'Returned', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA142', 'BB085', 'S006', 'Loaned', TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA143', 'BB085', 'S006', 'Lost', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA144', 'BB086', 'S004', 'Loaned', TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA145', 'BB086', 'S004', 'Returned', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA146', 'BB087', 'S004', 'Loaned', TO_DATE('23-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA147', 'BB087', 'S004', 'Lost', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA148', 'BB088', 'S005', 'Loaned', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA149', 'BB089', 'S007', 'Loaned', TO_DATE('26-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA150', 'BB089', 'S007', 'Returned', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA151', 'BB091', 'S004', 'Loaned', TO_DATE('27-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA152', 'BB092', 'S002', 'Loaned', TO_DATE('28-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA153', 'BB093', 'S003', 'Loaned', TO_DATE('28-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA154', 'BB093', 'S003', 'Lost', TO_DATE('09-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA155', 'BB094', 'S002', 'Loaned', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA156', 'BB094', 'S002', 'Lost', TO_DATE('13-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA157', 'BB095', 'S005', 'Loaned', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA158', 'BB096', 'S004', 'Loaned', TO_DATE('29-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA159', 'BB097', 'S005', 'Loaned', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA160', 'BB097', 'S005', 'Lost', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA161', 'BB098', 'S007', 'Loaned', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA162', 'BB099', 'S006', 'Loaned', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA163', 'BB099', 'S006', 'Lost', TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA164', 'BB100', 'S007', 'Loaned', TO_DATE('01-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA165', 'BB100', 'S007', 'Lost', TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA166', 'BB101', 'S002', 'Loaned', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA167', 'BB101', 'S002', 'Lost', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA168', 'BB102', 'S004', 'Loaned', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA169', 'BB102', 'S004', 'Lost', TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA170', 'BB103', 'S004', 'Loaned', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA171', 'BB104', 'S006', 'Loaned', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA172', 'BB104', 'S006', 'Returned', TO_DATE('13-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA173', 'BB105', 'S006', 'Loaned', TO_DATE('04-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA174', 'BB105', 'S006', 'Returned', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA175', 'BB106', 'S007', 'Loaned', TO_DATE('05-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA176', 'BB107', 'S007', 'Loaned', TO_DATE('06-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA177', 'BB108', 'S005', 'Loaned', TO_DATE('06-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA178', 'BB109', 'S002', 'Loaned', TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA179', 'BB109', 'S002', 'Returned', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA180', 'BB110', 'S002', 'Loaned', TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA181', 'BB110', 'S002', 'Returned', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA182', 'BB111', 'S007', 'Loaned', TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA183', 'BB111', 'S007', 'Returned', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA184', 'BB112', 'S003', 'Loaned', TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA185', 'BB112', 'S003', 'Returned', TO_DATE('24-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA186', 'BB114', 'S007', 'Loaned', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA187', 'BB114', 'S007', 'Lost', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA188', 'BB115', 'S007', 'Loaned', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA189', 'BB115', 'S007', 'Lost', TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA190', 'BB116', 'S006', 'Loaned', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA191', 'BB116', 'S006', 'Returned', TO_DATE('19-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA192', 'BB117', 'S007', 'Loaned', TO_DATE('11-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA193', 'BB118', 'S006', 'Loaned', TO_DATE('12-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA194', 'BB119', 'S007', 'Loaned', TO_DATE('13-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA195', 'BB119', 'S007', 'Lost', TO_DATE('23-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA196', 'BB120', 'S005', 'Loaned', TO_DATE('13-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA197', 'BB120', 'S005', 'Lost', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA198', 'BB121', 'S005', 'Loaned', TO_DATE('14-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA199', 'BB121', 'S005', 'Lost', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA200', 'BB122', 'S004', 'Loaned', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA201', 'BB123', 'S003', 'Loaned', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA202', 'BB124', 'S007', 'Loaned', TO_DATE('15-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA203', 'BB124', 'S007', 'Lost', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA204', 'BB125', 'S006', 'Loaned', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA205', 'BB125', 'S006', 'Returned', TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA206', 'BB126', 'S003', 'Loaned', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA207', 'BB126', 'S003', 'Returned', TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA208', 'BB127', 'S003', 'Loaned', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA209', 'BB127', 'S003', 'Lost', TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA210', 'BB128', 'S003', 'Loaned', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA211', 'BB128', 'S003', 'Lost', TO_DATE('18-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA212', 'BB129', 'S007', 'Loaned', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA213', 'BB129', 'S007', 'Lost', TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA214', 'BB130', 'S006', 'Loaned', TO_DATE('18-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA215', 'BB130', 'S006', 'Returned', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA216', 'BB131', 'S004', 'Loaned', TO_DATE('19-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA217', 'BB131', 'S004', 'Lost', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA218', 'BB132', 'S007', 'Loaned', TO_DATE('20-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA219', 'BB132', 'S007', 'Lost', TO_DATE('30-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA220', 'BB133', 'S002', 'Loaned', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA221', 'BB133', 'S002', 'Lost', TO_DATE('31-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA222', 'BB134', 'S002', 'Loaned', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA223', 'BB134', 'S002', 'Lost', TO_DATE('18-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA224', 'BB135', 'S006', 'Loaned', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA225', 'BB136', 'S005', 'Loaned', TO_DATE('21-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA226', 'BB137', 'S004', 'Loaned', TO_DATE('22-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA227', 'BB137', 'S004', 'Returned', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA228', 'BB138', 'S006', 'Loaned', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA229', 'BB138', 'S006', 'Lost', TO_DATE('04-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA230', 'BB139', 'S005', 'Loaned', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA231', 'BB140', 'S003', 'Loaned', TO_DATE('25-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA232', 'BB142', 'S007', 'Loaned', TO_DATE('26-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA233', 'BB142', 'S007', 'Returned', TO_DATE('07-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA234', 'BB143', 'S002', 'Loaned', TO_DATE('26-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA235', 'BB143', 'S002', 'Lost', TO_DATE('15-Feb-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA236', 'BB144', 'S004', 'Loaned', TO_DATE('26-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA237', 'BB144', 'S004', 'Lost', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA238', 'BB145', 'S005', 'Loaned', TO_DATE('27-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA239', 'BB145', 'S005', 'Lost', TO_DATE('06-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA240', 'BB146', 'S007', 'Loaned', TO_DATE('28-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA241', 'BB147', 'S006', 'Loaned', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA242', 'BB147', 'S006', 'Returned', TO_DATE('07-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA243', 'BB148', 'S002', 'Loaned', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA244', 'BB149', 'S004', 'Loaned', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA245', 'BB150', 'S004', 'Loaned', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA246', 'BB150', 'S004', 'Returned', TO_DATE('08-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA247', 'BB151', 'S002', 'Loaned', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA248', 'BB152', 'S007', 'Loaned', TO_DATE('29-Mar-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA249', 'BB152', 'S007', 'Lost', TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA250', 'BB153', 'S002', 'Loaned', TO_DATE('01-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA251', 'BB153', 'S002', 'Lost', TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA252', 'BB154', 'S005', 'Loaned', TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA253', 'BB155', 'S006', 'Loaned', TO_DATE('02-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA254', 'BB156', 'S004', 'Loaned', TO_DATE('03-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA255', 'BB157', 'S004', 'Loaned', TO_DATE('03-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA256', 'BB157', 'S004', 'Returned', TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA257', 'BB158', 'S005', 'Loaned', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA258', 'BB158', 'S005', 'Returned', TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA259', 'BB159', 'S003', 'Loaned', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA260', 'BB159', 'S003', 'Returned', TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA261', 'BB160', 'S004', 'Loaned', TO_DATE('05-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA262', 'BB161', 'S004', 'Loaned', TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA263', 'BB162', 'S005', 'Loaned', TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA264', 'BB163', 'S007', 'Loaned', TO_DATE('08-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA265', 'BB163', 'S007', 'Lost', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA266', 'BB164', 'S006', 'Loaned', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA267', 'BB164', 'S006', 'Lost', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA268', 'BB165', 'S003', 'Loaned', TO_DATE('09-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA269', 'BB166', 'S006', 'Loaned', TO_DATE('10-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA270', 'BB166', 'S006', 'Returned', TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA271', 'BB167', 'S002', 'Loaned', TO_DATE('10-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA272', 'BB167', 'S002', 'Lost', TO_DATE('20-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA273', 'BB168', 'S007', 'Loaned', TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA274', 'BB169', 'S002', 'Loaned', TO_DATE('11-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA275', 'BB169', 'S002', 'Lost', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA276', 'BB170', 'S004', 'Loaned', TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA277', 'BB171', 'S004', 'Loaned', TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA278', 'BB171', 'S004', 'Returned', TO_DATE('21-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA279', 'BB172', 'S005', 'Loaned', TO_DATE('12-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA280', 'BB173', 'S004', 'Loaned', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA281', 'BB173', 'S004', 'Returned', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA282', 'BB174', 'S003', 'Loaned', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA283', 'BB175', 'S006', 'Loaned', TO_DATE('15-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA284', 'BB175', 'S006', 'Returned', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA285', 'BB176', 'S007', 'Loaned', TO_DATE('16-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA286', 'BB176', 'S007', 'Lost', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA287', 'BB177', 'S002', 'Loaned', TO_DATE('17-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA288', 'BB178', 'S003', 'Loaned', TO_DATE('17-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA289', 'BB179', 'S003', 'Loaned', TO_DATE('17-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA290', 'BB179', 'S003', 'Returned', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA291', 'BB180', 'S003', 'Loaned', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA292', 'BB180', 'S003', 'Returned', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA293', 'BB181', 'S003', 'Loaned', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA294', 'BB182', 'S003', 'Loaned', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA295', 'BB183', 'S007', 'Loaned', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA296', 'BB183', 'S007', 'Returned', TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA297', 'BB184', 'S006', 'Loaned', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA298', 'BB184', 'S006', 'Returned', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA299', 'BB185', 'S005', 'Loaned', TO_DATE('19-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA300', 'BB185', 'S005', 'Lost', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA301', 'BB186', 'S006', 'Loaned', TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA302', 'BB186', 'S006', 'Returned', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA303', 'BB187', 'S005', 'Loaned', TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA304', 'BB187', 'S005', 'Returned', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA305', 'BB188', 'S004', 'Loaned', TO_DATE('22-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA306', 'BB188', 'S004', 'Returned', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA307', 'BB189', 'S003', 'Loaned', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA308', 'BB189', 'S003', 'Returned', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA309', 'BB190', 'S002', 'Loaned', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA310', 'BB190', 'S002', 'Lost', TO_DATE('03-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA311', 'BB191', 'S002', 'Loaned', TO_DATE('23-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA312', 'BB192', 'S004', 'Loaned', TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA313', 'BB192', 'S004', 'Returned', TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA314', 'BB193', 'S005', 'Loaned', TO_DATE('24-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA315', 'BB193', 'S005', 'Returned', TO_DATE('09-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA316', 'BB194', 'S004', 'Loaned', TO_DATE('25-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA317', 'BB195', 'S002', 'Loaned', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA318', 'BB195', 'S002', 'Returned', TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA319', 'BB196', 'S004', 'Loaned', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA320', 'BB196', 'S004', 'Returned', TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA321', 'BB197', 'S006', 'Loaned', TO_DATE('26-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA322', 'BB197', 'S006', 'Returned', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA323', 'BB198', 'S007', 'Loaned', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA324', 'BB198', 'S007', 'Lost', TO_DATE('09-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA325', 'BB199', 'S004', 'Loaned', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA326', 'BB199', 'S004', 'Lost', TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA327', 'BB200', 'S004', 'Loaned', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA328', 'BB200', 'S004', 'Returned', TO_DATE('14-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA329', 'BB201', 'S002', 'Loaned', TO_DATE('29-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA330', 'BB201', 'S002', 'Returned', TO_DATE('07-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA331', 'BB202', 'S002', 'Loaned', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA332', 'BB203', 'S007', 'Loaned', TO_DATE('30-Apr-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA333', 'BB203', 'S007', 'Returned', TO_DATE('09-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA334', 'BB204', 'S003', 'Loaned', TO_DATE('01-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA335', 'BB205', 'S003', 'Loaned', TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA336', 'BB205', 'S003', 'Returned', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA337', 'BB206', 'S005', 'Loaned', TO_DATE('02-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA338', 'BB206', 'S005', 'Returned', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA339', 'BB207', 'S004', 'Loaned', TO_DATE('03-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA340', 'BB208', 'S002', 'Loaned', TO_DATE('03-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA341', 'BB209', 'S003', 'Loaned', TO_DATE('03-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA342', 'BB210', 'S007', 'Loaned', TO_DATE('06-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA343', 'BB210', 'S007', 'Returned', TO_DATE('13-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA344', 'BB211', 'S005', 'Loaned', TO_DATE('06-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA345', 'BB211', 'S005', 'Lost', TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA346', 'BB212', 'S006', 'Loaned', TO_DATE('06-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA347', 'BB213', 'S004', 'Loaned', TO_DATE('06-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA348', 'BB213', 'S004', 'Returned', TO_DATE('15-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA349', 'BB214', 'S006', 'Loaned', TO_DATE('07-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA350', 'BB214', 'S006', 'Returned', TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA351', 'BB215', 'S003', 'Loaned', TO_DATE('07-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA352', 'BB216', 'S002', 'Loaned', TO_DATE('08-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA353', 'BB216', 'S002', 'Lost', TO_DATE('18-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA354', 'BB217', 'S005', 'Loaned', TO_DATE('09-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA355', 'BB218', 'S006', 'Loaned', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA356', 'BB219', 'S003', 'Loaned', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA357', 'BB220', 'S004', 'Loaned', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA358', 'BB221', 'S007', 'Loaned', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA359', 'BB221', 'S007', 'Returned', TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA360', 'BB222', 'S003', 'Loaned', TO_DATE('10-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA361', 'BB222', 'S003', 'Returned', TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA362', 'BB223', 'S006', 'Loaned', TO_DATE('13-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA363', 'BB223', 'S006', 'Lost', TO_DATE('23-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA364', 'BB224', 'S007', 'Loaned', TO_DATE('13-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA365', 'BB224', 'S007', 'Lost', TO_DATE('30-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA366', 'BB225', 'S002', 'Loaned', TO_DATE('13-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA367', 'BB225', 'S002', 'Returned', TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA368', 'BB226', 'S007', 'Loaned', TO_DATE('13-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA369', 'BB226', 'S007', 'Lost', TO_DATE('23-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA370', 'BB227', 'S007', 'Loaned', TO_DATE('13-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA371', 'BB227', 'S007', 'Returned', TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA372', 'BB228', 'S004', 'Loaned', TO_DATE('14-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA373', 'BB228', 'S004', 'Lost', TO_DATE('24-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA374', 'BB229', 'S005', 'Loaned', TO_DATE('15-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA375', 'BB229', 'S005', 'Lost', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA376', 'BB230', 'S005', 'Loaned', TO_DATE('16-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA377', 'BB230', 'S005', 'Lost', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA378', 'BB231', 'S002', 'Loaned', TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA379', 'BB232', 'S003', 'Loaned', TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA380', 'BB232', 'S003', 'Lost', TO_DATE('27-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA381', 'BB233', 'S002', 'Loaned', TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA382', 'BB233', 'S002', 'Returned', TO_DATE('23-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA383', 'BB234', 'S004', 'Loaned', TO_DATE('17-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA384', 'BB234', 'S004', 'Returned', TO_DATE('22-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA385', 'BB235', 'S006', 'Loaned', TO_DATE('20-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA386', 'BB235', 'S006', 'Returned', TO_DATE('29-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA387', 'BB236', 'S006', 'Loaned', TO_DATE('20-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA388', 'BB236', 'S006', 'Returned', TO_DATE('29-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA389', 'BB237', 'S006', 'Loaned', TO_DATE('20-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA390', 'BB237', 'S006', 'Returned', TO_DATE('29-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA391', 'BB238', 'S005', 'Loaned', TO_DATE('20-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA392', 'BB238', 'S005', 'Returned', TO_DATE('29-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA393', 'BB239', 'S004', 'Loaned', TO_DATE('21-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA394', 'BB239', 'S004', 'Lost', TO_DATE('31-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA395', 'BB240', 'S002', 'Loaned', TO_DATE('21-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA396', 'BB240', 'S002', 'Lost', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA397', 'BB241', 'S006', 'Loaned', TO_DATE('22-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA398', 'BB241', 'S006', 'Lost', TO_DATE('08-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA399', 'BB242', 'S002', 'Loaned', TO_DATE('22-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA400', 'BB242', 'S002', 'Lost', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA401', 'BB243', 'S006', 'Loaned', TO_DATE('23-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA402', 'BB244', 'S007', 'Loaned', TO_DATE('23-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA403', 'BB245', 'S006', 'Loaned', TO_DATE('23-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA404', 'BB246', 'S003', 'Loaned', TO_DATE('24-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA405', 'BB246', 'S003', 'Returned', TO_DATE('30-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA406', 'BB247', 'S002', 'Loaned', TO_DATE('24-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA407', 'BB248', 'S006', 'Loaned', TO_DATE('24-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA408', 'BB248', 'S006', 'Lost', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA409', 'BB249', 'S004', 'Loaned', TO_DATE('27-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA410', 'BB250', 'S005', 'Loaned', TO_DATE('27-May-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');

INSERT INTO BookAudit VALUES ('BA411', 'BB250', 'S005', 'Lost', TO_DATE('06-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA412', 'BB251', 'S003', 'Loaned', TO_DATE('27-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA413', 'BB251', 'S003', 'Returned', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA414', 'BB252', 'S002', 'Loaned', TO_DATE('27-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA415', 'BB252', 'S002', 'Returned', TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA416', 'BB253', 'S006', 'Loaned', TO_DATE('28-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA417', 'BB253', 'S006', 'Returned', TO_DATE('06-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA418', 'BB254', 'S005', 'Loaned', TO_DATE('29-May-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA419', 'BB254', 'S005', 'Returned', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA420', 'BB255', 'S004', 'Loaned', TO_DATE('30-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA421', 'BB256', 'S002', 'Loaned', TO_DATE('31-May-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA422', 'BB257', 'S005', 'Loaned', TO_DATE('31-May-2024', 'DD-MON-YYYY'), 'Action recorded for Retured');
INSERT INTO BookAudit VALUES ('BA423', 'BB258', 'S007', 'Loaned', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA424', 'BB259', 'S003', 'Loaned', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA425', 'BB259', 'S003', 'Returned', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA426', 'BB260', 'S003', 'Loaned', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA427', 'BB261', 'S006', 'Loaned', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA428', 'BB261', 'S006', 'Returned', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA429', 'BB264', 'S006', 'Loaned', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA430', 'BB264', 'S006', 'Returned', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA431', 'BB266', 'S007', 'Loaned', TO_DATE('03-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA432', 'BB266', 'S007', 'Lost', TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA433', 'BB270', 'S002', 'Loaned', TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA434', 'BB271', 'S002', 'Loaned', TO_DATE('04-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA435', 'BB273', 'S007', 'Loaned', TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA436', 'BB274', 'S005', 'Loaned', TO_DATE('05-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA437', 'BB274', 'S005', 'Returned', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA438', 'BB276', 'S007', 'Loaned', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA439', 'BB276', 'S007', 'Returned', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA440', 'BB277', 'S003', 'Loaned', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA441', 'BB277', 'S003', 'Returned', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA442', 'BB278', 'S002', 'Loaned', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA443', 'BB278', 'S002', 'Returned', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA444', 'BB279', 'S003', 'Loaned', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA445', 'BB279', 'S003', 'Returned', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA446', 'BB280', 'S003', 'Loaned', TO_DATE('07-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA447', 'BB280', 'S003', 'Returned', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA448', 'BB281', 'S002', 'Loaned', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA449', 'BB281', 'S002', 'Lost', TO_DATE('29-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Lost');
INSERT INTO BookAudit VALUES ('BA450', 'BB282', 'S003', 'Loaned', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA451', 'BB283', 'S002', 'Loaned', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA452', 'BB284', 'S005', 'Loaned', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA453', 'BB284', 'S005', 'Returned', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA454', 'BB285', 'S004', 'Loaned', TO_DATE('10-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA455', 'BB285', 'S004', 'Returned', TO_DATE('19-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA456', 'BB286', 'S005', 'Loaned', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA457', 'BB286', 'S005', 'Returned', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA458', 'BB287', 'S002', 'Loaned', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA459', 'BB287', 'S002', 'Returned', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA460', 'BB288', 'S007', 'Loaned', TO_DATE('11-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA461', 'BB289', 'S006', 'Loaned', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA462', 'BB291', 'S006', 'Loaned', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA463', 'BB291', 'S006', 'Returned', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA464', 'BB293', 'S002', 'Loaned', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA465', 'BB293', 'S002', 'Returned', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA466', 'BB294', 'S006', 'Loaned', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA467', 'BB294', 'S006', 'Returned', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA468', 'BB295', 'S003', 'Loaned', TO_DATE('12-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA469', 'BB296', 'S007', 'Loaned', TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA470', 'BB297', 'S005', 'Loaned', TO_DATE('13-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');

INSERT INTO BookAudit VALUES ('BA471', 'BB299', 'S004', 'Loaned', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA472', 'BB301', 'S003', 'Loaned', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Overdue');
INSERT INTO BookAudit VALUES ('BA473', 'BB302', 'S005', 'Loaned', TO_DATE('14-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA474', 'BB303', 'S005', 'Loaned', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA475', 'BB303', 'S005', 'Returned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA476', 'BB304', 'S007', 'Loaned', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA477', 'BB305', 'S002', 'Loaned', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA478', 'BB305', 'S002', 'Returned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA479', 'BB306', 'S007', 'Loaned', TO_DATE('17-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA480', 'BB306', 'S007', 'Returned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA481', 'BB307', 'S006', 'Loaned', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA482', 'BB307', 'S006', 'Returned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA483', 'BB308', 'S005', 'Loaned', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA484', 'BB308', 'S005', 'Returned', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA485', 'BB309', 'S004', 'Loaned', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA486', 'BB309', 'S004', 'Returned', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA487', 'BB310', 'S007', 'Loaned', TO_DATE('18-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA488', 'BB312', 'S002', 'Loaned', TO_DATE('19-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA489', 'BB312', 'S002', 'Returned', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA490', 'BB313', 'S005', 'Loaned', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');

INSERT INTO BookAudit VALUES ('BA491', 'BB313', 'S005', 'Returned', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA492', 'BB314', 'S007', 'Loaned', TO_DATE('20-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA493', 'BB314', 'S007', 'Returned', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for Returned');
INSERT INTO BookAudit VALUES ('BA494', 'BB315', 'S007', 'Loaned', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA495', 'BB316', 'S007', 'Loaned', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA496', 'BB317', 'S005', 'Loaned', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA497', 'BB318', 'S003', 'Loaned', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA498', 'BB319', 'S002', 'Loaned', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA499', 'BB320', 'S005', 'Loaned', TO_DATE('21-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA500', 'BB321', 'S006', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');

INSERT INTO BookAudit VALUES ('BA501', 'BB322', 'S006', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA502', 'BB323', 'S007', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA503', 'BB324', 'S006', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA504', 'BB325', 'S005', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA505', 'BB326', 'S006', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA506', 'BB327', 'S002', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA507', 'BB328', 'S006', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA508', 'BB329', 'S004', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA509', 'BB330', 'S006', 'Loaned', TO_DATE('24-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA510', 'BB331', 'S003', 'Loaned', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');

INSERT INTO BookAudit VALUES ('BA511', 'BB332', 'S006', 'Loaned', TO_DATE('25-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA512', 'BB333', 'S004', 'Loaned', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA513', 'BB334', 'S004', 'Loaned', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA514', 'BB335', 'S005', 'Loaned', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA515', 'BB336', 'S006', 'Loaned', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA516', 'BB337', 'S005', 'Loaned', TO_DATE('26-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA517', 'BB338', 'S007', 'Loaned', TO_DATE('27-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA518', 'BB339', 'S005', 'Loaned', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA519', 'BB340', 'S003', 'Loaned', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA520', 'BB341', 'S006', 'Loaned', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');

INSERT INTO BookAudit VALUES ('BA521', 'BB342', 'S007', 'Loaned', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA522', 'BB343', 'S004', 'Loaned', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA523', 'BB344', 'S007', 'Loaned', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');
INSERT INTO BookAudit VALUES ('BA524', 'BB345', 'S002', 'Loaned', TO_DATE('28-Jun-2024', 'DD-MON-YYYY'), 'Action recorded for On loan');

COMMIT;