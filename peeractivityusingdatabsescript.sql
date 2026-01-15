
START TRANSACTION;


DROP TABLE IF EXISTS departments, course, library_resources;

CREATE TABLE departments (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(45) NOT NULL
);

CREATE TABLE course (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department_id int NOT NULL,
    course_name VARCHAR(45) NOT NULL,
    foreign key (department_id) REFERENCES departments(id)
);

CREATE TABLE library_resources (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item_type VARCHAR(45) NOT NULL,
    title VARCHAR(45) NOT NULL,
    is_checked_out BOOL NOT NULL,
    course_id INT NOT NULL,
    foreign key (course_id) REFERENCES course(id)
);

INSERT INTO departments (department_name) VALUES
	('Computer Science'),
    ('History'),
    ('Art');
    
INSERT INTO course (department_id, course_name) VALUES
	(1, 'Intro to Computer Programming'),
    (2, 'World History'),
    (3, 'Painting');

INSERT INTO library_resources (item_type, title, is_checked_out, course_id) VALUES
	('Textbook', 'Programming 101', 0, 1),
    ('Documentary', 'History of Albania', 1, 2),
    ('Art Book', 'On Leonardo da Vinci', 1, 3);

COMMIT;