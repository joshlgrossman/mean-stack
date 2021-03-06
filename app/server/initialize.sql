DROP DATABASE IF EXISTS vote;
CREATE DATABASE vote;

USE vote;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(256) NOT NULL,
  password VARCHAR(256) NOT NULL
);

DROP TABLE IF EXISTS topics;
CREATE TABLE topics (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(256) NOT NULL
);

DROP TABLE IF EXISTS options;
CREATE TABLE options (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(256) NOT NULL,
  topic_id INT NOT NULL,
  FOREIGN KEY (topic_id)
    REFERENCES topics(id)
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS votes;
CREATE TABLE votes (
  id INT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  option_id INT NOT NULL,
  FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE,
  FOREIGN KEY (option_id)
    REFERENCES options(id)
    ON DELETE CASCADE
);
