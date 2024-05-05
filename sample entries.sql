-- sample data into the Organization table
INSERT INTO Organization (org_id, name, desc, org_email, start_date) VALUES
(1, 'OpenTech', 'Open source technology organization', 'contact@opentech.org', '2020-01-01'),
(2, 'CodeCraft', 'Crafting high-quality code for the community', 'info@codecraft.com', '2021-06-15');

-- sample data into the User table
INSERT INTO User (userid, username, avatar, bio, join_date, org_id) VALUES
(1, 'jdoe', 'https://example.com/avatars/jdoe.png', 'Software Developer interested in open source projects.', '2020-02-01', 1),
(2, 'msmith', 'https://example.com/avatars/msmith.png', 'DevOps Specialist with a passion for automation.', '2020-03-12', 1),
(3, 'ljones', 'https://example.com/avatars/ljones.png', 'Front-end developer and UI/UX enthusiast.', '2021-07-10', 2);

-- sample data into the Repo table
INSERT INTO Repo (repo_id, name, init_date, visibility, userid) VALUES
(1, 'OpenSourceLib', '2022-01-01', 'public', 1),
(2, 'AutoDeploy', '2022-02-15', 'private', 2),
(3, 'UIUXDesigns', '2022-03-20', 'public', 3);
