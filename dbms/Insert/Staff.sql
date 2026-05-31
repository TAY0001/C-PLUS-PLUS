/*
CREATE TABLE Staff (
    staffId VARCHAR2(4) NOT NULL, 
    staffName VARCHAR2(100) NOT NULL, 
    staffEmail VARCHAR2(100) NOT NULL UNIQUE, 
    staffTel VARCHAR2(20) NOT NULL UNIQUE, 
    role VARCHAR2(20) NOT NULL,
    CONSTRAINT chk_role CHECK (role IN ('librarian', 'manager', 'assistant', 'security', 'cleaner')),
    CONSTRAINT pk_Staff PRIMARY KEY (staffId)
);
*/

INSERT INTO Staff VALUES ('S001', 'Ahmad Zulkarnain', 'ahmadzulkarnain@gmail.com', '012-3456781', 'manager');

INSERT INTO Staff VALUES ('S002', 'Tan Mei Ling', 'tanmeiling@yahoo.com', '013-4567892', 'assistant');

INSERT INTO Staff VALUES ('S003', 'Ravi Kumar', 'ravikumar@outlook.com', '014-5678903', 'assistant');

INSERT INTO Staff VALUES ('S004', 'Siti Aisyah', 'siti_aisyah@gmail.com', '015-6789014', 'librarian');

INSERT INTO Staff VALUES ('S005', 'John Lim', 'johnlim@hotmail.com', '016-7890125', 'librarian');

INSERT INTO Staff VALUES ('S006', 'Farah Nadia', 'farahnadia@gmail.com', '017-8901236', 'librarian');

INSERT INTO Staff VALUES ('S007', 'Mohd Hafiz', 'mohdhafiz@yahoo.com', '018-9012347', 'librarian');

INSERT INTO Staff VALUES ('S008', 'Chong Wei', 'chongwei@outlook.com', '019-0123458', 'security');

INSERT INTO Staff VALUES ('S009', 'Lim Wai Kit', 'limwaikit@hotmail.com', '012-2345679', 'security');

INSERT INTO Staff VALUES ('S010', 'Nurul Ain', 'nurulain@gmail.com', '011-1234569', 'cleaner');

INSERT INTO Staff VALUES ('S011', 'Kumar Raj', 'kumarraj@hotmail.com', '012-2345670', 'cleaner');

COMMIT;