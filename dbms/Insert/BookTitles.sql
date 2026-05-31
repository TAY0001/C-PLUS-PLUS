/*
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
*/

INSERT INTO BookTitles VALUES ('B001', 'Iron Flame', 'Rebecca Yarros', 'Fantasy', '2023', '1649374178', '70.90', '4.1');
INSERT INTO BookTitles VALUES ('B002', 'Gilead', 'Marilynne Robinson', 'Fiction', '2004', '0002005883', '50.80', '3.9');
INSERT INTO BookTitles VALUES ('B003', 'Spiders Web', 'Charles Osborne', 'Mystery', '2000', '0002261987', '69.90', '3.8');
INSERT INTO BookTitles VALUES ('B004', 'The One Tree', 'Stephen Donaldson', 'Fiction', '1982', '0006163831', '40.80', '3.9');
INSERT INTO BookTitles VALUES ('B005', 'Rage of angels', 'Sidney Sheldon', 'Fiction', '1993', '0006178731', '45.00', '4.5');
INSERT INTO BookTitles VALUES ('B006', 'The Four Loves', 'Clive Lewis', 'Non Fiction', '2002', '0006280897', '45.00', '4.1');
INSERT INTO BookTitles VALUES ('B007', 'The Problem of Pain', 'Clive Lewis', 'Non Fiction', '2002', '0006280935', '45.00', '5.0');
INSERT INTO BookTitles VALUES ('B008', 'Empires of the Monsoon', 'Richard Hall', 'Thriller', '1998', '0006380832', '79.90', '4.4');
INSERT INTO BookTitles VALUES ('B009', 'The Gap Into Madness', 'Stephen Donaldson', 'Fiction', '1994', '0006470229', '40.00', '4.2');
INSERT INTO BookTitles VALUES ('B010', 'Master of the Game', 'Sidney Sheldon', 'Adventure', '1982', '0006472613', '39.90', '4.1');

INSERT INTO BookTitles VALUES ('B011', 'If Tomorrow Comes', 'Sidney Sheldon', 'Adventure', '1994', '0006479677', '39.90', '4.0');
INSERT INTO BookTitles VALUES ('B012', 'Assassins Apprentice', 'Robin Hobb', 'Fiction', '1996', '0006480098', '79.90', '4.1');
INSERT INTO BookTitles VALUES ('B013', 'Warhost of Vastmark', 'Janny Wurts', 'Fiction', '1995', '0006482074', '50.00', '4.0');
INSERT INTO BookTitles VALUES ('B014', 'The Once and Future King', 'Terence Hanbury', 'Romance', '1996', '0006483011', '89.90', '4.04');
INSERT INTO BookTitles VALUES ('B015', 'Murder in LaMut', 'Raymond E. Feist', 'Adventure', '2003', '0006483895', '29.90', '4.6');
INSERT INTO BookTitles VALUES ('B016', 'Jimmy the Hand', 'Raymond E. Feist', 'Fantasy', '2003', '0006483909', '66.80', '4.5');
INSERT INTO BookTitles VALUES ('B017', 'Well of Darkness', 'Margaret Weis', 'Non Fiction', '2001', '0006486142', '35.80', '3.7');
INSERT INTO BookTitles VALUES ('B018', 'The Little House', 'Philippa Gregory', 'Romance', '1998', '0006496431', '44.40', '3.7');
INSERT INTO BookTitles VALUES ('B019', 'Mystical Paths', 'Susan Howatch', 'Fiction', '1996', '0006496873', '58.90', '4.2');
INSERT INTO BookTitles VALUES ('B020', 'Glittering Images', 'Susan Howatch', 'Fiction', '1996', '0006496899', '68.70', '4.0');

