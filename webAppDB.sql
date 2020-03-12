--
-- Database: `webAppDB`
-- Author(s): James Kitt
--

drop schema if exists webAppDB;
create schema webAppDB;
use webAppDB;

--
-- -- Table Structures -- --
--

--
-- Table structure for table `Locations`
--
CREATE TABLE Locations (
    placeID INT AUTO_INCREMENT PRIMARY KEY,
    POIname VARCHAR(255) UNIQUE NOT NULL,
    POIDescription VARCHAR(500),
    latCoordinate DECIMAL(10 , 7 ),
    longCoordinate DECIMAL(10 , 7 ),
    iconPath VARCHAR(255) NOT NULL,
    Question VARCHAR(255) NOT NULL,
    correctAnswer VARCHAR(255) NOT NULL,
    incorrectAnswer1 VARCHAR(255) NOT NULL,
    incorrectAnswer2 VARCHAR(255) NOT NULL,
    clue VARCHAR(255) NOT NULL
)  ENGINE=INNODB AUTO_INCREMENT=63 DEFAULT CHARSET=LATIN1;

--
-- Table structure for table `users`
--
CREATE TABLE Users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    displayname VARCHAR(255) UNIQUE NOT NULL,
    Username VARCHAR(40) UNIQUE NULL,
    PassW VARCHAR(40) NOT NULL,
    AccessID INTEGER NOT NULL
)  ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=LATIN1;

--
-- Table structure for table `Bookings`
--
CREATE TABLE Bookings (
    bookingID INT AUTO_INCREMENT PRIMARY KEY,
    tourID INT NOT NULL,
    userID INT UNIQUE NULL,
    bookingDate DATETIME NOT NULL,
    lastLocation INT DEFAULT -1,
    score INT
);

--
-- Table structure for table `Tours`
--
CREATE TABLE Tours (
    tourID INT AUTO_INCREMENT PRIMARY KEY,
    creatorID INT NOT NULL,
    creationDate DATETIME NULL,
    tourRoute VARCHAR(255) NOT NULL
)  ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=LATIN1;


-- --------------------------------------------------------
--
-- Dumping data for tables
--

--
-- Dumping data for table `locations`
--

INSERT INTO locations (placeID, poiName, poiDescription, latCoordinate, longCoordinate,
  iconPath, question, correctAnswer, incorrectAnswer1, incorrectAnswer2,
  clue)
   VALUES
