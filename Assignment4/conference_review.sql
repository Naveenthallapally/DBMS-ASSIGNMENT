DROP SCHEMA IF EXISTS CONFERENCE_REVIEW;

CREATE SCHEMA IF NOT EXISTS CONFERENCE_REVIEW;

USE CONFERENCE_REVIEW;

drop table IF EXISTS review;
drop table IF EXISTS paper_reviewer;
drop table IF EXISTS paper;
drop table IF EXISTS author;

drop table IF EXISTS topic;
drop table IF EXISTS reviewer;
#######################################################################
drop procedure IF EXISTS GetPaperReviewer;
drop procedure IF EXISTS GetAuthor;
drop procedure IF EXISTS GetPaper;
drop procedure IF EXISTS GetReviewer;
drop procedure IF EXISTS GetReview;
drop procedure IF EXISTS GetTopic;
#########################################################################


	CREATE TABLE AUTHOR
(
  author_email     VARCHAR(90) NOT NULL, 				
  firstname        VARCHAR(90) NOT NULL,             
  lastname         VARCHAR(90) NOT NULL,             	
  PRIMARY KEY      (author_email)                       
);    




INSERT INTO AUTHOR VALUES ('Nani@gmail.com', 'Nani', 'Kumar');
INSERT INTO AUTHOR VALUES ('Akhil@gmail.com', 'Akhil', 'Puligilla');
INSERT INTO AUTHOR VALUES ('Sai@gmail.com', 'Sai', 'Konda');
INSERT INTO AUTHOR VALUES ('Manoj@gmail.com', 'Manoj', 'Munni');
INSERT INTO AUTHOR VALUES ('Teresa@gmail.com', 'Teresa', 'Brooks');

SELECT * from AUTHOR;
######################################################################


	CREATE TABLE PAPER
(
  paper_id         INT unsigned NOT NULL AUTO_INCREMENT, 
  author_email     VARCHAR(90) NOT NULL,				
  title            VARCHAR(90) NOT NULL,                
  abstract         VARCHAR(2000) NOT NULL,               
  filename         VARCHAR(90) NOT NULL,              
  PRIMARY KEY      (paper_id),                         
  FOREIGN KEY (author_email)							
      REFERENCES author(author_email)
);

INSERT INTO PAPER VALUES (NULL, 'Nani@gmail.com', 'Network security', 'theory and development of computer systems able to perform tasks requires human intelligence,visual percept, speech recog, decision, translation', 'ns_nani');
INSERT INTO PAPER VALUES (NULL, 'Akhil@gmail.com', 'Mobile application', 'Internet computing is the only architecture that supports all information flows and processes over the Internet — providing access to all applications', 'mp_akhil');
INSERT INTO PAPER VALUES (NULL, 'Sai@gmail.com', 'Data Mining', 'extremely large data sets that may be analyzed computationally to reveal patterns, trends, and associations,relating to human behavior and interactions', 'dm_sai');
INSERT INTO PAPER VALUES (NULL, 'Manoj@gmail.com', 'Software Enginnering', 'software package designed to define, manipulate, retrieve and manage data in a database', 'se_manoj');
INSERT INTO PAPER VALUES (NULL, 'Teresa@gmail.com', 'DBMS', 'DBMS is process of discovering patterns in large data involving methods at intersection of machine learning, statistics, database systems', 'dbms_teresa');

SELECT * from PAPER;
###################################################################

	CREATE TABLE REVIEWER
(
  reviewer_email   VARCHAR(90) NOT NULL,				
  firstname        VARCHAR(90) NOT NULL,                
  lastname         VARCHAR(90) NOT NULL,               
  authorfeedback   VARCHAR(200) NOT NULL,               
  commiteefeedback VARCHAR(200) NOT NULL,              
  phonenum		   BIGINT(10) NOT NULL,             
  affiliation	   VARCHAR(90) NOT NULL,            
  PRIMARY KEY      (reviewer_email)                      
);  

