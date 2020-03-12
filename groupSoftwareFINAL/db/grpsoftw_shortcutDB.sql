-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 12, 2020 at 05:53 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grpsoftw_shortcutDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bookings`
--

CREATE TABLE `Bookings` (
  `bookingID` int(11) NOT NULL,
  `tourID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `bookingDate` datetime NOT NULL,
  `lastLocation` int(40) DEFAULT '-1',
  `score` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Bookings`
--

INSERT INTO `Bookings` (`bookingID`, `tourID`, `userID`, `bookingDate`, `lastLocation`, `score`) VALUES
(1, 2, 1, '2020-03-11 00:00:00', 7, 0),
(2, 2, 2, '2020-03-11 00:00:00', 7, 2),
(3, 2, 3, '2020-03-11 00:00:00', 7, 5),
(4, 2, 4, '2020-03-11 00:00:00', 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Locations`
--

CREATE TABLE `Locations` (
  `placeID` int(11) NOT NULL,
  `POIname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `POIDescription` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latCoordinate` decimal(10,7) DEFAULT NULL,
  `longCoordinate` decimal(10,7) DEFAULT NULL,
  `iconPath` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correctAnswer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `incorrectAnswer1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `incorrectAnswer2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clue` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Locations`
--

INSERT INTO `Locations` (`placeID`, `POIname`, `POIDescription`, `latCoordinate`, `longCoordinate`, `iconPath`, `Question`, `correctAnswer`, `incorrectAnswer1`, `incorrectAnswer2`, `clue`) VALUES
(1, 'amory', 'The college of social sciences is housed here, but the lecture\r\n   theatre Moot Room is shared as well as a number of smaller areas.', '50.7365250', '-3.5314490', 'A_icon.png', 'How many people can sit in the Moot\r\n   room?', '260', '310', '210', 'Sounds like the french word for love'),
(2, 'queens', 'The building for the Foreign Languages department. It also\r\n  contains lecture theatres shared by all departments.', '50.7341250', '-3.5345830', 'Q_icon.png', 'What floor is the FLC on?', 'The second floor', 'The first\r\n   floor', 'The third floor', 'The creator of Bohemian Rhapsody'),
(3, 'business_school', 'The University of Exeter Business School, based in\r\n  Exeter and Penryn in Cornwall, has approximately 3,900 students, studying\r\n  courses in Management, Economics, Accounting and Finance and teaches the\r\n  Exeter MBA.', '50.7355800', '-3.5299210', 'B_icon.png', 'This building has another\r\n   name, what is it?', 'Building One', 'Harrison', 'Hatherly', 'Where you learn\r\n   to run a company'),
(4, 'bill_douglas_cinema_museum', 'The Bill Douglas Cinema Museum is home to one\r\n   of the largest collections of material relating to the moving image in\r\n   Britain. It’s both an accredited public museum and an academic research\r\n   facility and it holds a collection of over 75,000 items.', '50.7334030', '-3.5341940', 'B_icon.png', 'How many items are ib display here?', '1000', '2000', '3000', 'An exhibition dedicated to a filmmaker'),
(5, 'alexander', 'A new facility exclusively used for the Drama Department of\r\n  the university. It houses 5 rehearsal spaces 2 seminar rooms and 2 general\r\n  purpose rooms.', '50.7299170', '-3.5383550', 'A_icon.png', 'Names after Lord\r\n  Alexander of Weedon QC, what significance does he have to the university?', 'Former chancellor', 'Former dean', 'Current dean', 'The name is shared with a\r\n  great king of Macedonia'),
(6, 'byrne_house', 'Owned by the University, it is used as office space for\r\n  Egenis, the Centre for the Study of Life.', '50.7344650', '-3.5253860', 'B_icon.png', 'Now due for demolition what is the name of the building', 'Spreytonway', 'Daytonaway', 'Huntingway', 'You can say it is like a ring of fire'),
(7, 'catholic_chaplaincy', 'The Catholic Chaplaincy, located in Glenthorne Road,\r\n   has excellent facilities including a chapel, fully licensed bar, meeting\r\n   rooms, library and extensive landscaped gardens with BBQ area.', '50.7383460', '-3.5441900', 'C_icon.png', 'What time is Sunday mass?', '11:30am', '10:30am', '12:00am', 'Church?'),
(8, 'clayden', 'Provides computational teaching and accommodation for the Q-Step\r\n   Centre.', '50.7326550', '-3.5386930', 'C_icon.png', 'How much money is has been\r\n   invested into the Q-step program throughout the UK', '£19.5 million', '£21\r\n   million', '£10 million', 'Rhymes with \"K den...\"'),
(9, 'cornwall_house', 'The home of the Lemon Grove and other social areas such\r\n  as the Grove Diner.', '50.7350380', '-3.5296180', 'C_icon.png', 'When is pancake\r\n  day in the diner?', 'Everyday', 'Monday', 'Thursday', 'Kernow House'),
(10, 'cornwall_house_swimming_pool', 'The home of the Lemon Grove and other\r\n  social areas such as the Grove Diner.', '50.7345220', '-3.5293250', 'C_icon.png', 'How hot is the pool?', '29 degrees Celcius', '35 degrees celcius', '25 degrees\r\n  celcius', 'You may go for a splash'),
(11, 'devonshire_house', 'From study space to activity rooms, the Guild boasts a\r\n   range of different spaces to suit your needs. ', '50.7351530', '-3.5342980', 'D_icon.png', 'The loft study space in the Devonshire house can seat how many\r\n   people?', '118 people', '120', '110', 'The home of the county you`re in'),
(12, 'digital_humanities_lab', 'The Digital Humanities Lab is a state of the art\r\n   facility offering unique spaces, equipment and training for staff and\r\n   students. A specialist team conducts and supports innovative Digital\r\n   Humanities research, offers training and teaching, and undertakes the digital\r\n   preservation and display of historic material and artefacts using advanced\r\n   technologies.', '50.7339720', '-3.5343760', 'D_icon.png', 'How much money has been\r\n   invested into this building?', '£1.2 million', '£900 k', '£1.8 million', 'Computerized arts workshop'),
(13, 'exeter_northcott_theatre', 'A theatre space that holds lectures as well as\r\n   shows throughout the academic year.', '50.7358830', '-3.5352680', 'E_icon.png', 'What year was the theatre opened?', '1967', '1977', '1978', 'Up, baby bed,\r\n   stage'),
(14, 'estate_service_centre', 'Ensures that campus is fit for service', '50.7351990', '-5.5406340', 'E_icon.png', 'Who is the director of these services?', 'Hugh McCann', 'Doug McCann', 'Mitchel Russo', 'Initials E.S.C'),
(15, 'family_centre', 'There is a new nursery on the Streatham Campus. Owlets\r\n  provides high quality childcare and early learning for babies from 3 months to\r\n   five years old. ', '50.7367770', '-3.5378980', 'F_icon.png', 'How many children\r\n   can the centre hold?', '104', '110', '95', 'The place for children'),
(16, 'forum', 'The Forum is a centrepiece, located at the heart of the\r\n  Streatham Campus. It contains many areas including the largest lecture theatre\r\n  on the Streatham campus. ', '50.7354490', '-3.5332070', 'F_icon.png', 'How much\r\n  money was invested into the Forum?', '£48 million', '£21 million', '£30 million', 'SID lives here'),
(17, 'geoffrey_pope', 'The Geoffrey Pope building, the central hub of\r\n  Biosciences in Exeter, is one of the tallest buildings on Streatham Campus and\r\n   has magnificent views over the campus and the Exe Valley. ', '50.7366580', '-3.5350810', 'G_icon.png', 'How many aquaria rooms are there?', '14', '7', '21', 'Of a similar name to the position of head of the Catholic Church'),
(18, 'great_hall_and_university_reception', 'The Great Hall is located at the\r\n  very heart of the University of Exeter Streatham Campus. it has played host to\r\n   an impressive range of live performances. ', '50.7355210', '-3.5345070', 'G_icon.png', 'How many people can it seat?', '1500', '1200', '1800', 'It is\r\n   a good corridor'),
(19, 'harrison', 'The Home of CEMPS (College of Engineering Mathematics and\r\n  Physical Sciences)', '50.7377590', '-3.5326150', 'H_icon.png', 'How many students\r\n  can be seated in 004?', '167', '214', '148', 'Mr Ford of the Star Wars series\r\n  shares this buildings name.'),
(20, 'hatherly', 'There are two laboratories here run by the Medical School are\r\n  led by Professor Andrew Randall and Professor Robert Pawlak. ', '50.7340290', '-3.5331410', 'H_icon.png', 'Partly funded by the Alzheimers Society, how old\r\n  is this organisation?', '40 years old', '35 years old', '29 years old', 'On the\r\n  prince of Wales road one can find laboratories'),
(21, 'henry_wellcome_building_for_biocatalysis', 'This building houses the Exeter\r\n   Biocatalysis centre which is a multidisciplinary centre that has been\r\n   established to study enzymes', '50.7367260', '-3.5356140', 'H_icon.png', 'Enzymes\r\n   can be defined as what?', 'Natures Catalysts', 'Natures reagents', 'Natures\r\n   guardians', 'Not a welcome building but a wellcome building'),
(22, 'hope_hall', 'Hope Hall accommodates research and administrative staff from\r\n   the College of Engineering, Mathematics and Physical Sciences, postgraduate\r\n   students of the Business School and the Health, Safety and Environment\r\n   Office. ', '50.7338470', '-3.5265830', 'H_icon.png', 'This building has a bar\r\n   inside, what is the name of this bar?', 'The Badger bar', 'The Ram', 'The Fox\r\n   hole', 'An optimistic building'),
(23, 'innovation_centre', 'Originally a separate building for start-up companies\r\n   from the University is now being transformed into the home of the Comp Sci\r\n   Department.', '50.7383600', '-3.5310780', 'I_icon.png', 'In what year was Augusta\r\n    Ada Lovelace whom the Lovelace lab was named after born?', '1815', '1915', '1875', 'This building is said to be revolutionary'),
(24, 'institute_of_arab_and_islamic_studies', 'The Institute of Arab and Islamic\r\n   Studies is a centre for research and teaching in the Arab and Muslim world.', '50.7363780', '-3.5372130', 'I_icon.png', 'The Sharjah Scholarship is available\r\n   to Marabic students, how much is this scholarship?', '£1,500 per year', '£1,000 per year', '£2,000 per year', 'This building is built in a middle\r\n   eastern theme'),
(25, 'into_international_study_centre', 'The focus of the INTO University of\r\n  Exeter joint venture is to provide academic pathways that enable international\r\n   students to progress to University of Exeter degree programmes. ', '50.7360980', '-3.5338120', 'I_icon.png', 'Approximately how many different\r\n    nationalities of students attend the university?', '130', '120', '100', 'The\r\n    opposite of OUT OF'),
(26, 'kay_building', 'Formerly known as the Kay Laboratories, this building is\r\n  adjacent to the Harrison Building. ', '50.7377450', '-3.5318550', 'K_icon.png', 'Who is this building named after?', 'Harry Kay (former vice-chancellor)', 'Kay Michaels (former Dean)', 'Richard Kay (prominent philanthropist)', 'It has a\r\n  large chimney'),
(27, 'kay_house_duryard', 'Refurbished in recent years, the University’s\r\n  state-of-the-art music facility is an incredibly versatile venue. The building\r\n   includes five big event spaces, each holding between 80 and 200 people. ', '50.7409770', '-3.5445620', 'K_icon.png', 'what is the name of the theatre space?', 'Broadwood', 'Broadway', 'Breakwood', 'K'),
(28, 'knightley', 'Stategy and security institute and college of social sciences\r\n   and international studies', '50.7326280', '-3.5381420', 'K_icon.png', 'What\r\n   fields are taught and researched in the Strategy and Security Institute?', 'Global Security and strategy, particularly in regards to being under intense\r\n   pressure', 'The global prices of dairy products during times of conflict', 'Discrete Mathematics', 'Deus Vault'),
(29, 'lafrowda_house', 'Lafrowda house is a large residence on campus on which\r\n  is very close Cornwall house and its social activities', '50.7353110', '-3.5281040', 'L_icon.png', 'How many minutes walk away from lafrowda house is\r\n  the city centre?', '15 minutes', '10 minutes', '20 minutes', 'Large residence\r\n  that overlooks a pool'),
(30, 'laver', 'School of Geography, Archaeology and Earth Resources; IT\r\n  Services. ', '50.7373710', '-3.5334820', 'L_icon.png', 'Who is this building\r\n  named after?', 'A member of the university council', 'A custodial staff member', 'A former mayor of Exeter', 'To wash in french'),
(31, 'lazenby', 'This building contains the centre for Rural Policy Research\r\n  which is part of the college of social sciences & international studies', '50.7340210', '-3.5251310', 'L_icon.png', 'What are the A level entry requirements\r\n  for BSc Human Sciences?', 'AAB-ABB', 'AAA-AAB', 'A*AA-AAB', 'blayzen'),
(32, 'library', 'The largest collection of books on the university campus. Open\r\n  to staff and students 24/7.', '50.7351750', '-3.5318980', 'L_icon.png', 'How many\r\n  floors are there in the library?', '3', '4', '1', 'Where you might find a\r\n  selection of reading materials'),
(33, 'living_systems', 'The Living Systems Institute (LSI) pioneer’s\r\n  transformative science to engineer control of complex biological systems. LSI\r\n  merges research in biology and medicine with ground breaking physical sciences\r\n  technologies and powerful mathematical modelling capabilities. ', '50.7370680', '-3.5348770', 'L_icon.png', 'When was LSI opened?', '2016', '2015', '2010', 'A\r\n  system that is not dead is a...'),
(34, 'mary_harris_memorial_chapel', 'A Chapel situate at the heart of Streatham\r\n  campus where everyone is welcome not just university members', '50.7335300', '-3.5347080', 'M_icon.png', 'What time can you atend Choral Eucharist or\r\n  Evensong at the chapel on Sundays?', '7 pm', '8 pm', '6 pm', 'A religious\r\n  building dedicated to someone with initials M.H.'),
(35, 'newman_building', 'A collection of shared lecture theatres.', '50.7365270', '-3.5358660', 'N_icon.png', 'How many seats are in Newman Blue?', '350', '400', '300', 'You have a friend in singer song writer Randy ______'),
(36, 'northcote_house', 'Where the majority of administrative staff are located\r\n  including, estate patrol. timetabling, and financial services.', '50.7353200', '-3.5350000', 'N_icon.png', 'Name after Stafford Northcote, what was his title?', 'First earl of Iddesleigh', 'Duke of Iddesleigh', 'First earl of Kent', 'Up,\r\n  coat, home'),
(37, 'old_library', 'The Old Library is open throughout the academic year as a\r\n  self-service library. The building also has seminar rooms that are shared. ', '50.7332760', '-3.5340850', 'O_icon.png', 'On what level is seminar room C?', '-1', '0', '1', 'Ancient book place'),
(38, 'peter_chalk_centre', 'Seminar Rooms and study spaces are available here.', '50.7362520', '-3.5360900', 'P_icon.png', 'What is the name of the cafe in Peter\r\n    Chalk', 'Barisca', 'Batista', 'Costa', 'Rabbit Draw Middle'),
(39, 'physics', 'The largst building on campus standing at 38m and built in\r\n  1967', '50.7371790', '-3.5360480', 'P_icon.png', 'How many floors does this\r\n  building have?', '11 (including below ground)', '13 (including below ground)', '9', 'The tall one'),
(40, 'the_ram', 'Open from 09:00 every day, bringing you freshly prepared pub\r\n  grub and friendly service, the Ram Bar is your social hub on campus. From\r\n  regular quiz nights and Rameoke, to pre-Lemmy bar on Saturdays, we have\r\n  something for everyone.', '50.7352280', '-3.5343980', 'R_icon.png', 'How much\r\n  are the curly fries?', '£2.25', '£2.75', '£3.00', 'Random Access Memory'),
(41, 'redcot', 'The residence of the Vice chancellor of the university', '50.7333300', '-3.5382490', 'R_icon.png', 'What tree in the garden of Redcot\r\n  produced fruit in 2008 for the first time in 15 years?', 'Banana', 'Tomato', 'Plum', 'Maroon baby bed'),
(42, 'reed_hall', 'A grade II listed building that’s used for events and\r\n  meetings, set in wonderful gardens', '50.7352310', '-3.5375040', 'R_icon.png', 'How many people can be seated in the dining hall', '140 persons', '100\r\n  persons', '50 persons', 'The old mansion'),
(43, 'reed_mews_wellbeing_centre', 'This is the first Wellbeing centre ever\r\n  opened on campus', '50.7359960', '-3.5382750', 'R_icon.png', 'In which month of\r\n  2012 did this centre open?', 'September', 'March', 'February', 'Where you can\r\n  go if you are concerned about your mental health'),
(44, 'roborough', 'This building hosts three large rehearsal spaces that are\r\n  fully equiped for lighting and sound. The spaces can be opened up into one huge\r\n   flat-floored performance space.', '50.7332270', '-3.5351980', 'R_icon.png', 'What was the original purpose of this building when it first opened in 1940?', 'The university library', 'The university kitchen', 'The university bathhouse', 'A place that offers great practice spaces for the drama department'),
(45, 'russell_seal_fitness_centre', 'A fitness centre situated on Streatham\r\n  campus that aims to provide the ultimate Gym experience to its customers.', '50.7379950', '-3.5367270', 'R_icon.png', 'How many pieces of Cardio equipment\r\n  are there in the Gym?', 'Around 100', 'Around 50', 'Around 200', 'Where you can\r\n   go to play tennis and lift some weights'),
(46, 'sir_christopher_ondaatje_devon_cricket_centre', 'Opened in 2009, the\r\n  £2million Sir Christopher Ondaatje Devon Cricket Centre offers players from\r\n  the University of Exeter and wider community an opportunity to play cricket\r\n  and improve their game.', '50.7383640', '-3.5374140', 'C_icon.png', 'What is the\r\n  floor area of the indoor playing area?', '800 square meters', '900 square meters', '850 square meters', 'Named after a prominent Canadian-english philanthropist\r\n  born in Sri Lanka'),
(47, 'sir_henry_wellcome_building_for_mood_disorders', 'The mood disorder centre\r\n   is a partnership between the NHS and the university of exeter that aims to\r\n   conduct psychological research, assessment, treatment and training to benefit\r\n   people that suffer from depression', '50.7333550', '-3.5362520', 'H_icon.png', 'What three domains of activity does the research of the mood disorder work\r\n   within?', 'Understanding, Access, Translation', 'Knowledge, power, responsibility', 'greatness, sensitivity, confidence', 'Where one may go to study depression'),
(48, 'research', 'This building as connected to the Washington Singer building', '50.7376130', '-3.5326030', 'R', 'What fields does the university offer research\r\n  oppoortunities in?', 'Sciences, social sciences, business, humanities and arts', 'Social sciences, business, humanities and arts', 'Business, humanities and arts', 'A building named after an act of investigating something new'),
(49, 'sports_park', 'A large multi-purpose sports facility that contains a gym,\r\n  astroturf pitches, squash courts, sports halls, cricket, Tennis, Golf\r\n  facilities and swimming pools', '50.7377980', '-3.5372600', 'S_icon.png', 'How\r\n  much money has been invested in the tennis centre over the last 15 years?', '£3 million', '£4 million', '£1.5 million', 'rotpss karp'),
(50, 'st_davids_retail_services', '', '50.7293380', '-3.5434830', 'D_icon.png', '', '', '', '', ''),
(51, 'streatham_court', 'Streatham court is one of three buildings over which\r\n  the business school is spread and is home to the business school career zone.', '50.7357170', '-3.5309500', 'S_icon.png', 'What is the capacity of lecture theatre\r\n  A in streatham court?', '268', '300', '219', 'A court but not one a sport is\r\n  played on'),
(52, 'streatham_farm', '', '50.7352310', '-3.5323080', 'S_icon.png', '', '', '', '', ''),
(53, 'student_health_centre', 'Where sutdents can go for any minor health\r\n  concerns they may have that they feel do no warrent a trip to the hospital', '50.7358190', '-3.5380910', 'S_icon.png', 'At what time on weekdays excluding\r\n  Tuesdays does the student health centre open?', '8.30am', '9:30am', '8:00am', 'psuedo hospital'),
(54, 'tennis_centre', 'Home to some of the best facilities in the south west.\r\n  The centre has four indoor acrylic courts, Six indoor covered Matchplay 2\r\n  courts and Two outdoor Macadam court', '50.7388540', '-3.5365930', 'T_icon.png', 'Where are the two outdoor Macadam courts located?', 'Mardon Hall', 'Hope\r\n  Hall', 'Westminster Hall', 'stinne rentec'),
(55, 'thornlea', 'A listed building that was the residence of Alderman W.H. Reed,\r\n  former mayor of Exeter', '50.7301270', '-3.5386680', 'T_icon.png', 'This building\r\n  was referbished in 2006 and its works cost how much?', '£770k', '£900k', '£500k', 'Evey rose has its...'),
(56, 'university_reception_and_great_hall', 'The reception handles general\r\n  enquiries and visitors to the University and the great hall is where may large\r\n  events take place such as graduation', '50.7354470', '-3.5344680', 'R_icon.png', 'What is the number to call the main switchboard at the university?', '01392661000', '01392661004', '01392661008', 'The first place you tend to visit\r\n  when you enter a business building'),
(57, 'washington_singer', 'Washington Singer is the home for the Psychology\r\n  department and the College of Life and Environmental Sciences.', '50.7331710', '-3.5365350', 'W_icon.png', 'What was planted at the rear of the builiding in\r\n  2015 as a part of the Plan Bee Campaign?', 'Wildflower Meadow', 'Sunflower\r\n  Meadow', 'Wildflower Field', 'A vocalist from the capital of the USA'),
(58, 'xfi', 'The Xfi centre for Finance and Investment is a graduate teaching\r\n  and research institute which is commited to being a internationally recognised\r\n  centre for excellence in financial market research', '50.7360350', '-3.5303530', 'X_icon.png', 'When did the vision of Xfi begin to form?', '2001', '2005', '2000', 'It is not Sci-fi it`s...'),
(59, 'car_park_amory', 'This is a car park outside of Amory.', '50.7373830', '-3.5303480', 'parking1.png', '', '', '', '', ''),
(60, 'car_park_forum', 'This is a car park outside of forum', '50.7362470', '-3.5344580', 'parking1.png', '', '', '', '', ''),
(61, 'car_park_sports', 'This is a car park outside of the sports park', '50.7376410', '-3.5364630', 'parking1.png', '', '', '', '', ''),
(62, 'car_park_queens', 'This is a car park outside of Queens', '50.7339060', '-3.5348680', 'parking1.png', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Tours`
--

CREATE TABLE `Tours` (
  `tourID` int(11) NOT NULL,
  `creatorID` int(11) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `tourRoute` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tours`
--

INSERT INTO `Tours` (`tourID`, `creatorID`, `creationDate`, `tourRoute`) VALUES
(1, 1, '2020-03-12 00:00:00', '1,5,17,6,3'),
(2, 1, '2020-03-12 00:00:00', '16,40,11,18,19,23,32,35,38');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `userID` int(11) NOT NULL,
  `displayname` varchar(255) NOT NULL,
  `Username` varchar(40) DEFAULT NULL,
  `PassW` varchar(40) NOT NULL,
  `AccessID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userID`, `displayname`, `Username`, `PassW`, `AccessID`) VALUES
(1, 'Aaron', 'kernow', 'aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d', 0),
(2, 'Saleh', 'saleh', '3eac329c208657f1d240cf5a24f32c084d8c2557', 0),
(3, 'Zain', 'zh290', '3eac329c208657f1d240cf5a24f32c084d8c2557', 0),
(4, 'James', 'jmjk201', '3eac329c208657f1d240cf5a24f32c084d8c2557', 0),
(5, 'Nikos', 'nick1', '3eac329c208657f1d240cf5a24f32c084d8c2557', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD PRIMARY KEY (`bookingID`),
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indexes for table `Locations`
--
ALTER TABLE `Locations`
  ADD PRIMARY KEY (`placeID`),
  ADD UNIQUE KEY `POIname` (`POIname`);

--
-- Indexes for table `Tours`
--
ALTER TABLE `Tours`
  ADD PRIMARY KEY (`tourID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `displayname` (`displayname`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Bookings`
--
ALTER TABLE `Bookings`
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Locations`
--
ALTER TABLE `Locations`
  MODIFY `placeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `Tours`
--
ALTER TABLE `Tours`
  MODIFY `tourID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
