create table departments (
	dept_id int primary key auto_increment, 
    dept_name varchar(100) not null,
    location text
);

insert into departments (dept_name, location) values
('Data Analysis', 'Bengaluru, Mumbai, Delhi, Pune'),
('Business Analysis', 'Hyderabad, Mumbai, Pune'),
('Software Development', 'Hyderabad, Chennai, Pune, Bengaluru, Delhi'),
('Full-Stack Development', 'Pune, Noida'),
('UI/UX Design', 'Delhi, Gurugram, Kolkata, Bengaluru'),
('Software Engineering', 'Chennai, Bengaluru, Hyderabad'),
('Technical Support', 'Kolkata, Mumbai, Ahmedabad, Jaipur, Noida'),
('Cybersecurity', 'Noida, Chennai, Gurugram, Hyderabad'),
('Product Management', 'Gurugram, Bengaluru'),
('Human Resources', 'Ahmedabad, Jaipur, Delhi, Kolkata, Mumbai'),
('Project Management', 'Jaipur, Indore, Nagpur, Bhopal'),
('Quality Assurance', 'Indore, Thiruvananthapuram'),
('Training and Development', 'Thiruvananthapuram, Bhopal, Pune, Delhi, Mumbai'),
('Research and Development', 'Bhopal, Bengaluru, Hyderabad, Chennai, Indore'),
('Administration', 'Nagpur, Jaipur');

select * from departments;


create table jobs (
	job_id int primary key auto_increment,
    job_title varchar(100),
    job_desc text,
    dept_id int,
    skills_req text,
    openings int,
    foreign key (dept_id) references departments (dept_id)
);

INSERT INTO jobs (job_title, job_desc, dept_id, skills_req, openings) VALUES
('Data Analyst', 'Responsible for analyzing and interpreting complex data to help make informed business decisions.', 1, 'SQL, Python, Data Visualization, Statistics', 3),
('Business Analyst', 'Identifies business needs and provides solutions to improve organizational performance.', 2, 'Analytical Skills, Communication, Business Acumen', 2),
('Software Developer', 'Develops and maintains software applications according to client needs.', 3, 'Java, C#, Problem Solving, Git', 5),
('Full-Stack Developer', 'Handles both front-end and back-end development tasks.', 4, 'JavaScript, Node.js, React, SQL', 4),
('UI/UX Designer', 'Designs user interfaces and improves user experience for applications.', 5, 'Adobe XD, Figma, CSS, User Research', 2),
('Software Engineer', 'Develops software solutions by studying information needs and system requirements.', 6, 'Java, Python, Software Architecture, Communication', 4),
('Network Engineer', 'Maintains and supports network infrastructure for optimal performance.', 7, 'Networking, Cisco, Troubleshooting, Security', 3),
('Cybersecurity Analyst', 'Monitors, detects, and mitigates cybersecurity threats.', 8, 'Network Security, Threat Analysis, SIEM, Firewalls', 3),
('Product Manager', 'Oversees product lifecycle and ensures successful product development.', 9, 'Project Management, Communication, Market Research', 1),
('HR Manager', 'Manages recruitment, training, and employee relations within the organization.', 10, 'Communication, Interpersonal Skills, HR Policies', 2),
('Project Manager', 'Coordinates project activities and ensures timely project delivery.', 11, 'Project Management, Scheduling, Leadership', 3),
('Quality Assurance Engineer', 'Tests and evaluates software for quality and performance.', 12, 'Testing, Automation, Attention to Detail, Scripting', 3),
('Trainer', 'Provides training and development programs for employees.', 13, 'Presentation Skills, Subject Expertise, Communication', 2),
('Research Scientist', 'Conducts research and development to innovate new solutions.', 14, 'Research Skills, Data Analysis, Creativity', 1),
('Administrative Assistant', 'Supports administrative tasks and manages office operations.', 15, 'Organization, Communication, Time Management', 2);

select * from jobs;


create table salaries (
	sal_id int primary key auto_increment,
    job_id int,
    sal_lpa decimal(10, 2),
    foreign key (job_id) references jobs (job_id)
);

