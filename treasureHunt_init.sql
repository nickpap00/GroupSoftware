drop schema if exists treasuresearch;
create schema treasuresearch;
use treasuresearch;
 
CREATE TABLE POIs (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    POIname VARCHAR(255) UNIQUE NOT NULL,
    POIDescription VARCHAR(255),
    Question VARCHAR(255) NOT NULL,
    Answer VARCHAR(255) NOT NULL,
    clue VARCHAR(255) NOT NULL
);

insert into POIs
(POIName, POIDescription, Question, Answer,clue)
values
('Amory','', '', '',''),
('Queen`s','', '', '',''),
('Business School','', '', '',''),
('Bill Douglas Cinema Museum','', '', '',''),
('Alexander','', '', '',''),
('Byme House','', '', '',''),
('Catholic Chaplaincy','', '', '',''),
('Clayden','', '', '',''),
('Cornwall House','', '', '',''),
('Cornwall House Swimming Pool','', '', '',''),
('Devonshire House','', '', '',''),
('Digital Humanities Lab','', '', '',''),
('Exeter Northcott Theatre','', '', '',''),
('Estate Service Centre','', '', '',''),
('Family Centre','', '', '',''),
('The Forum','', '', '',''),
('Geoffrey Pope','', '', '',''),
('Great Hall and University Reception','', '', '',''),
('Harrison','The Home of CEMPS (College of Engineering Mathematics and Physical Sciences)', 'How many students can be seated in 004?', '167', 'Mr Ford of the Star Wars series shares this buildings name.'),
('Hatherly','', '', '',''),
('Henry Wellcome Building for Biocatalysis','', '', '',''),
('Hope Hall','', '', '',''),
('Innovation Centre','Originally a separate building for start-up companies from the University is now being transformed into the home of the Comp Sci Department.', '', '', ''),
('Institute of Arab and Islamic Studies','', '', '',''),
('INTO international Study centre','', '', '',''),
('Kay Building','', '', '',''),
('Kay House Duryard','', '', '',''),
('Knightley','', '', '',''),
('Lafrowda House','', '', '',''),
('Laver','', '', '',''),
('Lazenby','', '', '',''),
('Library','The largest collection of books on the university campus. Open to staff and students 24/7.', '', '', ''),
('Living Systems','', '', '',''),
('Mary Harris Memorial Chapel','', '', '',''),
('Newman Building','A collection of shared lecture theatres.', 'How many seats are in Newman Blue?', '350',''),
('Northcote House','', '', '',''),
('Old Library','', '', '',''),
('Peter Chalk Centre','Seminar Rooms and study spaces are available here.', 'How many seminar rooms are there.', '','Rabbit Draw Middle'),
('Physics','', '', '',''),
('The Ram','Open from 09:00 every day, bringing you freshly prepared pub grub and friendly service, the Ram Bar is your social hub on campus. From regular quiz nights and Rameoke, to pre-Lemmy bar on Saturdays, we have something for everyone.', '', '', ''),
('Redcot','', '', '',''),
('Reed Hall','', '', '',''),
('Reed Mews Wellbeing Centre','', '', '',''),
('Roborough','', '', '',''),
('Russell Seal Fitness Centre','', '', '',''),
('Sir Christopher Ondaatje Devon Cricket Centre','', '', '',''),
('Sir Henry Wellcome Building for Mood Disorders','', '', '',''),
('Research','', '', '',''),
('Sports Park','', '', '',''),
('St David`s Retail Services','', '', '',''),
('Streatham Court','', '', '',''),
('Streatham Farm','', '', '',''),
('Student Health Centre','', '', '',''),
('Tennis Centre','', '', '',''),
('Thomlea','', '', '',''),
('University reception and Great Hall','', '', '',''),
('Washington Singer','', '', '',''),
('Xfi','', '', '','');

SELECT 
    *
FROM
    POIs;