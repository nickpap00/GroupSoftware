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
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `clue` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--


INSERT INTO `locations` (`placeID`, `poiName`, `poiDescription`, `question`, `answer`, `clue`) VALUES
(1, 'Amory', 'The college of social sciences is housed here, but the lecture theatre “Moot Room” is shared as well as a number of smaller areas.', 'How many people can sit in the Moot room?', '260', 'Sounds like the french word for love'),
(2, 'Queen`s', 'The building for the Foreign Languages department. It also contains lecture theatres shared by all departments.', 'What floor is the FLC on?', 'The second floor', 'The creator of Bohemian Rhapsody'),
(3, 'Business School', 'The University of Exeter Business School, based in Exeter and Penryn in Cornwall, has approximately 3,900 students, studying courses in Management, Economics, Accounting and Finance and teaches the Exeter MBA.', 'This building has another name, what is it?', 'Building One', 'Where you learn to run a company'),
(4, 'Bill Douglas Cinema Museum', 'The Bill Douglas Cinema Museum is home to one of the largest collections of material relating to the moving image in Britain. It’s both an accredited public museum and an academic research facility and it holds a collection of over 75,000 items.', 'How many items are ib display here?', '1000', 'An exhibition dedicated to a film maker'),
(5, 'Alexander', 'A new facility exclusively used for the Drama Department of the university. It houses 5 rehearsal spaces 2 seminar rooms and 2 general purpose rooms. ', 'Names after Lord Alexander of Weedon QC, what significance does he have to the university?', 'Former chancellor', 'The name is shared with a great king of Macedonia'),
(6, 'Byme House', 'Owned by the University, it is used as office space for Egenis, the Centre for the Study of Life.', 'Now due for demolition what is the name of the building', 'Spreytonway', 'You can say it is like a ring of fire'),
(7, 'Catholic Chaplaincy', 'The Catholic Chaplaincy, located in Glenthorne Road, has excellent facilities including a chapel, fully licensed bar, meeting rooms, library and extensive landscaped gardens with BBQ area.', 'What time is Sunday mass?', '11:30am', 'Church?'),
(8, 'Clayden', 'Provides computational teaching and accommodation for the Q-Step Centre.', '', '', ''),
(9, 'Cornwall House', 'The home of the Lemon Grove and other social areas such as the Grove Diner.', 'When is pancake day in the diner?', 'Everyday', 'Kernow House'),
(10, 'Cornwall House Swimming Pool', 'The home of the Lemon Grove and other social areas such as the Grove Diner.', 'How hot is the pool?', '29 degrees Celcius', 'You may go for a splash'),
(11, 'Devonshire House', 'From study space to activity rooms, the Guild boasts a range of different spaces to suit your needs. ', '', '', 'The home of the county you`re in'),
(12, 'Digital Humanities Lab', 'The Digital Humanities Lab is a state of the art facility offering unique spaces, equipment and training for staff and students. A specialist team conducts and supports innovative Digital Humanities research, offers training and teaching, and undertakes the digital preservation and display of historic material and artefacts using advanced technologies.', '', '', ''),
(13, 'Exeter Northcott Theatre', 'A theatre space that holds lectures as well as shows throughout the academic year.', '', '', 'Up, baby bed, stage'),
(14, 'Estate Service Centre', '', '', '', ''),
(15, 'Family Centre', '', '', '', ''),
(16, 'The Forum', '', '', '', ''),
(17, 'Geoffrey Pope', '', '', '', ''),
(18, 'Great Hall and University Reception', '', '', '', ''),
(19, 'Harrison', 'The Home of CEMPS (College of Engineering Mathematics and Physical Sciences)', 'How many students can be seated in 004?', '167', 'Mr Ford of the Star Wars series shares this buildings name.'),
(20, 'Hatherly', '', '', '', ''),
(21, 'Henry Wellcome Building for Biocatalysis', '', '', '', ''),
(22, 'Hope Hall', '', '', '', ''),
(23, 'Innovation Centre', 'Originally a separate building for start-up companies from the University is now being transformed into the home of the Comp Sci Department.', '', '', ''),
(24, 'Institute of Arab and Islamic Studies', '', '', '', ''),
(25, 'INTO international Study centre', '', '', '', ''),
(26, 'Kay Building', '', '', '', ''),
(27, 'Kay House Duryard', '', '', '', ''),
(28, 'Knightley', '', '', '', ''),
(29, 'Lafrowda House', '', '' '', ''),
(30, 'Laver', '', '', '', ''),
(31, 'Lazenby', '', '', '', ''),
(32, 'Library', 'The largest collection of books on the university campus. Open to staff and students 24/7.', '', '', ''),
(33, 'Living Systems', '', '', '', ''),
(34, 'Mary Harris Memorial Chapel', '', '', '', ''),
(35, 'Newman Building', 'A collection of shared lecture theatres.', 'How many seats are in Newman Blue?', '350', ''),
(36, 'Northcote House', '', '', '', ''),
(37, 'Old Library', '', '', '', ''),
(38, 'Peter Chalk Centre', 'Seminar Rooms and study spaces are available here.', 'How many seminar rooms are there.', '', 'Rabbit Draw Middle'),
(39, 'Physics', '', '', '', ''),
(40, 'The Ram', 'Open from 09:00 every day, bringing you freshly prepared pub grub and friendly service, the Ram Bar is your social hub on campus. From regular quiz nights and Rameoke, to pre-Lemmy bar on Saturdays, we have something for everyone.', '', '', ''),
(41, 'Redcot', '', '', '', ''),
(42, 'Reed Hall', '', '', '', ''),
(43, 'Reed Mews Wellbeing Centre', '', '', '', ''),
(44, 'Roborough', '', '', '', ''),
(45, 'Russell Seal Fitness Centre', '', '', '', ''),
(46, 'Sir Christopher Ondaatje Devon Cricket Centre', '', '', '', ''),
(47, 'Sir Henry Wellcome Building for Mood Disorders', '', '', '', ''),
(48, 'Research', '', '', '', ''),
(49, 'Sports Park', '', '', '', ''),
(50, 'St David`s Retail Services', '', '', '', ''),
(51, 'Streatham Court', '', '', '', ''),
(52, 'Streatham Farm', '', '', '', ''),
(53, 'Student Health Centre', '', '', '', ''),
(54, 'Tennis Centre', '', '', '', ''),
(55, 'Thomlea', '', '', '', ''),
(56, 'University reception and Great Hall', '', '', '', ''),
(57, 'Washington Singer', '', '', '', ''),
(58, 'Xfi', '', '', '', '');


