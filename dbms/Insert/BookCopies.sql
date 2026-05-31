/*
CREATE TABLE BookCopies (
    copyId VARCHAR2(4) NOT NULL,
    bookId VARCHAR2(4) NOT NULL,
    bookStatus VARCHAR2(20) DEFAULT 'available' NOT NULL,
	CONSTRAINT pk_BookCopies PRIMARY KEY (copyId),
    CONSTRAINT fk_BookCopies_BookTitles FOREIGN KEY (bookId) REFERENCES BookTitles(bookId) ON 	DELETE CASCADE,
    CONSTRAINT chk_BookStatus CHECK (bookStatus IN ('available', 'reserved', 'borrowed', 'unavailable')) 
);
*/

INSERT INTO BookCopies VALUES ('C001', 'B001', 'available');
INSERT INTO BookCopies VALUES ('C002', 'B001', 'available');
INSERT INTO BookCopies VALUES ('C003', 'B002', 'available');
INSERT INTO BookCopies VALUES ('C004', 'B003', 'available');
INSERT INTO BookCopies VALUES ('C005', 'B004', 'available');
INSERT INTO BookCopies VALUES ('C006', 'B005', 'available');
INSERT INTO BookCopies VALUES ('C007', 'B005', 'available');
INSERT INTO BookCopies VALUES ('C008', 'B005', 'available');
INSERT INTO BookCopies VALUES ('C009', 'B006', 'available');
INSERT INTO BookCopies VALUES ('C010', 'B007', 'available');

INSERT INTO BookCopies VALUES ('C011', 'B007', 'available');
INSERT INTO BookCopies VALUES ('C012', 'B007', 'available');
INSERT INTO BookCopies VALUES ('C013', 'B007', 'available');
INSERT INTO BookCopies VALUES ('C014', 'B007', 'available');
INSERT INTO BookCopies VALUES ('C015', 'B008', 'available');
INSERT INTO BookCopies VALUES ('C016', 'B009', 'available');
INSERT INTO BookCopies VALUES ('C017', 'B010', 'available');
INSERT INTO BookCopies VALUES ('C018', 'B011', 'available');
INSERT INTO BookCopies VALUES ('C019', 'B012', 'available');
INSERT INTO BookCopies VALUES ('C020', 'B013', 'available');

INSERT INTO BookCopies VALUES ('C021', 'B014', 'available');
INSERT INTO BookCopies VALUES ('C022', 'B015', 'available');
INSERT INTO BookCopies VALUES ('C023', 'B015', 'available');
INSERT INTO BookCopies VALUES ('C024', 'B015', 'available');
INSERT INTO BookCopies VALUES ('C025', 'B016', 'available');
INSERT INTO BookCopies VALUES ('C026', 'B016', 'available');
INSERT INTO BookCopies VALUES ('C027', 'B017', 'available');
INSERT INTO BookCopies VALUES ('C028', 'B018', 'available');
INSERT INTO BookCopies VALUES ('C029', 'B019', 'available');
INSERT INTO BookCopies VALUES ('C030', 'B020', 'available');

INSERT INTO BookCopies VALUES ('C031', 'B021', 'available');
INSERT INTO BookCopies VALUES ('C032', 'B021', 'available');
INSERT INTO BookCopies VALUES ('C033', 'B022', 'available');
INSERT INTO BookCopies VALUES ('C034', 'B023', 'available');
INSERT INTO BookCopies VALUES ('C035', 'B024', 'available');
INSERT INTO BookCopies VALUES ('C036', 'B025', 'available');
INSERT INTO BookCopies VALUES ('C037', 'B026', 'available');
INSERT INTO BookCopies VALUES ('C038', 'B027', 'available');
INSERT INTO BookCopies VALUES ('C039', 'B027', 'available');
INSERT INTO BookCopies VALUES ('C040', 'B028', 'available');