INSERT INTO BookTitles VALUES ('B021', 'Glamorous Powers', 'Susan Howatch', 'Mystery', '1996', '0006496929', '45.50', '4.7');
INSERT INTO BookTitles VALUES ('B022', 'The Mad Ship', 'Robin Hobb', 'Fantasy', '2000', '0006498868', '40.00', '4.2');
INSERT INTO BookTitles VALUES ('B023', 'Post Captain', 'Patrick Brian', 'Fiction', '1996', '0006499163', '89.00', '4.3');
INSERT INTO BookTitles VALUES ('B024', 'The Reverse of the Medal', 'Patrick Brian', 'Adventure', '1997', '0006499260', '56.60', '4.4');
INSERT INTO BookTitles VALUES ('B025', 'Miss Marple', 'Agatha Christie', 'Mystery', '1997', '0006499627', '80.50', '4.2');
INSERT INTO BookTitles VALUES ('B026', 'The Years of Rice and Salt', 'Kim Stanley', 'Fantasy', '2003', '0006511481', '60.80', '3.7');
INSERT INTO BookTitles VALUES ('B027', 'Spares', 'Michael Smith', 'Non Fiction', '1998', '0006512674', '56.90', '4.1');
INSERT INTO BookTitles VALUES ('B028', 'Gravity', 'Tess Gerritsen', 'Fiction', '2004', '0006513085', '75.50', '4.0');
INSERT INTO BookTitles VALUES ('B029', 'The Wise Woman', 'Philippa Gregory', 'History', '2002', '0006514642', '49.00', '3.3');
INSERT INTO BookTitles VALUES ('B030', 'Girls Night in', 'Jessica Adams', 'Fiction', '2000', '0006514855', '68.30', '3.3');

INSERT INTO BookTitles VALUES ('B031', 'The White Album', 'Joan Didion', 'Non Fiction', '1993', '0006545866', '67.70', '4.2');
INSERT INTO BookTitles VALUES ('B032', 'The Bonesetters Daughter', 'Amy Tan', 'Thriller', '2001', '0006550436', '55.55', '4.0');
INSERT INTO BookTitles VALUES ('B033', 'The Lexus and the Olive Tree', 'Thomas L. Friedman', 'History', '2000', '0006551394', '67.95', '3.6');
INSERT INTO BookTitles VALUES ('B034', 'Tis', 'Frank McCourt', 'Romance', '2000', '0006551815', '66.60', '4.7');
INSERT INTO BookTitles VALUES ('B035', 'Ocean Star Express', 'Mark Haddon', 'Fiction', '2002', '0006646009', '99.99', '4.5');
INSERT INTO BookTitles VALUES ('B036', 'A Small Pinch of Weather', 'Joan Aiken', 'Fiction', '2000', '0006754899', '86.50', '4.3');
INSERT INTO BookTitles VALUES ('B037', 'The Princess of the Chalet School', 'Elinor Mary Brent-Dyer', 'Fiction', '2000', '0006906019', '56.00', '4.1');
INSERT INTO BookTitles VALUES ('B038', 'Tree and Leaf', 'John Ronald', 'Mystery', '2001', '0007105045', '67.90', '4.1');
INSERT INTO BookTitles VALUES ('B039', 'Partners in Crime', 'Agatha Christie', 'Fiction', '2001', '0007111509', '89.90', '3.8');
INSERT INTO BookTitles VALUES ('B040', 'Murder in Mesopotamia', 'Agatha Christie', 'Mystery', '2001', '0007113803', '123.80', '5.0');

INSERT INTO BookTitles VALUES ('B041', 'The Return of the King', 'Jude Fisher', 'Fantasy', '2003', '0007116268', '78.00', '4.6');
INSERT INTO BookTitles VALUES ('B042', 'All Families are Psychotic', 'Douglas Coupland', 'Thriller', '2002', '0007117531', '100.00', '3.7');
INSERT INTO BookTitles VALUES ('B043', 'Death in the Clouds', 'Agatha Christie', 'Mystery', '2001', '0007119339', '45.50', '3.8');
INSERT INTO BookTitles VALUES ('B044', 'Appointment with Death', 'Agatha Christie', 'Mystery', '2001', '0007119356', '78.20', '3.9');
INSERT INTO BookTitles VALUES ('B045', 'Halloween Party', 'Agatha Christie', 'Fiction', '2001', '0007120680', '67.70', '4.7');
INSERT INTO BookTitles VALUES ('B046', 'Hercule Poirots Christmas', 'Agatha Christie', 'Romance', '2001', '0007120699', '55.90', '4.0');
INSERT INTO BookTitles VALUES ('B047', 'The Big Four', 'Agatha Christie', 'Mystery', '2002', '0007120818', '99.90', '5.0');
INSERT INTO BookTitles VALUES ('B048', 'The Thirteen Problems', 'Agatha Christie', 'Mystery', '2002', '0007120869', '67.70', '4.9');
INSERT INTO BookTitles VALUES ('B049', 'They Do it with Mirrors', 'Agatha Christie', 'Fiction', '2002', '0007120877', '30.00', '3.6');
INSERT INTO BookTitles VALUES ('B050', 'A Murder is Announced', 'Agatha Christie', 'Mystery', '2002', '0007120966', '88.80', '4.0');

