--  Design DB model for Guvi Zen class

use zen;

-- USERS

CREATE TABLE users(userid INTEGER AUTO_INCREMENT PRIMARY KEY,username VARCHAR(100),useremail VARCHAR(100),batchid INTEGER);

INSERT INTO users(username,useremail,batchid) VALUES("Punit","punit@gmail.com",26),
                                                    ("Sunil","sunil88@gmail.com",27),
                                                    ("Amit","amiit99@gmail.com",27),
                                                    ("Shamika","shamika@gmail.com",26),
                                                    ("Arohi","arohi@gmail.com",26);



-- codekata
	CREATE TABLE codekata(userid INTEGER, number_of_problems_solved INTEGER, 
    FOREIGN KEY (userid) REFERENCES users(userid));

    INSERT INTO codekata(userid,number_of_problems_solved) VALUES(1,50),(2,80),(3,20),(4,40),(5,75);

    
--  company drives
 CREATE TABLE company_drives(driveid INTEGER AUTO_INCREMENT PRIMARY KEY,userid INTEGER,
 drive_date DATE,company VARCHAR(100), FOREIGN KEY (userid) REFERENCES users(userid));

INSERT INTO  company_drives(userid,drive_date,company) VALUES (3,"2020-1-11","Microsys"),
                                                              (1,"2020-2-17","HCL"),
                                                              (2,"2020-2-15","TCS"),
                                                              (2,"2020-3-21","Zyam"),
                                                              (5,"2020-3-30","M-phasis");

--  mentors
 CREATE TABLE mentors(mentorid INTEGER AUTO_INCREMENT PRIMARY KEY,mentorname VARCHAR(100),
 mentoremail VARCHAR(100));

 INSERT INTO mentors(mentorname,mentoremail) VALUES ("Ajit","ajit888@gmail.com"),
                                                   ("Sudeep","sudeep007@gmail.com"),
                                                   ("Amar","amar985@gmail.com"),
                                                   ("Surya","surya7@gmail.com"),
                                                   ("Akshay","akki111@gmail.com");

 
--  topic
 CREATE TABLE topics(topicid INTEGER AUTO_INCREMENT PRIMARY KEY,topic VARCHAR(200),
 topic_date DATE,mentorid INTEGER,batchid INTEGER,
 FOREIGN KEY (mentorid) REFERENCES mentors(mentorid));

 INSERT INTO  topics(topic,topic_date,mentorid,batchid) VALUES("HTML Basics","2020-08-1",1,26),
                                                               ("CSS Basics","2020-08-2",2,27),
                                                               ("Bootstrap-Grid","2020-08-3",3,27),
                                                               ("JavaScript","2020-08-5",4,26),
                                                               ("React-component","2020-08-7",5,27);

 
--  tasks
CREATE TABLE tasks(taskid INTEGER AUTO_INCREMENT PRIMARY KEY, topicid INTEGER,task VARCHAR(1000),
batchid INTEGER,
FOREIGN KEY (topicid) REFERENCES topics(topicid)
);

INSERT INTO tasks(topicid,task,batchid) VALUES (1,"HTML Task",26),
                                         (2,"CSS Task",27),
                                         (3,"Bootstrap Task",26),
                                         (4,"JavaScript Task",26),
                                         (5,"React Task",27),;

-- attendance
CREATE TABLE attendance(attendanceid INTEGER AUTO_INCREMENT PRIMARY KEY, userid INTEGER,
courseid INTEGER ,topicsid INTEGER, attended BOOLEAN,
FOREIGN KEY (userid) REFERENCES users(userid),
FOREIGN KEY (topicsid) REFERENCES topics(topicsid),
FOREIGN KEY (courseid) REFERENCES courses(courseid)
);
INSERT INTO attendance(userid,courseid,topicsid,attended) VALUES(2,5,5,true),
                                                                (5,1,1,true)
                                                                (1,3,3,false)
                                                                (3,4,4,ture)
                                                                (4,2,2,true);



-- /*query*/
CREATE TABLE queries(queryid INTEGER AUTO_INCREMENT PRIMARY KEY , userid INTEGER, 
querybody VARCHAR(1000),mentorid INTEGER,
FOREIGN KEY (userid) REFERENCES users(userid),FOREIGN KEY (mentorid) REFERENCES mentors(mentorid)
)

INSERT INTO   queries(userid,querybody,mentorid) VALUES(1,"query about HTML",1),
                                                       (3,"query about CSS",5),
                                                       (2,"query about Bootstrap",4),
                                                       (5,"query about JavaScript",3),
                                                       (4,"query about React",2);