INSERT INTO BookCopies VALUES ('C041', 'B029', 'available');
INSERT INTO BookCopies VALUES ('C042', 'B030', 'available');
INSERT INTO BookCopies VALUES ('C043', 'B031', 'available');
INSERT INTO BookCopies VALUES ('C044', 'B032', 'available');
INSERT INTO BookCopies VALUES ('C045', 'B033', 'available');
INSERT INTO BookCopies VALUES ('C046', 'B034', 'available');
INSERT INTO BookCopies VALUES ('C047', 'B034', 'available');
INSERT INTO BookCopies VALUES ('C048', 'B034', 'available');
INSERT INTO BookCopies VALUES ('C049', 'B035', 'available');
INSERT INTO BookCopies VALUES ('C050', 'B035', 'available');

INSERT INTO BookCopies VALUES ('C051', 'B036', 'available');
INSERT INTO BookCopies VALUES ('C052', 'B037', 'available');
INSERT INTO BookCopies VALUES ('C053', 'B038', 'available');
INSERT INTO BookCopies VALUES ('C054', 'B039', 'available');
INSERT INTO BookCopies VALUES ('C055', 'B040', 'available');
INSERT INTO BookCopies VALUES ('C056', 'B040', 'available');
INSERT INTO BookCopies VALUES ('C057', 'B040', 'available');
INSERT INTO BookCopies VALUES ('C058', 'B040', 'available');
INSERT INTO BookCopies VALUES ('C059', 'B040', 'available');
INSERT INTO BookCopies VALUES ('C060', 'B041', 'available');

INSERT INTO BookCopies VALUES ('C061', 'B042', 'available');
INSERT INTO BookCopies VALUES ('C062', 'B042', 'available');
INSERT INTO BookCopies VALUES ('C063', 'B043', 'available');
INSERT INTO BookCopies VALUES ('C064', 'B044', 'available');
INSERT INTO BookCopies VALUES ('C065', 'B045', 'available');
INSERT INTO BookCopies VALUES ('C066', 'B045', 'available');
INSERT INTO BookCopies VALUES ('C067', 'B045', 'available');
INSERT INTO BookCopies VALUES ('C068', 'B046', 'available');
INSERT INTO BookCopies VALUES ('C069', 'B046', 'available');
INSERT INTO BookCopies VALUES ('C070', 'B047', 'available');

INSERT INTO BookCopies VALUES ('C071', 'B047', 'available');
INSERT INTO BookCopies VALUES ('C072', 'B047', 'available');
INSERT INTO BookCopies VALUES ('C073', 'B047', 'available');
INSERT INTO BookCopies VALUES ('C074', 'B047', 'available');
INSERT INTO BookCopies VALUES ('C075', 'B048', 'available');
INSERT INTO BookCopies VALUES ('C076', 'B048', 'available');
INSERT INTO BookCopies VALUES ('C077', 'B048', 'available');
INSERT INTO BookCopies VALUES ('C078', 'B048', 'available');
INSERT INTO BookCopies VALUES ('C079', 'B048', 'available');
INSERT INTO BookCopies VALUES ('C080', 'B048', 'available');

INSERT INTO BookCopies VALUES ('C081', 'B049', 'available');
INSERT INTO BookCopies VALUES ('C082', 'B050', 'available');
INSERT INTO BookCopies VALUES ('C083', 'B050', 'available');
INSERT INTO BookCopies VALUES ('C084', 'B051', 'available');
INSERT INTO BookCopies VALUES ('C085', 'B051', 'available');
INSERT INTO BookCopies VALUES ('C086', 'B052', 'available');
INSERT INTO BookCopies VALUES ('C087', 'B052', 'available');
INSERT INTO BookCopies VALUES ('C088', 'B053', 'available');
INSERT INTO BookCopies VALUES ('C089', 'B054', 'available');
INSERT INTO BookCopies VALUES ('C090', 'B054', 'available');