INSERT INTO REVIEWER VALUES ('Nani1@gmail.com', 'Nani', 'Kumar', 'Excellent', 'Excellent', 2017631235, 'International Network Security Society');
INSERT INTO REVIEWER VALUES ('Akhil1@gmail.com', 'Akhil', 'Puligilla', 'Excellent', 'Excellent', 1136547892, 'International Mobile Application Society');
INSERT INTO REVIEWER VALUES ('Sai1@gmail.com', 'Sai', 'Konda', 'Excellent', 'Excellent', 9542822202, 'International Data Mining Society');
INSERT INTO REVIEWER VALUES ('Manoj1@gmail.com', 'Manoj', 'Munni', 'Excellent', 'Excellent', 9948727248, 'International Software Engineering Society');
INSERT INTO REVIEWER VALUES ('Teresa1@gmail.com', 'Teresa', 'Brooks', 'Excellent', 'Excellent', 3699633699, 'International DBMS Society');

SELECT * from REVIEWER;
####################################################


	CREATE TABLE REVIEW
(
  review_id        INT unsigned NOT NULL AUTO_INCREMENT, 
  reviewer_email   VARCHAR(90) NOT NULL,                
  recommendation   VARCHAR(90) NOT NULL,               
  meritscore       VARCHAR(90) NOT NULL,                
  readabilityscore VARCHAR(90) NOT NULL,               
  originalityscore VARCHAR(90) NOT NULL,               
  relevancescore   VARCHAR(90) NOT NULL,				
  paper_id         INT unsigned NOT NULL,				 
  PRIMARY KEY     (review_id, paper_id, reviewer_email), 
  FOREIGN KEY (paper_id)								 
      REFERENCES paper(paper_id),
	  
  FOREIGN KEY (reviewer_email)							
	  REFERENCES reviewer(reviewer_email)
);  

INSERT INTO REVIEW VALUES (NULL, 'Nani1@gmail.com', 'Improve the technical content', '9', '10', '10', '10', '1');
INSERT INTO REVIEW VALUES (NULL, 'Akhil1@gmail.com', 'Improve the technical content', '6', '7', '8', '10', '2');
INSERT INTO REVIEW VALUES (NULL, 'Sai1@gmail.com', 'Improve the technical content', '9', '9', '3', '2', '3');
INSERT INTO REVIEW VALUES (NULL, 'Manoj1@gmail.com', 'Improve the technical content', '9', '10', '10', '9', '4');
INSERT INTO REVIEW VALUES (NULL, 'Teresa1@gmail.com', 'Improve the technical content', '10', '10', '8', '9', '5');

SELECT * from REVIEW;
###############################################################

	CREATE TABLE TOPIC
(
  topic_id        INT unsigned NOT NULL AUTO_INCREMENT, 
  reviewer_email  VARCHAR(90) NOT NULL,				
  topicname       VARCHAR(60) NOT NULL,              
  PRIMARY KEY     (topic_id),                           
  FOREIGN KEY (reviewer_email)						
	  REFERENCES reviewer(reviewer_email)
);  

INSERT INTO TOPIC VALUES (NULL, 'Nani1@gmail.com', 'Network Security');
INSERT INTO TOPIC VALUES (NULL, 'Akhil1@gmail.com', 'Mobile Application');
INSERT INTO TOPIC VALUES (NULL, 'Sai1@gmail.com', 'Data Mining');
INSERT INTO TOPIC VALUES (NULL, 'Manoj1@gmail.com', 'Software Engineering');
INSERT INTO TOPIC VALUES (NULL, 'Teresa1@gmail.com', 'DBMS');

SELECT * from TOPIC;
####################################################

	CREATE TABLE PAPER_REVIEWER
(
  paper_id         INT unsigned NOT NULL, 
  reviewer_email   VARCHAR(60) NOT NULL,	
  PRIMARY KEY     (paper_id, reviewer_email), 
  FOREIGN KEY (paper_id)										
	  REFERENCES paper(paper_id),
  FOREIGN KEY (reviewer_email)							 				
	  REFERENCES reviewer(reviewer_email)
);    

INSERT INTO PAPER_REVIEWER VALUES (1, 'Nani1@gmail.com');
INSERT INTO PAPER_REVIEWER VALUES (2, 'Akhil1@gmail.com');
INSERT INTO PAPER_REVIEWER VALUES (3, 'Sai1@gmail.com');
INSERT INTO PAPER_REVIEWER VALUES (4, 'Manoj1@gmail.com');
INSERT INTO PAPER_REVIEWER VALUES (5, 'Teresa1@gmail.com');

SELECT * from PAPER_REVIEWER;
####################################################################