INSERT INTO BookTitles VALUES ('B051', 'The Mirror Crack from Side to Side', 'Agatha Christie', 'Fiction', '2002', '0007120982', '88.40', '3.9');
INSERT INTO BookTitles VALUES ('B052', 'Mrs McGintys Dead', 'Agatha Christie', 'Fantasy', '2002', '0007121008', '83.30', '3.8');
INSERT INTO BookTitles VALUES ('B053', 'Taken at the Flood', 'Agatha Christie', 'Fiction', '2002', '0007121016', '40.00', '3.7');
INSERT INTO BookTitles VALUES ('B054', 'The Hollow', 'Agatha Christie', 'Mystery', '2002', '0007121024', '66.60', '3.8');
INSERT INTO BookTitles VALUES ('B055', 'Third Girl', 'Agatha Christie', 'Thriller', '2002', '0007121105', '60.50', '3.6');
INSERT INTO BookTitles VALUES ('B056', 'The Secret of Chimneys', 'Agatha Christie', 'Non Fiction', '2001', '0007122586', '45.00', '4.9');
INSERT INTO BookTitles VALUES ('B057', 'The Lord of the Rings', 'J. R. Tolkien', 'Fiction', '2001', '0007124015', '62.50', '4.5');
INSERT INTO BookTitles VALUES ('B058', 'The Metaphysical Club', 'Louis Menand', 'Thriller', '2002', '0007126905', '90.90', '4.0');
INSERT INTO BookTitles VALUES ('B059', 'The illustrated man', 'Ray Bradbury', 'Fiction', '2002', '0007127749', '109.90', '4.1');
INSERT INTO BookTitles VALUES ('B060', 'Wilkins Tooth', 'Diana Wynne Jones', 'Non fiction', '2002', '0007129653', '98.90', '3.6');

INSERT INTO BookTitles VALUES ('B061', 'Cut', 'Patricia McCormick', 'Non fiction', '2002', '0007130317', '29.90', '3.8');
INSERT INTO BookTitles VALUES ('B062', 'The Lord of the Rings', 'Gary Russell', 'Fantasy', '2004', '0007135653', '89.90', '4.7');
INSERT INTO BookTitles VALUES ('B063', 'The Fellowship of the Ring', 'Alan Lee', 'Fiction', '2002', '0007136595', '35.50', '4.4');
INSERT INTO BookTitles VALUES ('B064', 'Lirael', 'Garth Nix', 'Fantasy', '2004', '0007137338', '51.10', '4.3');
INSERT INTO BookTitles VALUES ('B065', 'Tales from the Perilous Realm', 'John Ronald', 'Romance', '2002', '0007149123', '25.50', '4.1');
INSERT INTO BookTitles VALUES ('B066', 'Breaking Open the Head', 'Daniel Pinchbeck', 'Thriller', '2004', '0007149611', '70.10', '4.9');
INSERT INTO BookTitles VALUES ('B067', 'The Yiddish Policemens Union', 'Michael Chabon', 'Fiction', '2007', '0007149824', '110.50', '3.7');
INSERT INTO BookTitles VALUES ('B068', 'Beware, Princess Elizabeth', 'Carolyn Meyer', 'Fiction', '2003', '0007150302', '29.20', '3.9');
INSERT INTO BookTitles VALUES ('B069', 'The Family Way', 'Tony Parsons', 'Fantasy', '2005', '0007151241', '93.50', '4.3');
INSERT INTO BookTitles VALUES ('B070', 'Endless Night', 'Agatha Christie', 'Fiction', '2002', '0007151675', '43.70', '3.8');

INSERT INTO BookTitles VALUES ('B071', 'How to be Alone', 'Jonathan Franzen', 'Non fiction', '2004', '0007153589', '94.20', '3.6');
INSERT INTO BookTitles VALUES ('B072', 'The Mysterious Mr. Quin', 'Agatha Christie', 'Mystery', '2003', '0007154844', '38.40', '5.0');
INSERT INTO BookTitles VALUES ('B073', 'The Listerdale Mystery', 'Agatha Christie', 'Mystery', '2003', '0007154887', '89.50', '4.9');
INSERT INTO BookTitles VALUES ('B074', 'The Real Trial of Oscar Wilde', 'Merlin Holland', 'Non fiction', '2004', '0007158059', '99.90', '4.0');
INSERT INTO BookTitles VALUES ('B075', 'I Can Read with Me Eyes Shut', 'Dr. Seuss', 'Thriller', '2003', '0007158513', '85.00', '5.0');
INSERT INTO BookTitles VALUES ('B076', 'Oh, the Places Youll Go!', 'Dr. Seuss', 'Fantasy', '2003', '0007158521', '78.40', '4.4');
INSERT INTO BookTitles VALUES ('B077', 'If I Die in a Combat Zone', 'Tim O Brien', 'HIstory', '2003', '0007162995', '88.90', '4.0');
INSERT INTO BookTitles VALUES ('B078', 'The Return of the King', 'J.R. Tolkien', 'Fiction', '2003', '0007171994', '84.20', '4.5');
INSERT INTO BookTitles VALUES ('B079', 'The Silmarillion', 'Ted Nasmith', 'Fiction', '2004', '0007173024', '23.90', '3.91');
INSERT INTO BookTitles VALUES ('B080', 'I Wish that I Had Duck Feet', 'Barney Tobey', 'Fiction', '2004', '0007173139', '44.90',  '4.2');