INSERT INTO BookCopies VALUES ('C091', 'B055', 'available');
INSERT INTO BookCopies VALUES ('C092', 'B055', 'available');
INSERT INTO BookCopies VALUES ('C093', 'B056', 'available');
INSERT INTO BookCopies VALUES ('C094', 'B056', 'available');
INSERT INTO BookCopies VALUES ('C095', 'B056', 'available');
INSERT INTO BookCopies VALUES ('C096', 'B056', 'available');
INSERT INTO BookCopies VALUES ('C097', 'B056', 'available');
INSERT INTO BookCopies VALUES ('C098', 'B057', 'available');
INSERT INTO BookCopies VALUES ('C099', 'B057', 'available');
INSERT INTO BookCopies VALUES ('C100', 'B057', 'available');

INSERT INTO BookCopies VALUES ('C101', 'B058', 'available');
INSERT INTO BookCopies VALUES ('C102', 'B058', 'available');
INSERT INTO BookCopies VALUES ('C103', 'B059', 'available');
INSERT INTO BookCopies VALUES ('C104', 'B059', 'available');
INSERT INTO BookCopies VALUES ('C105', 'B059', 'available');
INSERT INTO BookCopies VALUES ('C106', 'B060', 'available');
INSERT INTO BookCopies VALUES ('C107', 'B061', 'available');
INSERT INTO BookCopies VALUES ('C108', 'B061', 'available');
INSERT INTO BookCopies VALUES ('C109', 'B062', 'available');
INSERT INTO BookCopies VALUES ('C110', 'B062', 'available');

INSERT INTO BookCopies VALUES ('C111', 'B062', 'available');
INSERT INTO BookCopies VALUES ('C112', 'B062', 'available');
INSERT INTO BookCopies VALUES ('C113', 'B062', 'available');
INSERT INTO BookCopies VALUES ('C114', 'B063', 'available');
INSERT INTO BookCopies VALUES ('C115', 'B064', 'available');
INSERT INTO BookCopies VALUES ('C116', 'B065', 'available');
INSERT INTO BookCopies VALUES ('C117', 'B066', 'available');
INSERT INTO BookCopies VALUES ('C118', 'B066', 'available');
INSERT INTO BookCopies VALUES ('C119', 'B066', 'available');
INSERT INTO BookCopies VALUES ('C120', 'B066', 'available');

INSERT INTO BookCopies VALUES ('C121', 'B066', 'available');
INSERT INTO BookCopies VALUES ('C122', 'B067', 'available');
INSERT INTO BookCopies VALUES ('C123', 'B068', 'available');
INSERT INTO BookCopies VALUES ('C124', 'B068', 'available');
INSERT INTO BookCopies VALUES ('C125', 'B069', 'available');
INSERT INTO BookCopies VALUES ('C126', 'B069', 'available');
INSERT INTO BookCopies VALUES ('C127', 'B069', 'available');
INSERT INTO BookCopies VALUES ('C128', 'B070', 'available');
INSERT INTO BookCopies VALUES ('C129', 'B071', 'available');
INSERT INTO BookCopies VALUES ('C130', 'B071', 'available');

INSERT INTO BookCopies VALUES ('C131', 'B072', 'available');
INSERT INTO BookCopies VALUES ('C132', 'B072', 'available');
INSERT INTO BookCopies VALUES ('C133', 'B072', 'available');
INSERT INTO BookCopies VALUES ('C134', 'B072', 'available');
INSERT INTO BookCopies VALUES ('C135', 'B072', 'available');
INSERT INTO BookCopies VALUES ('C136', 'B073', 'available');
INSERT INTO BookCopies VALUES ('C137', 'B073', 'available');
INSERT INTO BookCopies VALUES ('C138', 'B073', 'available');
INSERT INTO BookCopies VALUES ('C139', 'B073', 'available');
INSERT INTO BookCopies VALUES ('C140', 'B073', 'available');