(1, 'amory', 'The college of social sciences is housed here, but the lecture
   theatre “Moot Room” is shared as well as a number of smaller areas.',
   '50.736525', '-3.531449', 'A_icon.png', 'How many people can sit in the Moot
   room?', '260', '310', '210', 'Sounds like the french word for love'),
(2, 'queens', 'The building for the Foreign Languages department. It also
  contains lecture theatres shared by all departments.', '50.734125', '-3.534583',
   'Q_icon.png', 'What floor is the FLC on?', 'The second floor', 'The first
   floor', 'The third floor', 'The creator of Bohemian Rhapsody'),
(3, 'business_school', 'The University of Exeter Business School, based in
  Exeter and Penryn in Cornwall, has approximately 3,900 students, studying
  courses in Management, Economics, Accounting and Finance and teaches the
  Exeter MBA.', '50.735580', '-3.529921', 'B_icon.png', 'This building has another
   name, what is it?', 'Building One', 'Harrison', 'Hatherly', 'Where you learn
   to run a company'),
(4, 'bill_douglas_cinema_museum', 'The Bill Douglas Cinema Museum is home to one
   of the largest collections of material relating to the moving image in
   Britain. It’s both an accredited public museum and an academic research
   facility and it holds a collection of over 75,000 items.', '50.733403',
   '-3.534194', 'B_icon.png', 'How many items are ib display here?', '1000',
   '2000', '3000', 'An exhibition dedicated to a filmmaker'),
(5, 'alexander', 'A new facility exclusively used for the Drama Department of
  the university. It houses 5 rehearsal spaces 2 seminar rooms and 2 general
  purpose rooms.', '50.729917', '-3.538355', 'A_icon.png', 'Names after Lord
  Alexander of Weedon QC, what significance does he have to the university?',
  'Former chancellor', 'Former dean', 'Current dean', 'The name is shared with a
  great king of Macedonia'),
(6, 'byrne_house', 'Owned by the University, it is used as office space for
  Egenis, the Centre for the Study of Life.','50.734465', '-3.525386', 'B_icon.png',
  'Now due for demolition what is the name of the building', 'Spreytonway',
  'Daytonaway', 'Huntingway', 'You can say it is like a ring of fire'),
(7, 'catholic_chaplaincy', 'The Catholic Chaplaincy, located in Glenthorne Road,
   has excellent facilities including a chapel, fully licensed bar, meeting
   rooms, library and extensive landscaped gardens with BBQ area.', '50.738346',
    '-3.544190', 'C_icon.png', 'What time is Sunday mass?', '11:30am', '10:30am',
    '12:00am', 'Church?'),
(8, 'clayden', 'Provides computational teaching and accommodation for the Q-Step
   Centre.','50.732655','-3.538693', 'C_icon.png', 'How much money is has been
   invested into the Q-step program throughout the UK', '£19.5 million', '£21
   million', '£10 million', 'Rhymes with "K den..."'),
(9, 'cornwall_house', 'The home of the Lemon Grove and other social areas such
  as the Grove Diner.', '50.735038', '-3.529618', 'C_icon.png', 'When is pancake
  day in the diner?', 'Everyday', 'Monday', 'Thursday', 'Kernow House'),
(10, 'cornwall_house_swimming_pool', 'The home of the Lemon Grove and other
  social areas such as the Grove Diner.', '50.734522', '-3.529325', 'C_icon.png',
  'How hot is the pool?', '29 degrees Celcius', '35 degrees celcius', '25 degrees
  celcius', 'You may go for a splash'),
(11, 'devonshire_house', 'From study space to activity rooms, the Guild boasts a
   range of different spaces to suit your needs. ', '50.735153', '-3.534298',
   'D_icon.png', 'The loft study space in the Devonshire house can seat how many
   people?', '118 people', '120', '110', 'The home of the county you`re in'),
(12, 'digital_humanities_lab', 'The Digital Humanities Lab is a state of the art
   facility offering unique spaces, equipment and training for staff and
   students. A specialist team conducts and supports innovative Digital
   Humanities research, offers training and teaching, and undertakes the digital
   preservation and display of historic material and artefacts using advanced
   technologies.', '50.733972', '-3.534376', 'D_icon.png', 'How much money has been
   invested into this building?', '£1.2 million', '£900 k', '£1.8 million',
   'Computerized arts workshop'),
(13, 'exeter_northcott_theatre', 'A theatre space that holds lectures as well as
   shows throughout the academic year.','50.735883', '-3.535268', 'E_icon.png',
   'What year was the theatre opened?', '1967', '1977', '1978', 'Up, baby bed,
   stage'),
(14, 'estate_service_centre', 'Ensures that campus is fit for service',
  '50.735199', '-5.540634', 'E_icon.png', 'Who is the director of these services?',
  'Hugh McCann', 'Doug McCann', 'Mitchel Russo', 'Initials E.S.C'),
(15, 'family_centre', 'There is a new nursery on the Streatham Campus. Owlets
  provides high quality childcare and early learning for babies from 3 months to
   five years old. ', '50.736777', '-3.537898', 'F_icon.png', 'How many children
   can the centre hold?', '104', '110', '95', 'The place for children'),
(16, 'the_forum', 'The Forum is a centrepiece, located at the heart of the
  Streatham Campus. It contains many areas including the largest lecture theatre
  on the Streatham campus. ','50.735449', '-3.533207', 'F_icon.png', 'How much
  money was invested into the Forum?', '£48 million', '£21 million', '£30 million',
  'SID lives here'),
(17, 'geoffrey_pope', 'The Geoffrey Pope building, the central hub of
  Biosciences in Exeter, is one of the tallest buildings on Streatham Campus and
   has magnificent views over the campus and the Exe Valley. ', '50.736658',
   '-3.535081', 'G_icon.png', 'How many aquaria rooms are there?', '14', '7',
   '21', 'Of a similar name to the position of head of the Catholic Church'),
(18, 'great_hall_and_university_reception', 'The Great Hall is located at the
  very heart of the University of Exeter Streatham Campus. it has played host to
   an impressive range of live performances. ', '50.735521', '-3.534507',
   'G_icon.png', 'How many people can it seat?', '1500', '1200', '1800', 'It is
   a good corridor'),
(19, 'harrison', 'The Home of CEMPS (College of Engineering Mathematics and
  Physical Sciences)', '50.737759', '-3.532615', 'H_icon.png', 'How many students
  can be seated in 004?', '167', '214', '148', 'Mr Ford of the Star Wars series
  shares this buildings name.'),
(20, 'hatherly', 'There are two laboratories here run by the Medical School are
  led by Professor Andrew Randall and Professor Robert Pawlak. ', '50.734029',
  '-3.533141', 'H_icon.png', 'Partly funded by the Alzheimers Society, how old
  is this organisation?', '40 years old', '35 years old', '29 years old', 'On the
  prince of Wales road one can find laboratories'),
(21, 'henry_wellcome_building_for_biocatalysis', 'This building houses the Exeter
   Biocatalysis centre which is a multidisciplinary centre that has been
   established to study enzymes', '50.736726', '-3.535614', 'H_icon.png', 'Enzymes
   can be defined as what?', 'Natures Catalysts', 'Natures reagents', 'Natures
   guardians', 'Not a welcome building but a wellcome building'),
(22, 'hope_hall', 'Hope Hall accommodates research and administrative staff from
   the College of Engineering, Mathematics and Physical Sciences, postgraduate
   students of the Business School and the Health, Safety and Environment
   Office. ', '50.733847', '-3.526583', 'H_icon.png', 'This building has a bar
   inside, what is the name of this bar?', 'The Badger bar', 'The Ram', 'The Fox
   hole', 'An optimistic building'),
(23, 'innovation_centre', 'Originally a separate building for start-up companies
   from the University is now being transformed into the home of the Comp Sci
   Department.', '50.738360', '-3.531078', 'I_icon.png', 'In what year was Augusta
    Ada Lovelace whom the Lovelace lab was named after born?', '1815', '1915',
    '1875','This building is said to be revolutionary'),
(24, 'institute_of_arab_and_islamic_studies', 'The Institute of Arab and Islamic
   Studies is a centre for research and teaching in the Arab and Muslim world.',
	 '50.736378', '-3.537213', 'I_icon.png', 'The Sharjah Scholarship is available
   to Marabic students, how much is this scholarship?', '£1,500 per year',
   '£1,000 per year', '£2,000 per year', 'This building is built in a middle
   eastern theme'),
(25, 'into_international_study_centre', 'The focus of the INTO University of
  Exeter joint venture is to provide academic pathways that enable international
   students to progress to University of Exeter degree programmes. ',
    '50.736098', '-3.533812', 'I_icon.png', 'Approximately how many different
    nationalities of students attend the university?', '130', '120', '100', 'The
    opposite of OUT OF'),
(26, 'kay_building', 'Formerly known as the Kay Laboratories, this building is
  adjacent to the Harrison Building. ', '50.737745', '-3.531855', 'K_icon.png',
  'Who is this building named after?', 'Harry Kay (former vice-chancellor)',
  'Kay Michaels (former Dean)', 'Richard Kay (prominent philanthropist)', 'It has a
  large chimney'),
(27, 'kay_house_duryard', 'Refurbished in recent years, the University’s
  state-of-the-art music facility is an incredibly versatile venue. The building
   includes five big event spaces, each holding between 80 and 200 people. ',
   '50.740977', '-3.544562', 'K_icon.png', 'what is the name of the theatre space?',
   'Broadwood', 'Broadway', 'Breakwood', 'K'),
(28, 'knightley', 'Stategy and security institute and college of social sciences
   and international studies', '50.732628', '-3.538142', 'K_icon.png', 'What
   fields are taught and researched in the Strategy and Security Institute?',
   'Global Security and strategy, particularly in regards to being under intense
   pressure', 'The global prices of dairy products during times of conflict',
   'Discrete Mathematics', 'Deus Vault'),
(29, 'lafrowda_house', 'Lafrowda house is a large residence on campus on which
  is very close Cornwall house and its social activities', '50.735311',
  '-3.528104', 'L_icon.png', 'How many minutes walk away from lafrowda house is
  the city centre?', '15 minutes', '10 minutes', '20 minutes', 'Large residence
  that overlooks a pool'),
(30, 'laver', 'School of Geography, Archaeology and Earth Resources; IT
  Services. ', '50.737371', '-3.533482', 'L_icon.png', 'Who is this building
  named after?', 'A member of the university council', 'A custodial staff member',
  'A former mayor of Exeter', 'To wash in french'),
(31, 'lazenby', 'This building contains the centre for Rural Policy Research
  which is part of the college of social sciences & international studies',
  '50.734021', '-3.525131', 'L_icon.png', 'What are the A level entry requirements
  for BSc Human Sciences?', 'AAB-ABB', 'AAA-AAB', 'A*AA-AAB', 'blayzen'),
(32, 'library', 'The largest collection of books on the university campus. Open
  to staff and students 24/7.', '50.735175', '-3.531898', 'L_icon.png', 'How many
  floors are there in the library?', '3', '4', '1', 'Where you might find a
  selection of reading materials'),
(33, 'living_systems', 'The Living Systems Institute (LSI) pioneer’s
  transformative science to engineer control of complex biological systems. LSI
  merges research in biology and medicine with ground breaking physical sciences
  technologies and powerful mathematical modelling capabilities. ', '50.737068',
  '-3.534877', 'L_icon.png', 'When was LSI opened?', '2016', '2015', '2010', 'A
  system that is not dead is a...'),
(34, 'mary_harris_memorial_chapel', 'A Chapel situate at the heart of Streatham
  campus where everyone is welcome not just university members', '50.733530',
  '-3.534708', 'M_icon.png', 'What time can you atend Choral Eucharist or
  Evensong at the chapel on Sundays?', '7 pm', '8 pm', '6 pm', 'A religious
  building dedicated to someone with initials M.H.'),
(35, 'newman_building', 'A collection of shared lecture theatres.', '50.736527',
   '-3.535866', 'N_icon.png', 'How many seats are in Newman Blue?', '350', '400',
   '300', 'You have a friend in singer song writer Randy ______'),
(36, 'northcote_house', 'Where the majority of administrative staff are located
  including, estate patrol. timetabling, and financial services.', '50.735320',
  '-3.535000', 'N_icon.png', 'Name after Stafford Northcote, what was his title?',
  'First earl of Iddesleigh', 'Duke of Iddesleigh', 'First earl of Kent', 'Up,
  coat, home'),
(37, 'old_library', 'The Old Library is open throughout the academic year as a
  self-service library. The building also has seminar rooms that are shared. ',
  '50.733276', '-3.534085', 'O_icon.png', 'On what level is seminar room C?',
  '-1', '0', '1', 'Ancient book place'),
(38, 'peter_chalk_centre', 'Seminar Rooms and study spaces are available here.',
   '50.736252', '-3.536090', 'P_icon.png', 'What is the name of the cafe in Peter
    Chalk', 'Barisca', 'Batista', 'Costa', 'Rabbit Draw Middle'),
(39, 'physics', 'The largst building on campus standing at 38m and built in
  1967', '50.737179', '-3.536048', 'P_icon.png', 'How many floors does this
  building have?', '11 (including below ground)', '13 (including below ground)',
  '9', 'The tall one'),
(40, 'the_ram', 'Open from 09:00 every day, bringing you freshly prepared pub
  grub and friendly service, the Ram Bar is your social hub on campus. From
  regular quiz nights and Rameoke, to pre-Lemmy bar on Saturdays, we have
  something for everyone.', '50.735228', '-3.534398', 'R_icon.png', 'How much
  are the curly fries?', '£2.25', '£2.75', '£3.00', 'Random Access Memory'),
(41, 'redcot', 'The residence of the Vice chancellor of the university',
  '50.733330', '-3.538249', 'R_icon.png', 'What tree in the garden of Redcot
  produced fruit in 2008 for the first time in 15 years?', 'Banana', 'Tomato',
  'Plum', 'Maroon baby bed'),
(42, 'reed_hall', 'A grade II listed building that’s used for events and
  meetings, set in wonderful gardens', '50.735231', '-3.537504', 'R_icon.png',
  'How many people can be seated in the dining hall', '140 persons', '100
  persons', '50 persons', 'The old mansion'),
(43, 'reed_mews_wellbeing_centre', 'This is the first Wellbeing centre ever
  opened on campus', '50.735996', '-3.538275', 'R_icon.png', 'In which month of
  2012 did this centre open?','September', 'March', 'February', 'Where you can
  go if you are concerned about your mental health'),
(44, 'roborough', 'This building hosts three large rehearsal spaces that are
  fully equiped for lighting and sound. The spaces can be opened up into one huge
   flat-floored performance space.', '50.733227', '-3.535198', 'R_icon.png',
   'What was the original purpose of this building when it first opened in 1940?',
   'The university library', 'The university kitchen', 'The university bathhouse',
   'A place that offers great practice spaces for the drama department'),
(45, 'russell_seal_fitness_centre', 'A fitness centre situated on Streatham
  campus that aims to provide the ultimate Gym experience to its customers.',
  '50.737995', '-3.536727', 'R_icon.png', 'How many pieces of Cardio equipment
  are there in the Gym?', 'Around 100', 'Around 50', 'Around 200', 'Where you can
   go to play tennis and lift some weights'),
(46, 'sir_christopher_ondaatje_devon_cricket_centre', 'Opened in 2009, the
  £2million Sir Christopher Ondaatje Devon Cricket Centre offers players from
  the University of Exeter and wider community an opportunity to play cricket
  and improve their game.', '50.738364', '-3.537414', 'C_icon.png', 'What is the
  floor area of the indoor playing area?', '800 square meters', '900 square meters',
  '850 square meters', 'Named after a prominent Canadian-english philanthropist
  born in Sri Lanka'),
(47, 'sir_henry_wellcome_building_for_mood_disorders', 'The mood disorder centre
   is a partnership between the NHS and the university of exeter that aims to
   conduct psychological research, assessment, treatment and training to benefit
   people that suffer from depression', '50.733355', '-3.536252', 'H_icon.png',
   'What three domains of activity does the research of the mood disorder work
   within?', 'Understanding, Access, Translation', 'Knowledge, power, responsibility',
   'greatness, sensitivity, confidence', 'Where one may go to study depression'),
(48, 'research', 'This building as connected to the Washington Singer building',
  '50.737613', '-3.532603', 'R', 'What fields does the university offer research
  oppoortunities in?', 'Sciences, social sciences, business, humanities and arts',
  'Social sciences, business, humanities and arts', 'Business, humanities and arts',
   'A building named after an act of investigating something new'),
(49, 'sports_park', 'A large multi-purpose sports facility that contains a gym,
  astroturf pitches, squash courts, sports halls, cricket, Tennis, Golf
  facilities and swimming pools', '50.737798', '-3.537260','S_icon.png', 'How
  much money has been invested in the tennis centre over the last 15 years?',
  '£3 million', '£4 million', '£1.5 million', 'rotpss karp'),
(50, 'st_davids_retail_services', '', '50.729338', '-3.543483', 'D_icon.png',
  '', '', '', '', ''),
(51, 'streatham_court', 'Streatham court is one of three buildings over which
  the business school is spread and is home to the business school career zone.',
  '50.735717', '-3.530950', 'S_icon.png', 'What is the capacity of lecture theatre
  A in streatham court?', '268', '300', '219', 'A court but not one a sport is
  played on'),
(52, 'streatham_farm', '', '50.735231', '-3.532308', 'S_icon.png', '', '', '', '', ''),
(53, 'student_health_centre', 'Where sutdents can go for any minor health
  concerns they may have that they feel do no warrent a trip to the hospital',
  '50.735819', '-3.538091', 'S_icon.png', 'At what time on weekdays excluding
  Tuesdays does the student health centre open?', '8.30am', '9:30am', '8:00am',
  'psuedo hospital'),
(54, 'tennis_centre', 'Home to some of the best facilities in the south west.
  The centre has four indoor acrylic courts, Six indoor covered Matchplay 2
  courts and Two outdoor Macadam court', '50.738854', '-3.536593', 'T_icon.png',
  'Where are the two outdoor Macadam courts located?', 'Mardon Hall', 'Hope
  Hall', 'Westminster Hall', 'stinne rentec'),
(55, 'thornlea', 'A listed building that was the residence of Alderman W.H. Reed,
  former mayor of Exeter', '50.730127', '-3.538668', 'T_icon.png', 'This building
  was referbished in 2006 and its works cost how much?', '£770k', '£900k', '£500k',
  'Evey rose has its...'),
(56, 'university_reception_and_great_hall', 'The reception handles general
  enquiries and visitors to the University and the great hall is where may large
  events take place such as graduation', '50.735447', '-3.534468', 'R_icon.png',
  'What is the number to call the main switchboard at the university?',
  '01392661000', '01392661004', '01392661008', 'The first place you tend to visit
  when you enter a business building'),
(57, 'washington_singer', 'Washington Singer is the home for the Psychology
  department and the College of Life and Environmental Sciences.', '50.733171',
  '-3.536535', 'W_icon.png', 'What was planted at the rear of the builiding in
  2015 as a part of the Plan Bee Campaign?', 'Wildflower Meadow', 'Sunflower
  Meadow', 'Wildflower Field', 'A vocalist from the capital of the USA'),
(58, 'xfi', 'The Xfi centre for Finance and Investment is a graduate teaching
  and research institute which is commited to being a internationally recognised
  centre for excellence in financial market research', '50.736035', '-3.530353',
  'X_icon.png', 'When did the vision of Xfi begin to form?', '2001', '2005',
  '2000', 'It is not Sci-fi it`s...'),
(59, 'car_park_amory', 'This is a car park outside of Amory.', '50.737383', '-3.530348', 'parking1.png', '', '', '', '', ''),
(60, 'car_park_forum', 'This is a car park outside of forum', '50.736247', '-3.534458', 'parking1.png', '', '', '', '', ''),
(61, 'car_park_sports', 'This is a car park outside of the sports park', '50.737641', '-3.536463', 'parking1.png', '', '', '', '', ''),
(62, 'car_park_queens', 'This is a car park outside of Queens', '50.733906', '-3.534868', 'parking1.png', '', '', '', '', '');

--
-- Dumping data for table `users`
--

INSERT INTO users (userID, displayName, username, passW, accessID) VALUES
(1, 'Aaron', 'gamemaster1', 'e74b595aff7c289c373d0c17798aa94ddb7c4278', 1),
(2, 'Saleh', 'student1', 'student', 0),
(3, 'Zain', 'zh290', '3eac329c208657f1d240cf5a24f32c084d8c2557', 0);

--
-- Dumping data for table `tables`
--
INSERT INTO tours (tourID, creatorID,  creationDate, tourRoute) VALUES
(1,1, '2020-02-11','1,5,17,6,3'),
(2,1, '2020-03-11','16,40,11,18,19,23,32,35,38'); -- computer science route


INSERT INTO bookings (bookingID, tourID, userID, bookingDate, score) VALUES
(1,2,1,'2020-03-11', 0);

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE users
MODIFY userID int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE tours
MODIFY tourID int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE bookings
MODIFY bookingID int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;


SELECT
    *
FROM
    locations;

SELECT
    *
FROM
    tours;

SELECT
    *
FROM
    users;

SELECT
    *
FROM
    bookings;