INSERT INTO BookTitles VALUES ('B081', 'Oh Say Can You Say?', 'Dr. Seuss', 'Fiction', '2004', '0007175221', '38.90', '4.0');
INSERT INTO BookTitles VALUES ('B082', 'Theres a Boy in Forest', 'Louis Sachar', 'History', '2004', '0007178638', '73.10', '4.5');
INSERT INTO BookTitles VALUES ('B083', 'Microserfs', 'Douglas Coupland', 'Non fiction', '2004', '0007179812', '32.90', '3.9');
INSERT INTO BookTitles VALUES ('B084', 'Miss Wyoming', 'Douglas Coupland', 'Romance', '2004', '0007179820', '49.90', '3.5');
INSERT INTO BookTitles VALUES ('B085', 'Where Rainbows End', 'Cecelia Ahern', 'Fantasy', '2004', '0007189958', '85.40', '3.9');
INSERT INTO BookTitles VALUES ('B086', 'Poirot', 'Agatha Christie', 'History', '2005', '0007190689', '83.00', '4.2');
INSERT INTO BookTitles VALUES ('B087', 'The Art of The Lord of the Rings', 'Gary Russell', 'Fiction', '2004', '0007191928', '34.90', '4.5');
INSERT INTO BookTitles VALUES ('B088', 'The Known World', 'Edward P. Jones', 'History', '2004', '0007195303', '25.50', '3.8');
INSERT INTO BookTitles VALUES ('B089', 'Discover with the Monk', 'Robin Sharma', 'Fiction', '2004', '0007195710', '30.00', '4.8');
INSERT INTO BookTitles VALUES ('B090', 'Naked Lunch', 'William S. Burroughs', 'Non fiction', '2005', '0007204442', '40.00', '3.4');

INSERT INTO BookTitles VALUES ('B091', 'Tropic of Cancer', 'Henry Miller', 'Fiction', '2005', '0007204469', '29.10', '3.7');
INSERT INTO BookTitles VALUES ('B092', 'Close Range', 'Annie Proulx', 'Thriller', '2006', '0007205589', '43.30', '4.0');
INSERT INTO BookTitles VALUES ('B093', 'The Love of the Last Tycoon', 'F. Scott Fitzgerald', 'Fiction', '1994', '0020199856', '45.00', '3.7');
INSERT INTO BookTitles VALUES ('B094', 'The Song of Rhiannon', 'Evangeline Walton', 'Fiction', '1992', '0020264739', '32.00', '4.0');
INSERT INTO BookTitles VALUES ('B095', 'Heart Songs and Other Stories', 'Annie Proulx', 'Fiction', '1995', '0020360754', '32.20', '3.9');
INSERT INTO BookTitles VALUES ('B096', 'The voyage of the Dawn Treader', 'Clive Staples Lewis', 'Fiction', '2023', '0020442602', '60.00', '4.0');
INSERT INTO BookTitles VALUES ('B097', 'The Chronicles of Narnia', 'Clive Lewis', 'Romance', '1978', '0020442807', '78.00', '4.3');
INSERT INTO BookTitles VALUES ('B098', 'The Short Stories of Ernest Hemingway', 'Ernest Hemingway', 'Fiction', '1986', '0020518609', '43.20', '4.6');
INSERT INTO BookTitles VALUES ('B099', 'The Screwtape Letters', 'Clive Lewis', 'History', '1982', '0020867409', '73.90', '4.2');
INSERT INTO BookTitles VALUES ('B100', 'Reason in History', 'Georg Friedrich', 'Philosophy', '1953', '0023513209', '19.00', '3.6');