INSERT INTO BookCopies VALUES ('C141', 'B074', 'available');
INSERT INTO BookCopies VALUES ('C142', 'B074', 'available');
INSERT INTO BookCopies VALUES ('C143', 'B075', 'available');
INSERT INTO BookCopies VALUES ('C144', 'B075', 'available');
INSERT INTO BookCopies VALUES ('C145', 'B075', 'available');
INSERT INTO BookCopies VALUES ('C146', 'B075', 'available');
INSERT INTO BookCopies VALUES ('C147', 'B075', 'available');
INSERT INTO BookCopies VALUES ('C148', 'B075', 'available');
INSERT INTO BookCopies VALUES ('C149', 'B076', 'available');
INSERT INTO BookCopies VALUES ('C150', 'B077', 'available');

INSERT INTO BookCopies VALUES ('C151', 'B078', 'available');
INSERT INTO BookCopies VALUES ('C152', 'B078', 'available');
INSERT INTO BookCopies VALUES ('C153', 'B078', 'available');
INSERT INTO BookCopies VALUES ('C154', 'B079', 'available');
INSERT INTO BookCopies VALUES ('C155', 'B080', 'available');
INSERT INTO BookCopies VALUES ('C156', 'B081', 'available');
INSERT INTO BookCopies VALUES ('C157', 'B082', 'available');
INSERT INTO BookCopies VALUES ('C158', 'B082', 'available');
INSERT INTO BookCopies VALUES ('C159', 'B082', 'available');
INSERT INTO BookCopies VALUES ('C160', 'B083', 'available');

INSERT INTO BookCopies VALUES ('C161', 'B084', 'available');
INSERT INTO BookCopies VALUES ('C162', 'B085', 'available');
INSERT INTO BookCopies VALUES ('C163', 'B085', 'available');
INSERT INTO BookCopies VALUES ('C164', 'B086', 'available');
INSERT INTO BookCopies VALUES ('C165', 'B086', 'available');
INSERT INTO BookCopies VALUES ('C166', 'B086', 'available');
INSERT INTO BookCopies VALUES ('C167', 'B087', 'available');
INSERT INTO BookCopies VALUES ('C168', 'B087', 'available');
INSERT INTO BookCopies VALUES ('C169', 'B088', 'available');
INSERT INTO BookCopies VALUES ('C170', 'B088', 'available');

INSERT INTO BookCopies VALUES ('C171', 'B089', 'available');
INSERT INTO BookCopies VALUES ('C172', 'B089', 'available');
INSERT INTO BookCopies VALUES ('C173', 'B089', 'available');
INSERT INTO BookCopies VALUES ('C174', 'B089', 'available');
INSERT INTO BookCopies VALUES ('C175', 'B089', 'available');
INSERT INTO BookCopies VALUES ('C176', 'B090', 'available');
INSERT INTO BookCopies VALUES ('C177', 'B091', 'available');
INSERT INTO BookCopies VALUES ('C178', 'B091', 'available');
INSERT INTO BookCopies VALUES ('C179', 'B092', 'available');
INSERT INTO BookCopies VALUES ('C180', 'B092', 'available');

INSERT INTO BookCopies VALUES ('C181', 'B092', 'available');
INSERT INTO BookCopies VALUES ('C182', 'B093', 'available');
INSERT INTO BookCopies VALUES ('C183', 'B093', 'available');
INSERT INTO BookCopies VALUES ('C184', 'B094', 'available');
INSERT INTO BookCopies VALUES ('C185', 'B094', 'available');
INSERT INTO BookCopies VALUES ('C186', 'B094', 'available');
INSERT INTO BookCopies VALUES ('C187', 'B095', 'available');
INSERT INTO BookCopies VALUES ('C188', 'B096', 'available');
INSERT INTO BookCopies VALUES ('C189', 'B097', 'available');
INSERT INTO BookCopies VALUES ('C190', 'B097', 'available');

INSERT INTO BookCopies VALUES ('C191', 'B098', 'available');
INSERT INTO BookCopies VALUES ('C192', 'B098', 'available');
INSERT INTO BookCopies VALUES ('C193', 'B098', 'available');
INSERT INTO BookCopies VALUES ('C194', 'B098', 'available');
INSERT INTO BookCopies VALUES ('C195', 'B099', 'available');
INSERT INTO BookCopies VALUES ('C196', 'B099', 'available');
INSERT INTO BookCopies VALUES ('C197', 'B100', 'available');
INSERT INTO BookCopies VALUES ('C198', 'B100', 'available');
INSERT INTO BookCopies VALUES ('C199', 'B100', 'available');
INSERT INTO BookCopies VALUES ('C200', 'B101', 'available');

