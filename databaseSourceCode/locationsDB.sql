-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2020 at 12:45 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projectdb`
-- Author(s): James Kitt, Zain Habib
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
`placeID` int(11) NOT NULL,
  `poiName` varchar(255) NOT NULL,
  `poiDescription` varchar(500) DEFAULT NULL,
  `latCoordinate` decimal (10, 7) NOT NULL,
  `longCoordinate` decimal (10, 7) NOT NULL,
  `iconPath`, varchar (255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `clue` varchar(255) NOT NULL,
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--


INSERT INTO `locations` (`placeID`, `poiName`, `poiDescription`,
  `latCoordinate`, `longCoordinate`, `iconPath`, `question`, `answer`, `clue`)
   VALUES
(1, 'Amory', 'The college of social sciences is housed here, but the lecture
   theatre “Moot Room” is shared as well as a number of smaller areas.', '', '',
    '', 'How many people can sit in the Moot room?', '260', 'Sounds like the
    french word for love'),
(2, 'Queen`s', 'The building for the Foreign Languages department. It also
  contains lecture theatres shared by all departments.', '', '', '', 'What floor
   is the FLC on?', 'The second floor', 'The creator of Bohemian Rhapsody'),
(3, 'Business School', 'The University of Exeter Business School, based in
  Exeter and Penryn in Cornwall, has approximately 3,900 students, studying
  courses in Management, Economics, Accounting and Finance and teaches the
  Exeter MBA.', '', '', '', 'This building has another name, what is it?',
  'Building One', 'Where you learn to run a company'),
