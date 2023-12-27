USE TaskDB



CREATE TABLE Curators
(
    ID int PRIMARY KEY IDENTITY(1,1),
    [Name] nvarchar(MAX) NOT NULL,
    Surname nvarchar(MAX) NOT NULL
)


CREATE TABLE Departments
(
    ID int PRIMARY KEY IDENTITY(1,1),
	Building int NOT NULL CHECK(Building BETWEEN 1 AND 5),
    Financing money NOT NULL CHECK(Financing >= 0) DEFAULT 0,
    [Name] NVARCHAR(100) NOT NULL UNIQUE,
    FacultyIdentifier  INT NOT NULL UNIQUE FOREIGN KEY REFERENCES [Faculties](ID)
)



CREATE TABLE Faculties
(
    ID int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(100) NOT NULL UNIQUE,
)

CREATE TABLE Groups
(
    ID int PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(10) NOT NULL UNIQUE,
    [Year] int NOT NULL CHECK([Year] BETWEEN 1 AND 5),
    DepartmentId int NOT NULL FOREIGN KEY REFERENCES [Departments](ID)

)

CREATE TABLE GroupsStudents
(
    ID int PRIMARY KEY IDENTITY(1,1),
	GroupId  int NOT NULL FOREIGN KEY REFERENCES  [Groups](ID),
	StudentId  int NOT NULL FOREIGN KEY REFERENCES  [Students](ID),

)


CREATE TABLE GroupsLectures
(
    ID int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    LectureId  int NOT NULL FOREIGN KEY REFERENCES  [Lectures](ID),
    GroupId  int NOT NULL FOREIGN KEY REFERENCES  [Groups](ID),

)

CREATE TABLE Students
(
 ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(MAX) NOT NULL,
    Rating int CHECK(Rating BETWEEN 0 AND 5) NOT NULL,
    [Surname] nvarchar(MAX) NOT NULL,
)



CREATE TABLE Lectures
(
    ID int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
	[Date] date NOT NULL CHECK([Date] < GETDATE()),
    SubjectId int NOT NULL FOREIGN KEY REFERENCES [Subjects](ID),
    TeacherId int NOT NULL FOREIGN KEY REFERENCES [Teachers](ID),
)


CREATE TABLE Subjects
(
    ID int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    [Name] nvarchar(100) NOT NULL UNIQUE,


)

CREATE TABLE Teachers
(
    ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Professor bit NOT NULL DEFAULT 0,
    [Name] nvarchar(MAX) NOT NULL,
    WageRate money CHECK(WageRate > 0) NOT NULL,
    [Surname] nvarchar(MAX) NOT NULL,

)

CREATE TABLE GroupsCurators
(
    ID int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    CuratorId  int NOT NULL FOREIGN KEY REFERENCES  [Curators](ID),
    GroupId  int NOT NULL FOREIGN KEY REFERENCES  [Groups](ID),

)





-- fake data

-- Curators table 20 data insert
INSERT INTO Curators (Name, Surname) VALUES 
    ('John', 'Doe'),
    ('Alice', 'Smith'),
    ('Bob', 'Johnson'),
    ('Emma', 'Williams'),
    ('Michael', 'Jones'),
    ('Olivia', 'Brown'),
    ('Daniel', 'Taylor'),
    ('Sophia', 'Clark'),
    ('William', 'Hill'),
    ('Emily', 'Walker'),
    ('Ethan', 'Anderson'),
    ('Isabella', 'Moore'),
    ('Liam', 'Evans'),
    ('Ava', 'Wilson'),
    ('Noah', 'Thomas'),
    ('Mia', 'Hall'),
    ('James', 'Young'),
    ('Charlotte', 'Carter'),
    ('Benjamin', 'Mitchell'),
    ('Grace', 'Miller');

-- Faculties table 20 data insert
INSERT INTO Faculties (Name) VALUES 
    ('Engineering Faculty'),
    ('Science Faculty'),
    ('Arts Faculty'),
    ('Business Faculty'),
    ('Medical Faculty'),
    ('Law Faculty'),
    ('Social Sciences Faculty'),
    ('Education Faculty'),
    ('Humanities Faculty'),
    ('Music Faculty'),
    ('Sports Sciences Faculty'),
    ('Languages Faculty'),
    ('Mathematics Faculty'),
    ('Communication Faculty'),
    ('Design Faculty'),
    ('Psychology Faculty'),
    ('Environmental Sciences Faculty'),
    ('Political Sciences Faculty'),
    ('Theology Faculty'),
    ('Tourism Faculty');

-- Departments table 20 data insert
INSERT INTO Departments (Building, Financing, Name, FacultyIdentifier) VALUES 
    (1, 50000, 'Computer Science Department', 1),
    (2, 40000, 'Physics Department', 2),
    (3, 60000, 'History Department', 3),
    (4, 55000, 'Marketing Department', 4),
    (1, 70000, 'Cardiology Department', 5),
    (2, 45000, 'Criminal Law Department', 6),
    (3, 57500, 'Sociology Department', 7),
    (4, 42500, 'Elementary Education Department', 8),
    (5, 52500, 'Philosophy Department', 9),
    (1, 44000, 'Musicology Department', 10),
    (2, 49000, 'Sports Management Department', 11),
    (3, 35000, 'English Language and Literature Department', 12),
    (4, 57500, 'Applied Mathematics Department', 13),
    (5, 46500, 'Media Studies Department', 14),
    (1, 43500, 'Graphic Design Department', 15),
    (2, 51000, 'Clinical Psychology Department', 16),
    (3, 45500, 'Environmental Biology Department', 17),
    (4, 47500, 'International Relations Department', 18),
    (5, 49500, 'Divinity Department', 19),
    (1, 40000, 'Tourism Management Department', 20);