INSERT INTO BookCopies VALUES ('C201', 'B101', 'available');
INSERT INTO BookCopies VALUES ('C202', 'B101', 'available');
INSERT INTO BookCopies VALUES ('C203', 'B101', 'available');
INSERT INTO BookCopies VALUES ('C204', 'B101', 'available');
INSERT INTO BookCopies VALUES ('C205', 'B101', 'available');
INSERT INTO BookCopies VALUES ('C206', 'B101', 'available');
INSERT INTO BookCopies VALUES ('C207', 'B102', 'available');
INSERT INTO BookCopies VALUES ('C208', 'B102', 'available');
INSERT INTO BookCopies VALUES ('C209', 'B102', 'available');
INSERT INTO BookCopies VALUES ('C210', 'B103', 'available');

INSERT INTO BookCopies VALUES ('C211', 'B103', 'available');
INSERT INTO BookCopies VALUES ('C212', 'B103', 'available');
INSERT INTO BookCopies VALUES ('C213', 'B103', 'available');
INSERT INTO BookCopies VALUES ('C214', 'B104', 'available');
INSERT INTO BookCopies VALUES ('C215', 'B104', 'available');
INSERT INTO BookCopies VALUES ('C216', 'B105', 'available');
INSERT INTO BookCopies VALUES ('C217', 'B105', 'available');
INSERT INTO BookCopies VALUES ('C218', 'B105', 'available');
INSERT INTO BookCopies VALUES ('C219', 'B105', 'available');
INSERT INTO BookCopies VALUES ('C220', 'B105', 'available');

INSERT INTO BookCopies VALUES ('C221', 'B105', 'available');
INSERT INTO BookCopies VALUES ('C222', 'B106', 'available');
INSERT INTO BookCopies VALUES ('C223', 'B106', 'available');
INSERT INTO BookCopies VALUES ('C224', 'B107', 'available');
INSERT INTO BookCopies VALUES ('C225', 'B107', 'available');
INSERT INTO BookCopies VALUES ('C226', 'B107', 'available');
INSERT INTO BookCopies VALUES ('C227', 'B108', 'available');
INSERT INTO BookCopies VALUES ('C228', 'B109', 'available');
INSERT INTO BookCopies VALUES ('C229', 'B110', 'available');
INSERT INTO BookCopies VALUES ('C230', 'B110', 'available');

INSERT INTO BookCopies VALUES ('C231', 'B111', 'available');
INSERT INTO BookCopies VALUES ('C232', 'B112', 'available');
INSERT INTO BookCopies VALUES ('C233', 'B112', 'available');
INSERT INTO BookCopies VALUES ('C234', 'B112', 'available');
INSERT INTO BookCopies VALUES ('C235', 'B112', 'available');
INSERT INTO BookCopies VALUES ('C236', 'B112', 'available');
INSERT INTO BookCopies VALUES ('C237', 'B114', 'available');
INSERT INTO BookCopies VALUES ('C238', 'B114', 'available');
INSERT INTO BookCopies VALUES ('C239', 'B114', 'available');
INSERT INTO BookCopies VALUES ('C240', 'B114', 'available');

INSERT INTO BookCopies VALUES ('C241', 'B114', 'available');
INSERT INTO BookCopies VALUES ('C242', 'B114', 'available');
INSERT INTO BookCopies VALUES ('C243', 'B115', 'available');
INSERT INTO BookCopies VALUES ('C244', 'B115', 'available');
INSERT INTO BookCopies VALUES ('C245', 'B116', 'available');
INSERT INTO BookCopies VALUES ('C246', 'B116', 'available');
INSERT INTO BookCopies VALUES ('C247', 'B116', 'available');
INSERT INTO BookCopies VALUES ('C248', 'B117', 'available');
INSERT INTO BookCopies VALUES ('C249', 'B117', 'available');
INSERT INTO BookCopies VALUES ('C250', 'B118', 'available');