INSERT INTO BookTitles VALUES ('B101', 'The Elements of Style', 'William Strunk', 'Non fiction', '2017', '0024181900', '65.00', '5.0');
INSERT INTO BookTitles VALUES ('B102', 'The Presocratics', 'Philip Wheelwright', 'Philosophy', '1966', '0024266402', '20.00', '4.8');
INSERT INTO BookTitles VALUES ('B103', 'Spandau', 'Albert Speer', 'History', '1976', '0026995018', '39.00', '4.1');
INSERT INTO BookTitles VALUES ('B104', 'The Rumble Seat Pony', 'Clarence William Anderson', 'Non fiction', '2019', '0027054903', '31.20', '4.2');
INSERT INTO BookTitles VALUES ('B105', 'The Journey with Grandmother', 'Edith Unnerstad', 'Thriller', '2020', '0027897508', '89.90', '5.0');
INSERT INTO BookTitles VALUES ('B106', 'Tyranny of the Majority', 'Lani Guinier', 'History', '2016', '0029131693', '50.00', '3.8');
INSERT INTO BookTitles VALUES ('B107', 'The Origins of the Civil Rights Movement', 'Aldon D. Morris', 'History', '2009', '0029221307', '43.80', '4.0');
INSERT INTO BookTitles VALUES ('B108', 'Presidential Power and the Modern Presidents', 'Richard E. Neustadt', 'History', '2019', '0029227968', '49.90', '3.8');
INSERT INTO BookTitles VALUES ('B109', 'Rest, Rabbit, Rest', 'Jacquelyn Reinach', 'Fiction', '2011', '0030420563', '43.90', '4.0');
INSERT INTO BookTitles VALUES ('B110', 'Where the Red Fern Grows', 'Wilson Rawls', 'Fiction', '2000', '0030547741', '43.50', '4.4');

INSERT INTO BookTitles VALUES ('B111', 'Poppys Return', 'Avi', 'Fiction', '2006', '0060000147', '32.90', '3.9');
INSERT INTO BookTitles VALUES ('B112', 'Diary of a Spider', 'Doreen Cronin', 'Fiction', '2005', '0060001534', '65.40', '5.0');
INSERT INTO BookTitles VALUES ('B113', 'An Old-Fashioned Thanksgiving', 'Louisa May Alcott', 'Fiction', '2005', '0060004509', '70.00', '3.7');
INSERT INTO BookTitles VALUES ('B114', 'The Paradox of Choice', 'Barry Schwartz', 'Philosophy', '2015', '0060005696', '90.00', '4.8');
INSERT INTO BookTitles VALUES ('B115', 'How to Read Literature Like a Professor', 'Thomas C. Foster', 'Non fiction', '2003', '0060009424', '42.90', '3.7');
INSERT INTO BookTitles VALUES ('B116', 'The Amazing Maurice and His Educated Rodents', 'Terry Pratchett', 'Fiction', '2010', '0060012342', '32.90', '4.1');
INSERT INTO BookTitles VALUES ('B117', 'The Wee Free Men', 'Terry Pratchett', 'Fiction', '2020', '0060012382', '23.90', '4.3');
INSERT INTO BookTitles VALUES ('B118', 'Going Postal', 'Terry Pratchett', 'Fiction', '2004', '0060013133', '90.00', '4.8');
INSERT INTO BookTitles VALUES ('B119', 'Modern Mind', 'Peter Watson', 'Non Fiction', '2002', '0060084383', '140.00', '4.9');
INSERT INTO BookTitles VALUES ('B120', 'She Went All the Way', 'Meg Cabot', 'Romance', '2012', '0060085444', '54.90', '3.7');