(4, 'Bill Douglas Cinema Museum', 'The Bill Douglas Cinema Museum is home to one
   of the largest collections of material relating to the moving image in
   Britain. It’s both an accredited public museum and an academic research
   facility and it holds a collection of over 75,000 items.', '', '', '', 'How
   many items are ib display here?', '1000', 'An exhibition dedicated to a film
   maker'),
(5, 'Alexander', 'A new facility exclusively used for the Drama Department of
  the university. It houses 5 rehearsal spaces 2 seminar rooms and 2 general
  purpose rooms. ', '', '', '', 'Names after Lord Alexander of Weedon QC, what
  significance does he have to the university?', 'Former chancellor', 'The name
  is shared with a great king of Macedonia'),
(6, 'Byme House', 'Owned by the University, it is used as office space for
  Egenis, the Centre for the Study of Life.', '', '', '', 'Now due for demolition
   what is the name of the building', 'Spreytonway', 'You can say it is like a
  ring of fire'),
(7, 'Catholic Chaplaincy', 'The Catholic Chaplaincy, located in Glenthorne Road,
   has excellent facilities including a chapel, fully licensed bar, meeting
   rooms, library and extensive landscaped gardens with BBQ area.', '', '', '',
   'What time is Sunday mass?', '11:30am', 'Church?'),
(8, 'Clayden', 'Provides computational teaching and accommodation for the Q-Step
   Centre.', '', '', '', '', '', ''),
(9, 'Cornwall House', 'The home of the Lemon Grove and other social areas such
  as the Grove Diner.', '', '', '', 'When is pancake day in the diner?',
  'Everyday', 'Kernow House'),
(10, 'Cornwall House Swimming Pool', 'The home of the Lemon Grove and other
  social areas such as the Grove Diner.', '', '', '', 'How hot is the pool?', '29
   degrees Celcius', 'You may go for a splash'),
(11, 'Devonshire House', 'From study space to activity rooms, the Guild boasts a
   range of different spaces to suit your needs. ', '', '', '', '', '', 'The home
    of the county you`re in'),
(12, 'Digital Humanities Lab', 'The Digital Humanities Lab is a state of the art
   facility offering unique spaces, equipment and training for staff and
   students. A specialist team conducts and supports innovative Digital
   Humanities research, offers training and teaching, and undertakes the digital
    preservation and display of historic material and artefacts using advanced
    technologies.', '', '', '', 'How much money has been invested into this
    building?', '£1.2 million', 'Computerized arts workshop'),
(13, 'Exeter Northcott Theatre', 'A theatre space that holds lectures as well as
   shows throughout the academic year.', '', '', '', 'What year was the theatre 
   opened?', '1967', 'Up, baby bed, stage'),
(14, 'Estate Service Centre', 'Ensures that campus is fit for service', '', '',
  '', 'Who is the director of these services?', 'Hugh McCann', ''),
(15, 'Family Centre', 'There is a new nursery on the Streatham Campus. Owlets
  provides high quality childcare and early learning for babies from 3 months to
   five years old. ', '', '', '', 'How many children can the centre hold?',
   '104', 'The place for children'),
(16, 'The Forum', 'The Forum is a centrepiece, located at the heart of the
  Streatham Campus. It contains many areas including the largest lecture theatre
   on the Streatham campus. ', '', '', '','', '', 'SID lives here'),
(17, 'Geoffrey Pope', 'The Geoffrey Pope building, the central hub of
  Biosciences in Exeter, is one of the tallest buildings on Streatham Campus and
   has magnificent views over the campus and the Exe Valley. ', '', '', '', 'How
    many aquaria rooms are there?', '14', 'Of a similar name to the position of
    head of the Catholic Church'),
(18, 'Great Hall and University Reception', 'The Great Hall is located at the
  very heart of the University of Exeter Streatham Campus. it has played host to
   an impressive range of live performances. ', '', '','', 'How many people can
   it seat?', '1500', 'It is a good corridor'),
(19, 'Harrison', 'The Home of CEMPS (College of Engineering Mathematics and
  Physical Sciences)', '', '', '', 'How many students can be seated in 004?',
  '167', 'Mr Ford of the Star Wars series shares this buildings name.'),
(20, 'Hatherly', 'There are two laboratories here run by the Medical School are
  led by Professor Andrew Randall and Professor Robert Pawlak. ', '', '', '',
  'Partly funded by the Alzheimers Society, how old is this organisation?', '40
  years old', 'On the prince of Wales road one can find laboratories'),
(21, 'Henry Wellcome Building for Biocatalysis', '', '', '','', '', '', ''),
(22, 'Hope Hall', 'Hope Hall accommodates research and administrative staff from
   the College of Engineering, Mathematics and Physical Sciences, postgraduate
   students of the Business School and the Health, Safety and Environment
   Office. ', '', '', '', 'This building has a bar inside, what is the name of
   this bar?', 'The Badger bar', 'An optimistic building'),
(23, 'Innovation Centre', 'Originally a separate building for start-up companies
   from the University is now being transformed into the home of the Comp Sci
   Department.', '', '', '', 'How many computers are in the lovelace lab?', '',
   'This building is said to be revolutionary'),
(24, 'Institute of Arab and Islamic Studies', 'The Institute of Arab and Islamic
   Studies is a centre for research and teaching in the Arab and Muslim world.',
    '', '', '', 'The Sharjah Scholarship is available to MArabic students, how
    much is this scholarship?', '£1,500 per year', 'This building is built in a
    middle eastern theme'),
(25, 'INTO international Study centre', 'The focus of the INTO University of
  Exeter joint venture is to provide academic pathways that enable international
   students to progress to University of Exeter degree programmes. ', '', '',
   '', 'Approximately how many different nationalities of students attend the
   university?', '130', 'The opposite of OUT OF'),
(26, 'Kay Building', 'Formerly known as the Kay Laboratories, this building is
  adjacent to the Harrison Building. ', '', '','', 'Who is this building named
  after?', 'Harry Kay (former vice-chancellor)', 'It has a large chimney'),
(27, 'Kay House Duryard', 'Refurbished in recent years, the University’s
  state-of-the-art music facility is an incredibly versatile venue. The building
   includes five big event spaces, each holding between 80 and 200 people. ',
   '', '', '', 'what is the name of the theatre space?', 'Broadwood', 'K'),
(28, 'Knightley', 'Stategy and security institute and college of social sciences
   and international studies', '', '', '', '','', 'Deus Vault'),
(29, 'Lafrowda House', '', '' '', '', '','', ''),
(30, 'Laver', 'School of Geography, Archaeology and Earth Resources; IT
  Services. ', '', '', '', 'Who is this building named after?', 'A member of the
   university council', 'To wash in french'),
(31, 'Lazenby', '', '', '', '', '','', ''),
(32, 'Library', 'The largest collection of books on the university campus. Open
  to staff and students 24/7.', '', '', '', 'How many floors are there in the
  library?', '3', 'Where you might find a selection of reading materials'),
(33, 'Living Systems', 'The Living Systems Institute (LSI) pioneer’s
transformative science to engineer control of complex biological systems. LSI
merges research in biology and medicine with ground breaking physical sciences
technologies and powerful mathematical modelling capabilities. ', '', '', '',
'When was LSI opened?', '2016', ''),
(34, 'Mary Harris Memorial Chapel', '', '', '', '', '','', ''),
(35, 'Newman Building', 'A collection of shared lecture theatres.', '', '','',
  'How many seats are in Newman Blue?', '350', 'You have a friend in singer song
   writer Randy ______'),
(36, 'Northcote House', 'Where the majority of administrative staff are located
  including, estate patrol. timetabling, and financial services.', '', '', '',
  'Name after Stafford Northcote, what was his title?', 'First earl of
  Iddesleigh', 'Up, coat, home'),
(37, 'Old Library', 'The Old Library is open throughout the academic year as a
  self-service library. The building also has seminar rooms that are shared. ',
  '', '', '', 'On what level is seminar room C?', '-1', 'Ancient book place'),
(38, 'Peter Chalk Centre', 'Seminar Rooms and study spaces are available here.',
   '', '','', 'How many seminar rooms are there.', '', 'Rabbit Draw Middle'),
(39, 'Physics', 'The largst building on campus standing at 38m and built in
  1967', '', '', '', 'How many floors does this building have?', '11 (including
    below ground)', 'The tall one'),
(40, 'The Ram', 'Open from 09:00 every day, bringing you freshly prepared pub
  grub and friendly service, the Ram Bar is your social hub on campus. From
  regular quiz nights and Rameoke, to pre-Lemmy bar on Saturdays, we have
  something for everyone.', '', '', '', 'How much are the curly fries?' ,
  '£2.25', 'Random Access Memory'),
(41, 'Redcot', '', '', '', '', '', '', ''),
(42, 'Reed Hall', 'A grade II listed building that’s used for events and
  meetings, set in wonderful gardens', '', '', '', 'How many people can be
  seated in the dining hall', '140 persons', 'The old mansion'),
(43, 'Reed Mews Wellbeing Centre', '', '', '', '','', '', ''),
(44, 'Roborough', '', '', '', '', '','', ''),
(45, 'Russell Seal Fitness Centre', '', '', '', '','', '', ''),
(46, 'Sir Christopher Ondaatje Devon Cricket Centre', '', '', '', '', '', '',
   ''),
(47, 'Sir Henry Wellcome Building for Mood Disorders', '', '', '', '', '', '',
   ''),
(48, 'Research', '', '', '', '', '', '', ''),
(49, 'Sports Park', '', '', '', '', '', '', ''),
(50, 'St David`s Retail Services', '', '', '', '', '', '', ''),
(51, 'Streatham Court', '', '', '', '', '','', ''),
(52, 'Streatham Farm', '', '', '', '', '', '', ''),
(53, 'Student Health Centre', '', '', '', '', '', '', ''),
(54, 'Tennis Centre', '', '', '', '', '','', ''),
(55, 'Thomlea', '', '', '', '', '','', ''),
(56, 'University reception and Great Hall', '', '', '', '', '', '', ''),
(57, 'Washington Singer', '', '', '', '', '', '', ''),
(58, 'Xfi', '', '', '', '', '', '', '');


--------------------------------

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
 ADD PRIMARY KEY (`placeID`), ADD UNIQUE KEY `POIname` (`poiName`);


 -------------------------------

 --
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
MODIFY `placeID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