INSERT INTO BookCopies VALUES ('C251', 'B118', 'available');
INSERT INTO BookCopies VALUES ('C252', 'B118', 'available');
INSERT INTO BookCopies VALUES ('C253', 'B118', 'available');
INSERT INTO BookCopies VALUES ('C254', 'B118', 'available');
INSERT INTO BookCopies VALUES ('C255', 'B118', 'available');
INSERT INTO BookCopies VALUES ('C256', 'B119', 'available');
INSERT INTO BookCopies VALUES ('C257', 'B119', 'available');
INSERT INTO BookCopies VALUES ('C258', 'B119', 'available');
INSERT INTO BookCopies VALUES ('C259', 'B119', 'available');
INSERT INTO BookCopies VALUES ('C260', 'B119', 'available');

INSERT INTO BookCopies VALUES ('C261', 'B120', 'available');
INSERT INTO BookCopies VALUES ('C262', 'B120', 'available');
INSERT INTO BookCopies VALUES ('C263', 'B121', 'available');
INSERT INTO BookCopies VALUES ('C264', 'B122', 'available');
INSERT INTO BookCopies VALUES ('C265', 'B123', 'available');
INSERT INTO BookCopies VALUES ('C266', 'B123', 'available');
INSERT INTO BookCopies VALUES ('C267', 'B123', 'available');
INSERT INTO BookCopies VALUES ('C268', 'B124', 'available');
INSERT INTO BookCopies VALUES ('C269', 'B125', 'available');
INSERT INTO BookCopies VALUES ('C270', 'B125', 'available');

INSERT INTO BookCopies VALUES ('C271', 'B125', 'available');
INSERT INTO BookCopies VALUES ('C272', 'B125', 'available');
INSERT INTO BookCopies VALUES ('C273', 'B125', 'available');
INSERT INTO BookCopies VALUES ('C274', 'B126', 'available');
INSERT INTO BookCopies VALUES ('C275', 'B126', 'available');
INSERT INTO BookCopies VALUES ('C276', 'B127', 'available');
INSERT INTO BookCopies VALUES ('C277', 'B128', 'available');
INSERT INTO BookCopies VALUES ('C278', 'B128', 'available');
INSERT INTO BookCopies VALUES ('C279', 'B128', 'available');
INSERT INTO BookCopies VALUES ('C280', 'B128', 'available');

INSERT INTO BookCopies VALUES ('C281', 'B128', 'available');
INSERT INTO BookCopies VALUES ('C282', 'B129', 'available');
INSERT INTO BookCopies VALUES ('C283', 'B129', 'available');
INSERT INTO BookCopies VALUES ('C284', 'B129', 'available');
INSERT INTO BookCopies VALUES ('C285', 'B129', 'available');
INSERT INTO BookCopies VALUES ('C286', 'B129', 'available');
INSERT INTO BookCopies VALUES ('C287', 'B129', 'available');
INSERT INTO BookCopies VALUES ('C288', 'B130', 'available');
INSERT INTO BookCopies VALUES ('C289', 'B131', 'available');
INSERT INTO BookCopies VALUES ('C290', 'B131', 'available');

INSERT INTO BookCopies VALUES ('C291', 'B132', 'available');
INSERT INTO BookCopies VALUES ('C292', 'B132', 'available');
INSERT INTO BookCopies VALUES ('C293', 'B132', 'available');
INSERT INTO BookCopies VALUES ('C294', 'B132', 'available');
INSERT INTO BookCopies VALUES ('C295', 'B132', 'available');
INSERT INTO BookCopies VALUES ('C296', 'B133', 'available');
INSERT INTO BookCopies VALUES ('C297', 'B133', 'available');
INSERT INTO BookCopies VALUES ('C298', 'B134', 'available');
INSERT INTO BookCopies VALUES ('C299', 'B135', 'available');
INSERT INTO BookCopies VALUES ('C300', 'B135', 'available');