-- Groups table 20 data insert
INSERT INTO Groups (Name, Year, DepartmentId) VALUES 
    ('CS101', 1, 1),
    ('PHY202', 2, 2),
    ('HIS303', 3, 3),
    ('MKT101', 1, 4),
    ('MED202', 2, 5),
    ('LAW303', 3, 6),
    ('SOC101', 1, 7),
    ('EDU202', 2, 8),
    ('PHI303', 3, 9),
    ('MUS101', 1, 10),
    ('SPS202', 2, 11),
    ('ENG303', 3, 12),
    ('MAT101', 1, 13),
    ('COM202', 2, 14),
    ('DES303', 3, 15),
    ('PSY101', 1, 16),
    ('BIO202', 2, 17),
    ('IR303', 3, 18),
    ('DIV101', 1, 19),
    ('TOU202', 2, 20);

-- Subjects table 20 data insert
INSERT INTO Subjects (Name) VALUES 
    ('Database Management'),
    ('Quantum Mechanics'),
    ('Ancient Civilizations'),
    ('Marketing Principles'),
    ('Cardiac Physiology'),
    ('Criminal Law Basics'),
    ('Sociological Theories'),
    ('Pedagogy and Teaching Methods'),
    ('Philosophical Ethics'),
    ('Music Composition'),
    ('Sports Marketing'),
    ('English Literature'),
    ('Applied Calculus'),
    ('Media Analysis'),
    ('Graphic Design Fundamentals'),
    ('Clinical Psychology'),
    ('Environmental Biology'),
    ('International Relations Theory'),
    ('Theology Basics'),
    ('Tourism Industry Overview');

-- Teachers table 20 data insert
INSERT INTO Teachers (Professor, Name, WageRate, Surname) VALUES 
    (1, 'Prof. Smith', 60000, 'Brown'),
    (0, 'Dr. Johnson', 50000, 'White'),
    (1, 'Prof. Miller', 70000, 'Black'),
    (0, 'Dr. Williams', 55000, 'Green'),
    (1, 'Prof. Davis', 75000, 'Taylor'),
    (0, 'Dr. Anderson', 48000, 'Jones'),
    (1, 'Prof. Thomas', 65000, 'Clark'),
    (0, 'Dr. Walker', 52000, 'Hill'),
    (1, 'Prof. Wilson', 72000, 'Evans'),
    (0, 'Dr. Hall', 48000, 'Walker'),
    (1, 'Prof. Carter', 68000, 'Anderson'),
    (0, 'Dr. Mitchell', 51000, 'Moore'),
    (1, 'Prof. Young', 69000, 'Carter'),
    (0, 'Dr. Hill', 53000, 'Wilson'),
    (1, 'Prof. Moore', 67000, 'Thomas'),
    (0, 'Dr. Evans', 55000, 'Hall'),
    (1, 'Prof. Brown', 70000, 'Young'),
    (0, 'Dr. Taylor', 49000, 'Carter'),
    (1, 'Prof. Clark', 66000, 'Mitchell'),
    (0, 'Dr. Hill', 51000, 'Wilson');

-- Lectures table 20 data insert
INSERT INTO Lectures ([Date], SubjectId, TeacherId) VALUES 
    ('2023-12-01', 1, 1),
    ('2023-12-02', 2, 2),
    ('2023-12-03', 3, 3),
    ('2023-12-04', 4, 4),
    ('2023-12-05', 5, 5),
    ('2023-12-06', 6, 6),
    ('2023-12-07', 7, 7),
    ('2023-12-08', 8, 8),
    ('2023-12-09', 9, 9),
    ('2023-12-10', 10, 10),
    ('2023-12-11', 11, 11),
    ('2023-12-12', 12, 12),
    ('2023-12-13', 13, 13),
    ('2023-12-14', 14, 14),
    ('2023-12-15', 15, 15),
    ('2023-12-16', 16, 16),
    ('2023-12-17', 17, 17),
    ('2023-12-18', 18, 18),
    ('2023-12-19', 19, 19),
    ('2023-12-20', 20, 20);

-- Students ttable 20 data insert
INSERT INTO Students (Name, Rating, Surname) VALUES 
    ('Emma', 4, 'Smith'),
    ('Michael', 3, 'Jones'),
    ('Olivia', 5, 'Brown'),
    ('Daniel', 2, 'Taylor'),
    ('Sophia', 4, 'Clark'),
    ('William', 5, 'Hill'),
    ('Emily', 3, 'Walker'),
    ('Ethan', 4, 'Anderson'),
    ('Isabella', 2, 'Moore'),
    ('Liam', 5, 'Evans'),
    ('Ava', 4, 'Wilson'),
    ('Noah', 3, 'Thomas'),
    ('Mia', 5, 'Hall'),
    ('James', 2, 'Young'),
    ('Charlotte', 4, 'Carter'),
    ('Benjamin', 5, 'Mitchell'),
    ('Grace', 3, 'Miller'),
    ('Lucas', 4, 'Davis'),
    ('Avery', 2, 'Anderson'),
    ('Luna', 5, 'Hill');

-- GroupsStudents table 20 data insert
INSERT INTO GroupsStudents (GroupId, StudentId) VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20);




INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (5, 10),
    (6, 11),
    (6, 12),
    (7, 13),
    (7, 14),
    (8, 15),
    (8, 16),
    (9, 17),
    (9, 18),
    (10, 19),
    (10, 20);





-- 1. Print numbers of buildings if the total financing fund of the departments located in them exceeds 100,000.
SELECT Building, SUM(Financing) AS TotalFinancing
FROM Departments
GROUP BY Building
HAVING SUM(Financing) > 100000