INSERT INTO BookTitles VALUES ('B121', 'Island', 'Aldous Huxley', 'Fiction', '2002', '0060085495', '32.90', '3.9');
INSERT INTO BookTitles VALUES ('B122', 'A Year in the Life of William Shakespeare', 'James Shapiro', 'Autobiography', '2006', '0060088745', '30.00', '4.0');
INSERT INTO BookTitles VALUES ('B123', 'Lucy Sullivan Is Getting Married', 'Marian Keyes', 'Romance', '2012', '0060090375', '65.00', '3.7');
INSERT INTO BookTitles VALUES ('B124', 'The Terminal Man', 'Michael Crichton', 'Fiction', '2017', '0060092572', '43.00', '3.6');
INSERT INTO BookTitles VALUES ('B125', 'The Art of the Novel', 'Milan Kundera', 'Non fiction', '2013', '0060093749', '34.90', '4.7');
INSERT INTO BookTitles VALUES ('B126', 'The Bromeliad Trilogy', 'Terry Pratchett', 'Fiction', '2003', '0060094931', '55.50', '4.1');
INSERT INTO BookTitles VALUES ('B127', 'Identity', 'Milan Kundera', 'Fiction', '2018', '0060175648', '65.40', '3.8');
INSERT INTO BookTitles VALUES ('B128', 'The thief of always', 'Clive Barker', 'Fiction', '2002', '0060177241', '29.00', '4.9');
INSERT INTO BookTitles VALUES ('B129','Mars and Venus Book of Days', 'John Gray', 'Romance', '2008', '0060192771', '84.00', '5.0');
INSERT INTO BookTitles VALUES ('B130', 'The Illustrated Alchemist', 'Paulo Coelho', 'Fiction', '1998', '0060192505', '36.00', '3.8');

INSERT INTO BookTitles VALUES ('B131', 'The Great Whangdoodles', 'Julie Edwards', 'Fiction', '2006', '0060218053', '53.70', '4.3');
INSERT INTO BookTitles VALUES ('B132', 'Today I Feel Silly', 'Jamie Lee Curtis', 'Fiction', '2018', '0060245603', '53.20', '4.2');
INSERT INTO BookTitles VALUES ('B133', 'The Missing Piece', 'Shel Silverstein', 'Fiction', '2018', '0060256575', '100.00', '4.3');
INSERT INTO BookTitles VALUES ('B134', 'Lafcadio, the Lion', 'Shel Silverstein', 'Fiction', '2013', '0060256753', '32.90', '4.8');
INSERT INTO BookTitles VALUES ('B135', 'The Secret Garden Cookbook', 'Amy Cotler', 'Non fiction', '2019', '0060277408', '23.90', '4.3');
INSERT INTO BookTitles VALUES ('B136', 'Lauras Album', 'William Anderson', 'Non fiction', '2008', '0060278420', '54.60', '4.3');
INSERT INTO BookTitles VALUES ('B137', 'Quivers', 'Robin Quivers', 'Autobiography', '2005', '0060391537', '55.90', '3.5');
INSERT INTO BookTitles VALUES ('B138', 'Moonspinners', 'Mary Stewart', 'Fiction', '2003', '0060502959', '43.20','4.0');
INSERT INTO BookTitles VALUES ('B139','Small Wonder', 'Barbara Kingsolver', 'Non fiction', '2003', '0060504080', '30.50', '4.9');
INSERT INTO BookTitles VALUES ('B140', 'The Cheese Monkeys', 'Chip Kidd', 'Fiction', '2002', '0060507403', '23.90', '4.8');

INSERT INTO BookTitles VALUES ('B141', 'Love and War', 'Margaret Weis', 'Fiction', '2005', '0786937702', '40.90', '3.9');
INSERT INTO BookTitles VALUES ('B142', 'The Reign of Istar', 'Tracy Hickman', 'Fiction', '2005', '0786937793', '55.50', '3.7');
INSERT INTO BookTitles VALUES ('B143', 'Night of the Long Shadows', 'Paul Crilley', 'Fantasy', '2007', '0786942703', '25.50', '3.6');
INSERT INTO BookTitles VALUES ('B144', 'Moonage Daydream', 'David Bowie', 'Non fiction', '2005', '0789313502', '39.90', '4.3');
INSERT INTO BookTitles VALUES ('B145', 'Story of Philosophy', 'Bryan Magee', 'Philosophy', '2018', '0789444550', '49.90', '4.3');
INSERT INTO BookTitles VALUES ('B146', 'Freedom Riders', 'Ann Bausum', 'Non fiction', '2006', '0792241738', '43.40', '4.0');
INSERT INTO BookTitles VALUES ('B147', 'Reptiles and Amphibians', 'Mark O Shea', 'Nonfiction', '2002', '0789493934', '43.40', '4.9');
INSERT INTO BookTitles VALUES ('B148', 'In Focus', 'National Geographic Society', 'Non fiction', '2004', '0792273634', '69.90', '4.5');
INSERT INTO BookTitles VALUES ('B149','Silence', 'Shusaku Endo', 'Fiction', '1980', '0800871863', '50.00', '4.1');
INSERT INTO BookTitles VALUES ('B150', 'The River Runs Black', 'Elizabeth Economy', 'History', '2004', '0801489784', '40.00', '5.0');

COMMIT;