INSERT INTO BookCopies VALUES ('C301', 'B135', 'available');
INSERT INTO BookCopies VALUES ('C302', 'B136', 'available');
INSERT INTO BookCopies VALUES ('C303', 'B136', 'available');
INSERT INTO BookCopies VALUES ('C304', 'B137', 'available');
INSERT INTO BookCopies VALUES ('C305', 'B138', 'available');
INSERT INTO BookCopies VALUES ('C306', 'B139', 'available');
INSERT INTO BookCopies VALUES ('C307', 'B139', 'available');
INSERT INTO BookCopies VALUES ('C308', 'B139', 'available');
INSERT INTO BookCopies VALUES ('C309', 'B139', 'available');
INSERT INTO BookCopies VALUES ('C310', 'B139', 'available');

INSERT INTO BookCopies VALUES ('C311', 'B140', 'available');
INSERT INTO BookCopies VALUES ('C312', 'B140', 'available');
INSERT INTO BookCopies VALUES ('C313', 'B140', 'available');
INSERT INTO BookCopies VALUES ('C314', 'B140', 'available');
INSERT INTO BookCopies VALUES ('C315', 'B140', 'available');
INSERT INTO BookCopies VALUES ('C316', 'B141', 'available');
INSERT INTO BookCopies VALUES ('C317', 'B141', 'available');
INSERT INTO BookCopies VALUES ('C318', 'B142', 'available');
INSERT INTO BookCopies VALUES ('C319', 'B142', 'available');
INSERT INTO BookCopies VALUES ('C320', 'B143', 'available');

INSERT INTO BookCopies VALUES ('C321', 'B143', 'available');
INSERT INTO BookCopies VALUES ('C322', 'B144', 'available');
INSERT INTO BookCopies VALUES ('C323', 'B144', 'available');
INSERT INTO BookCopies VALUES ('C324', 'B144', 'available');
INSERT INTO BookCopies VALUES ('C325', 'B144', 'available');
INSERT INTO BookCopies VALUES ('C326', 'B145', 'available');
INSERT INTO BookCopies VALUES ('C327', 'B145', 'available');
INSERT INTO BookCopies VALUES ('C328', 'B146', 'available');
INSERT INTO BookCopies VALUES ('C329', 'B146', 'available');
INSERT INTO BookCopies VALUES ('C330', 'B146', 'available');

INSERT INTO BookCopies VALUES ('C331', 'B146', 'available');
INSERT INTO BookCopies VALUES ('C332', 'B147', 'available');
INSERT INTO BookCopies VALUES ('C333', 'B147', 'available');
INSERT INTO BookCopies VALUES ('C334', 'B147', 'available');
INSERT INTO BookCopies VALUES ('C335', 'B147', 'available');
INSERT INTO BookCopies VALUES ('C336', 'B147', 'available');
INSERT INTO BookCopies VALUES ('C337', 'B147', 'available');
INSERT INTO BookCopies VALUES ('C338', 'B148', 'available');
INSERT INTO BookCopies VALUES ('C339', 'B148', 'available');
INSERT INTO BookCopies VALUES ('C340', 'B148', 'available');

INSERT INTO BookCopies VALUES ('C341', 'B148', 'available');
INSERT INTO BookCopies VALUES ('C342', 'B148', 'available');
INSERT INTO BookCopies VALUES ('C343', 'B149', 'available');
INSERT INTO BookCopies VALUES ('C344', 'B149', 'available');
INSERT INTO BookCopies VALUES ('C345', 'B149', 'available');
INSERT INTO BookCopies VALUES ('C346', 'B150', 'available');
INSERT INTO BookCopies VALUES ('C347', 'B150', 'available');
INSERT INTO BookCopies VALUES ('C348', 'B150', 'available');
INSERT INTO BookCopies VALUES ('C349', 'B150', 'available');
INSERT INTO BookCopies VALUES ('C350', 'B150', 'available');

COMMIT;