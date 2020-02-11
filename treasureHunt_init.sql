drop schema if exists treasuresearch;
create schema treasuresearch;
use treasuresearch;

CREATE TABLE POIs (
    placeID INT AUTO_INCREMENT PRIMARY KEY,
    POIname VARCHAR(255) UNIQUE NOT NULL,
    POIDescription VARCHAR(500),
    Question VARCHAR(255) NOT NULL,
    Answer VARCHAR(255) NOT NULL,
    clue VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    fName VARCHAR(255) NOT NULL,
    Username VARCHAR(40) UNIQUE NULL,
    PassW VARCHAR(40) NOT NULL,
    AccessID INTEGER NOT NULL
);

insert into POIs
(POIName, POIDescription, Question, Answer, clue)
values
('Amory','The college of social sciences is housed here, but the lecture theatre “Moot Room” is shared as well as a number of smaller areas.', 'How many people can sit in the Moot room?', '260','Sounds like the french word for love'),
('Queen`s','The building for the Foreign Languages department. It also contains lecture theatres shared by all departments.', 'What floor is the FLC on?', 'The second floor','The creator of Bohemian Rhapsody'),
('Business School','The University of Exeter Business School, based in Exeter and Penryn in Cornwall, has approximately 3,900 students, studying courses in Management, Economics, Accounting and Finance and teaches the Exeter MBA.', 'This building has another name, what is it?', 'Building One','Where you learn to run a company'),
('Bill Douglas Cinema Museum','The Bill Douglas Cinema Museum is home to one of the largest collections of material relating to the moving image in Britain. It’s both an accredited public museum and an academic research facility and it holds a collection of over 75,000 items.', 'How many items are ib display here?', '1000','An exhibition dedicated to a film maker'),
('Alexander','A new facility exclusively used for the Drama Department of the university. It houses 5 rehearsal spaces 2 seminar rooms and 2 general purpose rooms. ', 'Names after Lord Alexander of Weedon QC, what significance does he have to the university?', 'Former chancellor','The name is shared with a great king of Macedonia'),
('Byme House','Owned by the University, it is used as office space for Egenis, the Centre for the Study of Life.', 'Now due for demolition what is the name of the building', 'Spreytonway','You can say it is like a ring of fire'),
('Catholic Chaplaincy','The Catholic Chaplaincy, located in Glenthorne Road, has excellent facilities including a chapel, fully licensed bar, meeting rooms, library and extensive landscaped gardens with BBQ area.', 'What time is Sunday mass?', '11:30am','Church?'),
('Clayden','Provides computational teaching and accommodation for the Q-Step Centre.', '', '',''),
('Cornwall House','The home of the Lemon Grove and other social areas such as the Grove Diner.', 'When is pancake day in the diner?', 'Everyday','Kernow House'),
('Cornwall House Swimming Pool','The home of the Lemon Grove and other social areas such as the Grove Diner.', 'How hot is the pool?', '29 degrees Celcius','You may go for a splash'),
('Devonshire House','From study space to activity rooms, the Guild boasts a range of different spaces to suit your needs. ', '', '','The home of the county you`re in'),
('Digital Humanities Lab','The Digital Humanities Lab is a state of the art facility offering unique spaces, equipment and training for staff and students. A specialist team conducts and supports innovative Digital Humanities research, offers training and teaching, and undertakes the digital preservation and display of historic material and artefacts using advanced technologies.', '', '',''),
('Exeter Northcott Theatre','A theatre space that holds lectures as well as shows throughout the academic year.', '', '','Up, baby bed, stage'),
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

insert into users
(fName, username, passW, accessID)
values
('James', 'admin1', sha('AdminP'), 2),
('Aaron', 'gamemaster1', sha('gamemasterP'), 1),
('Saleh', 'student1', sha('userP'), 0);

SELECT
    *
FROM
    POIs;

SELECT
    *
FROM
    users;
    
