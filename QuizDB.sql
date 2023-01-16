IF EXISTS
    (
      SELECT name FROM master.dbo.sysdatabases 
      WHERE name = N'QuizDB'
    )
DROP DATABASE IF EXISTS QuizDB

CREATE DATABASE QuizDB
GO
USE QuizDB
GO

CREATE TABLE category (
  Category_ID INT PRIMARY KEY IDENTITY(1,1),
  Category_Name VARCHAR(50)
);

CREATE TABLE question (
  Question_ID INT PRIMARY KEY IDENTITY(1,1),
  Content VARCHAR(500),
  Category_ID INT,
  FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
);

CREATE TABLE choice (
  Choice_ID INT PRIMARY KEY IDENTITY(1,1),
  Value VARCHAR(500),
  isCorrect BIT,
  Question_ID INT,
  FOREIGN KEY (Question_ID) REFERENCES question(Question_ID)
);

CREATE TABLE users (
  User_ID INT PRIMARY KEY IDENTITY(1,1),
  Username VARCHAR(100),
  Passwords VARCHAR(100),
  Email VARCHAR(100),
  Phone_Num VARCHAR(100),
  DOB VARCHAR(50),
  First_Name VARCHAR(50),
  Last_Name VARCHAR(50)
);

CREATE TABLE quiz (
  Quiz_ID INT PRIMARY KEY IDENTITY(1,1),
  User_ID INT,
  Category_ID int,
  FOREIGN KEY (User_ID) REFERENCES users(User_ID),
  FOREIGN KEY (Category_ID) REFERENCES category(Category_ID)
);

CREATE TABLE feedback (
  Feedback_ID INT PRIMARY KEY IDENTITY(1,1),
  Content VARCHAR(500),
  User_ID INT,
  FOREIGN KEY (User_ID) REFERENCES users(User_ID)
);

CREATE TABLE quiz_question (
  Detail_ID INT PRIMARY KEY IDENTITY(1,1),
  Quiz_ID INT,
  Question_ID INT,
  Selected_ChoiceID INT,
  FOREIGN KEY (Quiz_ID) REFERENCES quiz(Quiz_ID),
  FOREIGN KEY (Question_ID) REFERENCES question(Question_ID)
);

CREATE TABLE quiz_submission (
  Submission_ID INT PRIMARY KEY IDENTITY(1,1),
  Start_Time DATETIME DEFAULT CURRENT_TIMESTAMP,
  End_Time DATETIME DEFAULT CURRENT_TIMESTAMP,
  Score INT,
  User_ID INT,
  Quiz_ID INT,
  FOREIGN KEY (User_ID) REFERENCES users(User_ID),
  FOREIGN KEY (Quiz_ID) REFERENCES quiz(Quiz_ID)
);

INSERT INTO category (Category_Name) VALUES 
('Easy'), 
('Medium'), 
('Hard');

INSERT INTO question (Content, Category_ID) VALUES
('1+1=?',1),

('1+2=?',1),

('1+3=?',1),

('1+4=?',1),

('1+5=?',1),

('1+6=?',1),

('1+7=?',1),

('1+8=?',1),

('1+9=?',1),

('1+10=?',1),

('2+1=?',2),

('2+2=?',2),

('2+3=?',2),

('2+4=?',2),

('2+5=?',2),

('2+6=?',2),

('2+7=?',2),

('2+8=?',2),

('2+9=?',2),

('2+10=?',2),

('3+1=?',3),

('3+2=?',3),

('3+3=?',3),

('3+4=?',3),

('3+5=?',3),

('3+6=?',3),

('3+7=?',3),

('3+8=?',3),

('3+9=?',3),

('3+10=?',3);


INSERT INTO choice ( Value, isCorrect, Question_ID) VALUES
('2',1,1),

('3',0,1),

('1',0,1),

('4',0,1),

('4',0,2),

('3',1,2),

('2',0,2),

('5',0,2),

('4',1,3),

('5',0,3),

('6',0,3),

('7',0,3),

('7',0,4),

('6',0,4),

('5',1,4),

('4',0,4),

('7',0,5),

('6',1,5),

('5',0,5),

('4',0,5),

('7',1,6),

('3',0,6),

('1',0,6),

('4',0,6),

('4',0,7),

('8',1,7),

('2',0,7),

('5',0,7),

('9',1,8),

('5',0,8),

('6',0,8),

('7',0,8),

('7',0,9),

('6',0,9),

('10',1,9),

('4',0,9),

('7',0,10),

('11',1,10),

('5',0,10),

('4',0,10),

('3',1,11),

('2',0,11),

('1',0,11),

('4',0,11),

('6',0,12),

('4',1,12),

('2',0,12),

('5',0,12),

('5',1,13),

('9',0,13),

('6',0,13),

('7',0,13),

('7',0,14),

('9',0,14),

('6',1,14),

('4',0,14),

('9',0,15),

('7',1,15),

('5',0,15),

('4',0,15),

('8',1,16),

('3',0,16),

('1',0,16),

('4',0,16),

('4',0,17),

('9',1,17),

('2',0,17),

('5',0,17),

('10',1,18),

('5',0,18),

('6',0,18),

('7',0,18),

('7',0,19),

('6',0,19),

('11',1,19),

('4',0,19),

('7',0,20),

('12',1,20),

('5',0,20),

('4',0,20),

('4',1,21),

('3',0,21),

('1',0,21),

('5',0,21),

('4',0,22),

('5',1,22),

('2',0,22),

('6',0,22),

('6',1,23),

('5',0,23),

('8',0,23),

('7',0,23),

('8',0,24),

('6',0,24),

('7',1,24),

('4',0,24),

('7',0,25),

('8',1,25),

('5',0,25),

('4',0,25),

('9',1,26),

('3',0,26),

('1',0,26),

('4',0,26),

('4',0,27),

('10',1,27),

('2',0,27),

('5',0,27),

('11',1,28),

('5',0,28),

('6',0,28),

('7',0,28),

('7',0,29),

('6',0,29),

('12',1,29),

('4',0,29),

('7',0,30),

('13',1,30),

('5',0,30),

('4',0,30);


INSERT INTO users (Username, Passwords, Email, Phone_Num, DOB, First_Name, Last_Name) VALUES
('aaron','123','@12345','123','05-27-1996','Aaron','Zhu');

SELECT * FROM category;
SELECT * FROM question;
SELECT * FROM choice;
SELECT * FROM users;