INSERT INTO salaries (job_id, sal_lpa) VALUES
(1, 7.50),   -- Data Analyst
(2, 8.00),   -- Business Analyst
(3, 12.00),  -- Software Developer
(4, 14.50),  -- Full-Stack Developer
(5, 10.00),  -- UI/UX Designer
(6, 15.00),  -- Software Engineer
(7, 6.50),   -- Network Engineer
(8, 13.00),  -- Cybersecurity Analyst
(9, 18.00),  -- Product Manager
(10, 9.00),  -- HR Manager
(11, 11.50), -- Project Manager
(12, 10.50), -- Quality Assurance Engineer
(13, 7.00),  -- Trainer
(14, 16.00), -- Research Scientist
(15, 5.50);  -- Administrative Assistant

select * from salaries;


select j.job_title, d.location, j.openings
from jobs j join departments d
on j.dept_id = d.dept_id;

ALTER TABLE departments
ADD work_mode VARCHAR(10);

UPDATE departments SET work_mode = 'Hybrid' WHERE dept_name = 'Data Analysis';
UPDATE departments SET work_mode = 'Onsite' WHERE dept_name = 'Business Analysis';
UPDATE departments SET work_mode = 'Remote' WHERE dept_name = 'Software Development';
UPDATE departments SET work_mode = 'Hybrid' WHERE dept_name = 'Full-Stack Development';
UPDATE departments SET work_mode = 'Onsite' WHERE dept_name = 'UI/UX Design';
UPDATE departments SET work_mode = 'Remote' WHERE dept_name = 'Software Engineering';
UPDATE departments SET work_mode = 'Hybrid' WHERE dept_name = 'Technical Support';
UPDATE departments SET work_mode = 'Onsite' WHERE dept_name = 'Cybersecurity';
UPDATE departments SET work_mode = 'Hybrid' WHERE dept_name = 'Product Management';
UPDATE departments SET work_mode = 'Remote' WHERE dept_name = 'Human Resources';
UPDATE departments SET work_mode = 'Onsite' WHERE dept_name = 'Project Management';
UPDATE departments SET work_mode = 'Hybrid' WHERE dept_name = 'Quality Assurance';
UPDATE departments SET work_mode = 'Remote' WHERE dept_name = 'Training and Development';
UPDATE departments SET work_mode = 'Onsite' WHERE dept_name = 'Research and Development';
UPDATE departments SET work_mode = 'Hybrid' WHERE dept_name = 'Administration';

select * from departments;


ALTER TABLE jobs
DROP COLUMN skills_req,
DROP COLUMN openings;

CREATE TABLE job_requirements (
    req_id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT,
    skills_req TEXT,            
    openings INT, 
    experience varchar(10),         
    qualification text,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

INSERT INTO job_requirements (job_id, skills_req, openings, experience, qualification) VALUES
(1, 'Data analysis, SQL, Excel', 15, '2-4 yrs', 'Bachelor\'s in Data Science or related field'),
(2, 'Business analysis, Communication, MS Office', 10, '3-5 yrs', 'Bachelor\'s in Business Administration or related field'),
(3, 'Java, SQL, Problem-solving', 20, '1-3 yrs', 'Bachelor\'s in Computer Science or related field'),
(4, 'JavaScript, HTML, CSS, React', 25, '2-4 yrs', 'Bachelor\'s in Computer Science or related field'),
(5, 'UI/UX design, Adobe XD, Figma', 8, '3-5 yrs', 'Bachelor\'s in Design or related field'),
(6, 'Java, Python, Software Development Life Cycle', 12, '4-6 yrs', 'Bachelor\'s in Computer Science or related field'),
(7, 'Networking, Troubleshooting, Communication skills', 18, '2-3 yrs', 'Bachelor\'s in Information Technology or related field'),
(8, 'Cybersecurity, Risk Analysis, Python', 5, '5-7 yrs', 'Bachelor\'s in Cybersecurity or related field'),
(9, 'Product management, Agile, Leadership', 30, '7-8 yrs', 'Master\'s in Business Administration or related field'),
(10, 'HR Management, Communication, Organization', 22, '2-4 yrs', 'Bachelor\'s in Human Resources or related field'),
(11, 'Project management, Agile, Risk Management', 14, '3-5 yrs', 'Bachelor\'s in Project Management or related field'),
(12, 'Quality Assurance, Testing, SQL', 9, '1-3 yrs', 'Bachelor\'s in Quality Assurance or related field'),
(13, 'Training, Communication, Public Speaking', 6, '0-2 yrs', 'Bachelor\'s in Education or related field'),
(14, 'Research, Data Analysis, Innovation', 17, '5-6 yrs', 'Master\'s in Research or related field'),
(15, 'Administration, MS Office, Organization', 11, '2-4 yrs', 'Bachelor\'s in Administration or related field');

select * from job_requirements;