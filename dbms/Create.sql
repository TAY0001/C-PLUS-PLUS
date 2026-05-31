
-- BEGIN
--    FOR rec IN (SELECT table_name FROM user_tables) LOOP
--       EXECUTE IMMEDIATE 'DROP TABLE ' || rec.table_name || ' CASCADE CONSTRAINTS PURGE';
--    END LOOP;
-- END;
-- /

-- BEGIN
--     -- Drop all triggers
--     FOR rec IN (SELECT trigger_name FROM user_triggers) LOOP
--         EXECUTE IMMEDIATE 'DROP TRIGGER ' || rec.trigger_name;
--     END LOOP;

--     -- Drop all views
--     FOR rec IN (SELECT view_name FROM user_views) LOOP
--         EXECUTE IMMEDIATE 'DROP VIEW ' || rec.view_name;
--     END LOOP;

--     -- Drop all tables (CASCADE to drop dependent constraints)
--     FOR rec IN (SELECT table_name FROM user_tables) LOOP
--         EXECUTE IMMEDIATE 'DROP TABLE ' || rec.table_name || ' CASCADE CONSTRAINTS';
--     END LOOP;

--     -- Drop all sequences
--     FOR rec IN (SELECT sequence_name FROM user_sequences) LOOP
--         EXECUTE IMMEDIATE 'DROP SEQUENCE ' || rec.sequence_name;
--     END LOOP;

--     -- Drop all functions
--     FOR rec IN (SELECT object_name FROM user_objects WHERE object_type = 'FUNCTION') LOOP
--         EXECUTE IMMEDIATE 'DROP FUNCTION ' || rec.object_name;
--     END LOOP;

--     -- Drop all procedures
--     FOR rec IN (SELECT object_name FROM user_objects WHERE object_type = 'PROCEDURE') LOOP
--         EXECUTE IMMEDIATE 'DROP PROCEDURE ' || rec.object_name;
--     END LOOP;

--     END;
--     /


-- DROP TABLE [table_name] CASCADE CONSTRAINTS;

CREATE TABLE Members(
	memberId VARCHAR2(4) NOT NULL, 
	memberName VARCHAR2(100) NOT NULL, 	
	memberTel VARCHAR2(20) UNIQUE NOT NULL, 
	memberEmail VARCHAR2(100) UNIQUE NOT NULL, 
	memberAddress VARCHAR2(255) NOT NULL, 
	memberStatus VARCHAR2(10) NOT NULL, 
	registrationDate DATE DEFAULT SYSDATE NOT NULL, 
	expireDate DATE NOT NULL,
	CONSTRAINT chk_memberStatus CHECK (memberStatus IN ('active', 'expire')),
	CONSTRAINT pk_Member PRIMARY KEY (memberId)
);

CREATE TABLE Staff (
    staffId VARCHAR2(4) NOT NULL, 
    staffName VARCHAR2(100) NOT NULL, 
    staffEmail VARCHAR2(100) NOT NULL UNIQUE, 
    staffTel VARCHAR2(20) NOT NULL UNIQUE, 
    role VARCHAR2(20) NOT NULL,
    CONSTRAINT chk_role CHECK (role IN ('librarian', 'manager', 'assistant', 'security', 'cleaner')),
    CONSTRAINT pk_Staff PRIMARY KEY (staffId)
);

CREATE TABLE Shift (
    shiftId VARCHAR2(4) NOT NULL,
    shiftType VARCHAR2(50) NOT NULL, 
    startTime TIMESTAMP NOT NULL, 
    endTime TIMESTAMP NOT NULL, 
    CONSTRAINT chk_shift_time CHECK (startTime < endTime),
    CONSTRAINT pk_Shift PRIMARY KEY (shiftId)
);

CREATE TABLE BookTitles (
    bookId VARCHAR2(4) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    author VARCHAR2(255) NOT NULL,
    genre VARCHAR2(100) NOT NULL,
    publicationYear NUMBER(4) NOT NULL,
    isbn VARCHAR2(20) UNIQUE NOT NULL,
    price NUMBER(6,2) NOT NULL CHECK (price >= 0),
    popularity NUMBER(2,1) CHECK (popularity BETWEEN 1.0 AND 5.0),
	CONSTRAINT pk_BookTitles PRIMARY KEY (bookId)
);

CREATE TABLE BookCopies (
    copyId VARCHAR2(4) NOT NULL,
    bookId VARCHAR2(4) NOT NULL,
    bookStatus VARCHAR2(20) DEFAULT 'available' NOT NULL,
    CONSTRAINT pk_BookCopies PRIMARY KEY (copyId),
    CONSTRAINT fk_BookCopies_BookTitles FOREIGN KEY (bookId) REFERENCES BookTitles(bookId) ON 	DELETE CASCADE,
    CONSTRAINT chk_BookStatus CHECK (bookStatus IN ('available', 'reserved', 'borrowed', 'unavailable')) 
);

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

CREATE TABLE BookAudit (
    auditId VARCHAR2 (6) NOT NULL,
    borrowId VARCHAR2 (5) NOT NULL,
    staffId VARCHAR2 (4) NOT NULL,
    actionType  VARCHAR2(10) CHECK (actionType IN ('Loaned', 'Returned', 'Lost')) NOT NULL,
    actionDate  DATE DEFAULT SYSDATE NOT NULL,
    notes VARCHAR2 (100),
    CONSTRAINT pk_BookAudit PRIMARY KEY (auditId),
    CONSTRAINT fk_bookAudit_borrowedBooks FOREIGN KEY (borrowId) REFERENCES BorrowedBooks(borrowId) ON DELETE CASCADE,
    CONSTRAINT fk_bookAudit_staff FOREIGN KEY (staffId) REFERENCES Staff(staffId) ON DELETE CASCADE
);

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

CREATE TABLE ShiftSchedules (
    scheduleId VARCHAR2(5) NOT NULL,        
    shiftId VARCHAR2(4) NOT NULL,         
    staffId VARCHAR2(4) NOT NULL,        
    shiftDate DATE NOT NULL,        
    CONSTRAINT pk_ShiftSchedules PRIMARY KEY (scheduleId),
    CONSTRAINT uq_ShiftSchedules_StaffDate UNIQUE (staffId, shiftDate),
    CONSTRAINT fk_ShiftSchedules_Shift FOREIGN KEY (shiftId) REFERENCES Shift(shiftId),        
    CONSTRAINT fk_ShiftSchedules_Staff FOREIGN KEY (staffId) REFERENCES Staff(staffId)
);

CREATE TABLE StaffAttendance (
    attendanceId VARCHAR2(5) NOT NULL,                         
    scheduleId VARCHAR2(5) NOT NULL,
    attendanceStatus VARCHAR2(10) NOT NULL,                        
    actualStartTime TIMESTAMP,                                  
    actualEndTime TIMESTAMP,
    CONSTRAINT pk_StaffAttendance PRIMARY KEY (attendanceId),     
    CONSTRAINT fk_StaffAtt_ShiftSched FOREIGN KEY (scheduleId) REFERENCES ShiftSchedules(scheduleId),       
    CONSTRAINT chk_attendanceStatus CHECK (attendanceStatus IN ('Present', 'Absent', 'Late')),
    CONSTRAINT chk_StaffAttendance_Time CHECK (actualStartTime IS NULL OR actualEndTime IS NULL OR actualStartTime < actualEndTime)                                   
);

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
