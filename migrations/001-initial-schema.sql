-- UP

-- users
CREATE TABLE users(
	user_id	INTEGER	PRIMARY KEY AUTOINCREMENT,
	username	TEXT	NOT NULL,
	password	TEXT	NOT NULL,
	first_name	TEXT	NOT NULL,
	last_name	TEXT	NOT NULL,
	profile_pic	TEXT
);

-- posts
CREATE TABLE posts(
	id 	INTEGER	PRIMARY KEY,
	post 	TEXT	NOT NULL
);

-- followers
CREATE TABLE followers(
	userID 	INTEGER	NOT NULL,
	followerID	INTEGER NOT NULL
);

--fake followers
INSERT INTO followers (userID, followerID) VALUES (1,2);
INSERT INTO followers (userID, followerID) VALUES (2,3);
INSERT INTO followers (userID, followerID) VALUES (3,1);
INSERT INTO followers (userID, followerID) VALUES (3,2);
INSERT INTO followers (userID, followerID) VALUES (2,1);

-- fake users
INSERT INTO users (username, password, first_name, last_name) VALUES ('j@smith', 'abc123', 'John', 'Smith');
INSERT INTO users (username, password, first_name, last_name) VALUES ('a@adams', 'ghi789', 'Amy', 'Adams');
INSERT INTO users (username, password, first_name, last_name) VALUES ('j@snow', 'def456', 'John', 'Snow');

-- fake posts
INSERT INTO posts (id, post) VALUES (1, 'https://www.bigstockphoto.com/images/homepage/2016_bigstock_picks.jpg');
INSERT INTO posts (id, post) VALUES (2, 'https://www.sitebuilderreport.com/assets/facebook-stock-up-446fff24fb11820517c520c4a5a4c032.jpg');
INSERT INTO posts (id, post) VALUES (3, 'https://www.bigstockphoto.com/images/homepage/2016_bigstock_video.jpg');


-- create feed table 
-- functions located in posts.js
CREATE TABLE feed AS SELECT user_id, username, profile_pic, post FROM users INNER JOIN posts ON users.user_id = posts.id;

--functions in followers.js
CREATE TABLE followersFeed AS SELECT userID, followerID, username, post FROM followers INNER JOIN feed ON followers.followerID = feed.user_id;

-- DOWN


DROP TABLE users;
DROP TABLE posts;
DROP TABLE feed;
DROP TABLE followers;
DROP TABLE followersFeed;


