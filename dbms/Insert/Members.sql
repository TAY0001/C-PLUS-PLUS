/*
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
*/

INSERT INTO Members VALUES ('M001', 'Muhammad Iqbal', '012-2706153', 'muhammadiqbal@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('02-JAN-2024', 'DD-MON-YYYY'), TO_DATE('02-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M002', 'Zainal Abidin', '010-6840075', 'zainalabidin@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('02-JAN-2024', 'DD-MON-YYYY'), TO_DATE('02-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M003', 'Roslan Mustafa', '018-2362146', 'roslanmustafa@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('02-JAN-2024', 'DD-MON-YYYY'), TO_DATE('02-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M004', 'Chan Mei Ling', '012-7452110', 'chanmeiling@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('02-JAN-2024', 'DD-MON-YYYY'), TO_DATE('02-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M005', 'Aisyah Rahman', '015-7660463', 'aisyahrahman@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('03-JAN-2024', 'DD-MON-YYYY'), TO_DATE('03-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M006', 'Ng Siew Ling', '011-7490268', 'ngsiewling@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('03-JAN-2024', 'DD-MON-YYYY'), TO_DATE('03-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M007', 'Tan Cheng Ho', '018-5072841', 'tanchengho@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('04-JAN-2024', 'DD-MON-YYYY'), TO_DATE('04-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M008', 'Hafiz Hakim', '011-3907470', 'hafizhakim@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('04-JAN-2024', 'DD-MON-YYYY'), TO_DATE('04-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M009', 'Ahmad Zulkifli', '012-1265831', 'ahmadzulkifli@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('04-JAN-2024', 'DD-MON-YYYY'), TO_DATE('04-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M010', 'Chan Pei Ling', '014-4236352', 'chanpeiling@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('05-JAN-2024', 'DD-MON-YYYY'), TO_DATE('05-JAN-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M011', 'Lim Wei Kang', '014-3668659', 'limweikang@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('08-JAN-2024', 'DD-MON-YYYY'), TO_DATE('08-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M012', 'Nor Hidayah', '014-4563534', 'norhidayah@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('08-JAN-2024', 'DD-MON-YYYY'), TO_DATE('08-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M013', 'James Wong', '012-6061803', 'jameswong@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('09-JAN-2024', 'DD-MON-YYYY'), TO_DATE('09-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M014', 'Lee Kuan Fong', '017-5309622', 'leekuanfong@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('09-JAN-2024', 'DD-MON-YYYY'), TO_DATE('09-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M015', 'Ng Xin Er', '018-2990260', 'ngxiner@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('10-JAN-2024', 'DD-MON-YYYY'), TO_DATE('10-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M016', 'Ng Yi Xin', '014-4234319', 'ngyixin@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('10-JAN-2024', 'DD-MON-YYYY'), TO_DATE('10-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M017', 'Hafiz Halim', '012-1534633', 'hafizhalim@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('11-JAN-2024', 'DD-MON-YYYY'), TO_DATE('11-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M018', 'Ravi Kumar', '018-1434075', 'ravikumar@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('11-JAN-2024', 'DD-MON-YYYY'), TO_DATE('11-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M019', 'Afiz Abdul', '012-9940764', 'afizabdul@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('12-JAN-2024', 'DD-MON-YYYY'), TO_DATE('12-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M020', 'Farah Nabila', '011-3286481', 'farahnabila@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('12-JAN-2024', 'DD-MON-YYYY'), TO_DATE('12-JAN-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M021', 'Mano Akmal', '017-7203099', 'manoakmal@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('15-JAN-2024', 'DD-MON-YYYY'), TO_DATE('15-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M022', 'Nabila Natasha', '017-2347405', 'nabilanatasha@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('15-JAN-2024', 'DD-MON-YYYY'), TO_DATE('15-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M023', 'Daniel Liew', '010-3821424', 'danielliew@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('16-JAN-2024', 'DD-MON-YYYY'), TO_DATE('16-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M024', 'Farah Shaida', '013-5802783', 'farahshaida@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('16-JAN-2024', 'DD-MON-YYYY'), TO_DATE('16-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M025', 'Benjamin Koh', '013-4159288', 'benjaminkoh@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('17-JAN-2024', 'DD-MON-YYYY'), TO_DATE('17-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M026', 'Sazrina Rahman', '013-3789198', 'sazrinarahman@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('17-JAN-2024', 'DD-MON-YYYY'), TO_DATE('17-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M027', 'Farah Azahari', '016-6278206', 'farahazahari@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('18-JAN-2024', 'DD-MON-YYYY'), TO_DATE('18-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M028', 'sofia Zulkifli', '018-4269398', 'sofiazulkifli@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('18-JAN-2024', 'DD-MON-YYYY'), TO_DATE('18-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M029', 'Lee Le Xuan', '017-5284130', 'leelexuan@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('19-JAN-2024', 'DD-MON-YYYY'), TO_DATE('19-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M030', 'Jane Tan', '015-8803365', 'janetan@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('19-JAN-2024', 'DD-MON-YYYY'), TO_DATE('19-JAN-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M031', 'Toh Siew Ling', '011-5362479', 'tohsiewling@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('22-JAN-2024', 'DD-MON-YYYY'), TO_DATE('22-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M032', 'Iris Yong', '017-1840960', 'irisyong@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('22-JAN-2024', 'DD-MON-YYYY'), TO_DATE('22-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M033', 'Nor Marsyah', '019-7291315', 'normarsyah@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('23-JAN-2024', 'DD-MON-YYYY'), TO_DATE('23-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M034', 'Siti Laila', '018-8675068', 'sitilaila@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('24-JAN-2024', 'DD-MON-YYYY'), TO_DATE('24-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M035', 'Lim Yong Kang', '018-1933138', 'limyongkang@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('24-JAN-2024', 'DD-MON-YYYY'), TO_DATE('24-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M036', 'Adam Hakim', '013-9810470', 'adamhakim@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('24-JAN-2024', 'DD-MON-YYYY'), TO_DATE('24-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M037', 'Phoebe Leong', '017-6171472', 'phoebeleong@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('25-JAN-2024', 'DD-MON-YYYY'), TO_DATE('25-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M038', 'Victor Loke', '016-1613926', 'victorloke@yahoo.com', '56 Jalan Petaling, Kuala Lumpur, Malaysia', 'active', TO_DATE('26-JAN-2024', 'DD-MON-YYYY'), TO_DATE('26-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M039', 'Susan Lee', '016-5335978', 'susanlee@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('26-JAN-2024', 'DD-MON-YYYY'), TO_DATE('26-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M040', 'You Qing', '011-6345117', 'youqing@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('26-JAN-2024', 'DD-MON-YYYY'), TO_DATE('26-JAN-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M041', 'Robiatul', '018-2150204', 'robiatul@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('29-JAN-2024', 'DD-MON-YYYY'), TO_DATE('29-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M042', 'Farah Nabita', '017-6954965', 'farahnabita@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('30-JAN-2024', 'DD-MON-YYYY'), TO_DATE('30-JAN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M043', 'Lois Lim', '018-6271245', 'loislim@yahoo.com', '56 Jalan Petaling, Kuala Lumpur, Malaysia', 'active', TO_DATE('31-JAN-2024', 'DD-MON-YYYY'), TO_DATE('31-JAN-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M044', 'Seth Phan', '010-4472665', 'sethphan@yahoo.com', '56 Jalan Petaling, Kuala Lumpur, Malaysia', 'active', TO_DATE('01-FEB-2024', 'DD-MON-YYYY'), TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M045', 'Siti Nazri', '018-9956705', 'sitinazri@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('02-FEB-2024', 'DD-MON-YYYY'), TO_DATE('02-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M046', 'Lee Wei Hong', '010-7286930', 'leeweihong@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('05-FEB-2024', 'DD-MON-YYYY'), TO_DATE('05-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M047', 'Tan Cheng Li', '011-8374230', 'tanchengli@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('06-FEB-2024', 'DD-MON-YYYY'), TO_DATE('06-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M048', 'Joseph Kong', '017-2321573', 'josephkong@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('07-FEB-2024', 'DD-MON-YYYY'), TO_DATE('07-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M049', 'Jason Lee', '016-3135483', 'jasonlee@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('08-FEB-2024', 'DD-MON-YYYY'), TO_DATE('08-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M050', 'Justin Hakim', '012-4050265', 'justinhakim@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('09-FEB-2024', 'DD-MON-YYYY'), TO_DATE('09-FEB-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M051', 'Atika Nabila', '017-5549708', 'atikanabila@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('12-FEB-2024', 'DD-MON-YYYY'), TO_DATE('12-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M052', 'Naz Nabila', '010-3240988', 'naznabila@yahoo.com', '56 Jalan Petaling, Kuala Lumpur, Malaysia', 'active', TO_DATE('13-FEB-2024', 'DD-MON-YYYY'), TO_DATE('13-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M053', 'Hannah Lee', '010-5844968', 'hannahlee@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('14-FEB-2024', 'DD-MON-YYYY'), TO_DATE('14-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M054', 'Ng Ming Hao', '018-9801445', 'ngminghao@yahoo.com', '56 Jalan Petaling, Kuala Lumpur, Malaysia', 'active', TO_DATE('15-FEB-2024', 'DD-MON-YYYY'), TO_DATE('15-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M055', 'Lee Pei Yong', '015-4999752', 'leepeiyong@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('16-FEB-2024', 'DD-MON-YYYY'), TO_DATE('16-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M056', 'Peter Tan', '011-6779271', 'petertan@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('19-FEB-2024', 'DD-MON-YYYY'), TO_DATE('19-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M057', 'Nor Dalia', '012-3157233', 'nordalia@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('20-FEB-2024', 'DD-MON-YYYY'), TO_DATE('20-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M058', 'Louise Tan', '011-1045011', 'louisetan@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('21-FEB-2024', 'DD-MON-YYYY'), TO_DATE('21-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M059', 'Lam Kar Yee', '011-8282769', 'lamkaryeew@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('22-FEB-2024', 'DD-MON-YYYY'), TO_DATE('22-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M060', 'Jared Chin', '015-9634029', 'jaredchin@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('23-FEB-2024', 'DD-MON-YYYY'), TO_DATE('23-FEB-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M061', 'Toh Sheng Yi', '018-2063136', 'tohshengyi@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('26-FEB-2024', 'DD-MON-YYYY'), TO_DATE('26-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M062', 'Samuel Lee', '010-6677866', 'samuellee@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('27-FEB-2024', 'DD-MON-YYYY'), TO_DATE('27-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M063', 'Ahmad Akim', '010-4397017', 'ahmadakim@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('28-FEB-2024', 'DD-MON-YYYY'), TO_DATE('28-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M064', 'Oscar Chin', '012-4435085', 'oscarchin@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('28-FEB-2024', 'DD-MON-YYYY'), TO_DATE('28-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M065', 'Laila Abdul', '010-1864993', 'lailaabdul@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('01-MAR-2024', 'DD-MON-YYYY'), TO_DATE('01-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M066', 'Phan Wei Min', '013-9182024', 'phanweimin@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('05-MAR-2024', 'DD-MON-YYYY'), TO_DATE('05-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M067', 'Santhi', '018-6547826', 'santhi@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('05-MAR-2024', 'DD-MON-YYYY'), TO_DATE('05-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M068', 'Jason Lau', '013-3001205', 'jasonlau@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('06-MAR-2024', 'DD-MON-YYYY'), TO_DATE('06-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M069', 'Aina Rahman', '019-1036211', 'ainarahman@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('07-MAR-2024', 'DD-MON-YYYY'), TO_DATE('07-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M070', 'Sabrina', '018-4154557', 'sabrina@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('08-MAR-2024', 'DD-MON-YYYY'), TO_DATE('08-MAR-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M071', 'John Wong', '019-4022534', 'johnwong@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('11-MAR-2024', 'DD-MON-YYYY'), TO_DATE('11-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M072', 'Shaun Lee', '014-7336273', 'shaunlee@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('12-MAR-2024', 'DD-MON-YYYY'), TO_DATE('12-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M073', 'Alice Danilia', '014-2797322', 'alicedanilia@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('12-MAR-2024', 'DD-MON-YYYY'), TO_DATE('12-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M074', 'Denise Lau', '013-2951050', 'deniselau@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('12-MAR-2024', 'DD-MON-YYYY'), TO_DATE('12-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M075', 'Natasya', '012-5427762', 'natasya@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('15-MAR-2024', 'DD-MON-YYYY'), TO_DATE('15-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M076', 'Lai Hui Min', '016-7712727', 'laihuimin@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('18-MAR-2024', 'DD-MON-YYYY'), TO_DATE('18-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M077', 'Eunice Koh', '014-8504386', 'eunicekoh@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('19-MAR-2024', 'DD-MON-YYYY'), TO_DATE('19-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M078', 'John Loo', '017-3415029', 'johnloo@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('20-MAR-2024', 'DD-MON-YYYY'), TO_DATE('20-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M079', 'Steven Kang', '013-1797767', 'stevenkang@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('21-MAR-2024', 'DD-MON-YYYY'), TO_DATE('21-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M080', 'Siti Aisyah', '013-6932693', 'sitiaisyah@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('22-MAR-2024', 'DD-MON-YYYY'), TO_DATE('22-MAR-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M081', 'Jenn Loh', '011-2839906', 'jennloh@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('25-MAR-2024', 'DD-MON-YYYY'), TO_DATE('25-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M082', 'Jerry Chan', '013-9805452', 'jerrychan@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('26-MAR-2024', 'DD-MON-YYYY'), TO_DATE('26-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M083', 'Fadwah Nur', '016-8250195', 'fadwahnur@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('27-MAR-2024', 'DD-MON-YYYY'), TO_DATE('27-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M084', 'Zahir Abdullah', '018-4248177', 'zahirabdullah@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('28-MAR-2024', 'DD-MON-YYYY'), TO_DATE('28-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M085', 'Mohd Ali', '010-6055087', 'mohdali@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('29-MAR-2024', 'DD-MON-YYYY'), TO_DATE('29-MAR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M086', 'Raj Kumar', '013-8455141', 'rajkumar@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('01-APR-2024', 'DD-MON-YYYY'), TO_DATE('01-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M087', 'Lai Pei Li', '017-9972698', 'laipeili@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('02-APR-2024', 'DD-MON-YYYY'), TO_DATE('02-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M088', 'Dania Akmir', '012-3172074', 'daniaakmir@yahoo.com', '56 Jalan Petaling, Kuala Lumpur, Malaysia', 'active', TO_DATE('03-APR-2024', 'DD-MON-YYYY'), TO_DATE('03-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M089', 'Fatin Aniz', '013-8187303', 'fatinaniz@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('04-APR-2024', 'DD-MON-YYYY'), TO_DATE('04-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M090', 'Chan Xin', '019-7536297', 'chanxin@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('05-APR-2024', 'DD-MON-YYYY'), TO_DATE('05-APR-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M091', 'Kevin Ho', '014-4513724', 'kevinho@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('08-APR-2024', 'DD-MON-YYYY'), TO_DATE('08-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M092', 'Alia', '017-3630085', 'alia@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('09-APR-2024', 'DD-MON-YYYY'), TO_DATE('09-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M093', 'Brandon Yong', '016-9363897', 'brandonyong@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('10-APR-2024', 'DD-MON-YYYY'), TO_DATE('10-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M094', 'Athirah Dinie', '012-2356857', 'athirahdinie@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('11-APR-2024', 'DD-MON-YYYY'), TO_DATE('11-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M095', 'Divagari', '013-9016583', 'divagari@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('12-APR-2024', 'DD-MON-YYYY'), TO_DATE('12-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M096', 'Rowena Lau', '018-2446848', 'rowenalau@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('15-APR-2024', 'DD-MON-YYYY'), TO_DATE('15-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M097', 'Rafiz Ali', '019-9741062', 'rafizali@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('16-APR-2024', 'DD-MON-YYYY'), TO_DATE('16-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M098', 'Mano', '012-6124113', 'mano@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('17-APR-2024', 'DD-MON-YYYY'), TO_DATE('17-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M099', 'Isma Farah', '011-4235815', 'ismafarah@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('18-APR-2024', 'DD-MON-YYYY'), TO_DATE('18-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M100', 'Teng Yee Leng', '010-7373513', 'tengyeeleng@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('19-APR-2024', 'DD-MON-YYYY'), TO_DATE('19-APR-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M101', 'Vianne Koh', '014-9982562', 'viannekoh@yahoo.com', '32 Jalan Tun Razak, Kuala Lumpur, Malaysia', 'active', TO_DATE('22-APR-2024', 'DD-MON-YYYY'), TO_DATE('22-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M102', 'Nur Faizah', '015-6751189', 'nurfaizah@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('23-APR-2024', 'DD-MON-YYYY'), TO_DATE('23-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M103', 'Ahmad Kamil', '011-7543668', 'ahmadkamil@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('24-APR-2024', 'DD-MON-YYYY'), TO_DATE('24-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M104', 'Noor Shahidah', '016-2376708', 'noorshahidah@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('25-APR-2024', 'DD-MON-YYYY'), TO_DATE('25-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M105', 'Hani Henderson', '014-3568450', 'hanihenderson@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('26-APR-2024', 'DD-MON-YYYY'), TO_DATE('26-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M106', 'Chan Yew Fah', '013-9753757', 'chanyewfah@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('29-APR-2024', 'DD-MON-YYYY'), TO_DATE('29-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M107', 'Nadia', '019-7248058', 'nadia@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('30-APR-2024', 'DD-MON-YYYY'), TO_DATE('30-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M108', 'Liew Xin Jie', '019-3370455', 'liewxinjie@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('30-APR-2024', 'DD-MON-YYYY'), TO_DATE('30-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M109', 'Ravi Kamil', '014-2391133', 'ravikamil@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('30-APR-2024', 'DD-MON-YYYY'), TO_DATE('30-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M110', 'Joey Chin', '017-7845639', 'joeychin@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('03-MAY-2024', 'DD-MON-YYYY'), TO_DATE('03-MAY-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M111', 'Rabi Akmal', '012-2334070', 'rabiakmal@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('06-MAY-2024', 'DD-MON-YYYY'), TO_DATE('06-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M112', 'Caleb Tee', '012-9503469', 'calebtee@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('07-MAY-2024', 'DD-MON-YYYY'), TO_DATE('07-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M113', 'Dayah Fazli', '013-1396760', 'dayahfazli@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('08-MAY-2024', 'DD-MON-YYYY'), TO_DATE('08-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M114', 'Naziera Azwa', '014-5739708', 'nazieraazwa@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('09-MAY-2024', 'DD-MON-YYYY'), TO_DATE('09-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M115', 'Liew Yao Meng', '016-7006383', 'liewyaomeng@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('10-MAY-2024', 'DD-MON-YYYY'), TO_DATE('10-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M116', 'Farez Pauzi', '017-2476107', 'farezpauzi@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('13-MAY-2024', 'DD-MON-YYYY'), TO_DATE('13-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M117', 'Siti Sabri', '016-3127500', 'sitisabri@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('14-MAY-2024', 'DD-MON-YYYY'), TO_DATE('14-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M118', 'Loo Qing Wei', '015-1942278', 'looqingwei@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('15-MAY-2024', 'DD-MON-YYYY'), TO_DATE('15-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M119', 'Ahmad Ali', '016-4006560', 'ahmadali@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('16-MAY-2024', 'DD-MON-YYYY'), TO_DATE('16-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M120', 'Daniel Ng', '017-9835551', 'danielng@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('17-MAY-2024', 'DD-MON-YYYY'), TO_DATE('17-MAY-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M121', 'Shayah', '017-1702712', 'shayah@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('20-MAY-2024', 'DD-MON-YYYY'), TO_DATE('20-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M122', 'Jay Ho', '017-9113999', 'tjayho@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('21-MAY-2024', 'DD-MON-YYYY'), TO_DATE('21-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M123', 'Rizuan Kamal', '016-3239490', 'rizuankamal@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('22-MAY-2024', 'DD-MON-YYYY'), TO_DATE('22-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M124', 'Ho Chung Yin', '014-7826238', 'hochungyino@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('23-MAY-2024', 'DD-MON-YYYY'), TO_DATE('23-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M125', 'Lee Yew Ming', '011-4061871', 'leeyewming@yahoo.com', '3 Jalan Raja Laut, Kuala Lumpur, Malaysia', 'active', TO_DATE('24-MAY-2024', 'DD-MON-YYYY'), TO_DATE('24-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M126', 'Gordon Cheng', '014-6886591', 'gordoncheng@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('27-MAY-2024', 'DD-MON-YYYY'), TO_DATE('27-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M127', 'Ho Yong Kang', '012-6310197', 'hoyongkang@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('28-MAY-2024', 'DD-MON-YYYY'), TO_DATE('28-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M128', 'Abdul Halim', '010-1288847', 'abdulhalim@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('29-MAY-2024', 'DD-MON-YYYY'), TO_DATE('29-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M129', 'Levi Kong', '017-1070025', 'levikong@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('30-MAY-2024', 'DD-MON-YYYY'), TO_DATE('30-MAY-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M130', 'Salina Laila', '012-5898586', 'salinalaila@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('31-MAY-2024', 'DD-MON-YYYY'), TO_DATE('31-MAY-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M131', 'David Siao', '015-4649845', 'davidsiao@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('03-JUN-2024', 'DD-MON-YYYY'), TO_DATE('03-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M132', 'Safi Nabila', '011-2085400', 'safinabila@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('04-JUN-2024', 'DD-MON-YYYY'), TO_DATE('04-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M133', 'Ng Pei Xi', '010-5963642', 'ngpeixi@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('05-JUN-2024', 'DD-MON-YYYY'), TO_DATE('05-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M134', 'Lee Wen Kang', '014-8835700', 'leewenkang@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('06-JUN-2024', 'DD-MON-YYYY'), TO_DATE('06-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M135', 'Siti Shaliza', '017-8572948', 'sitishaliza@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('07-JUN-2024', 'DD-MON-YYYY'), TO_DATE('07-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M136', 'Mary Loh', '015-7947345', 'maryloh@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('10-JUN-2024', 'DD-MON-YYYY'), TO_DATE('10-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M137', 'Tan Yun Jie', '011-9506378', 'tanyunjie@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('11-JUN-2024', 'DD-MON-YYYY'), TO_DATE('11-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M138', 'Tan Yun Li', '016-1900293', 'tanyunli@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('12-JUN-2024', 'DD-MON-YYYY'), TO_DATE('12-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M139', 'Aida Dinie', '018-4261983', 'aidadinie@yahoo.com', '21 Jalan Damansara, Selangor, Malaysia', 'active', TO_DATE('13-JUN-2024', 'DD-MON-YYYY'), TO_DATE('13-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M140', 'Heti Ariana', '018-3328717', 'hetiariana@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('14-JUN-2024', 'DD-MON-YYYY'), TO_DATE('14-JUN-2025', 'DD-MON-YYYY'));

INSERT INTO Members VALUES ('M141', 'Farhanah Rosli', '017-8826758', 'farhanahrosli@yahoo.com', '14 Jalan Klang Lama, Kuala Lumpur, Malaysia', 'active', TO_DATE('17-JUN-2024', 'DD-MON-YYYY'), TO_DATE('17-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M142', 'Hidayah Sazbri', '014-9665885', 'hidayahsazbri@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('18-JUN-2024', 'DD-MON-YYYY'), TO_DATE('18-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M143', 'Fakrul Hafiz', '010-3497251', 'fakrulhafiz@yahoo.com', '67 Jalan Chow Kit, Kuala Lumpur, Malaysia', 'active', TO_DATE('19-JUN-2024', 'DD-MON-YYYY'), TO_DATE('19-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M144', 'Janis Liew', '012-9211275', 'janisliew@yahoo.com', '90 Jalan Imbi, Kuala Lumpur, Malaysia', 'active', TO_DATE('20-JUN-2024', 'DD-MON-YYYY'), TO_DATE('20-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M145', 'Farez Jaafar', '010-1069283', 'farezjaafar@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('21-JUN-2024', 'DD-MON-YYYY'), TO_DATE('21-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M146', 'Siti Azrina', '017-6809795', 'sitiazrina@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('24-JUN-2024', 'DD-MON-YYYY'), TO_DATE('24-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M147', 'Chan Yau Kee', '010-9417492', 'chanyaukee@yahoo.com', '78 Jalan Bukit Bintang, Kuala Lumpur, Malaysia', 'active', TO_DATE('25-JUN-2024', 'DD-MON-YYYY'), TO_DATE('25-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M148', 'Thavamalar', '015-1343189', 'thavamalar@yahoo.com', '45 Jalan Tunku Abdul Rahman, Kuala Lumpur, Malaysia', 'active', TO_DATE('26-JUN-2024', 'DD-MON-YYYY'), TO_DATE('26-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M149', 'Tai Hui Shan', '014-6538055', 'taihuishan@yahoo.com', '56 Jalan Petaling, Kuala Lumpur, Malaysia', 'active', TO_DATE('27-JUN-2024', 'DD-MON-YYYY'), TO_DATE('27-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO Members VALUES ('M150', 'Ng Rou Ai', '014-8417474', 'ngrouai@yahoo.com', '123 Jalan Ampang, Kuala Lumpur, Malaysia', 'active', TO_DATE('28-JUN-2024', 'DD-MON-YYYY'), TO_DATE('28-JUN-2025', 'DD-MON-YYYY'));

COMMIT;