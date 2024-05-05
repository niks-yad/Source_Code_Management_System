-- Organization Table
CREATE TABLE Organization (
    org_id INT PRIMARY KEY,
    name VARCHAR(255),
    desc TEXT,
    org_email VARCHAR(255),
    start_date DATE
);

-- User Table
CREATE TABLE User (
    userid INT PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    avatar TEXT,
    bio TEXT,
    join_date DATE,
    org_id INT,
    FOREIGN KEY (org_id) REFERENCES Organization(org_id)
);

-- Repo Table
CREATE TABLE Repo (
    repo_id INT PRIMARY KEY,
    name VARCHAR(255),
    init_date DATE,
    visibility VARCHAR(255),
    userid INT,
    FOREIGN KEY (userid) REFERENCES User(userid)
);

-- Branch Table
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(255),
    repo_id INT,
    update_time TIMESTAMP,
    FOREIGN KEY (repo_id) REFERENCES Repo(repo_id)
);

-- Commit Table
CREATE TABLE Commit (
    commit_sha VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255),
    parent_commit VARCHAR(255),
    authored_by INT,
    timestamp TIMESTAMP,
    FOREIGN KEY (authored_by) REFERENCES User(userid)
);

-- Tag Table
CREATE TABLE Tag (
    tag_id INT PRIMARY KEY,
    tag_name VARCHAR(255),
    commit_sha VARCHAR(255),
    create_time TIMESTAMP,
    FOREIGN KEY (commit_sha) REFERENCES Commit(commit_sha)
);

-- Comment Table
CREATE TABLE Comment (
    comment_id INT PRIMARY KEY,
    content TEXT,
    timestamp TIMESTAMP,
    username VARCHAR(255),
    FOREIGN KEY (username) REFERENCES User(username)
);

-- Patch Table
CREATE TABLE Patch (
    patch_id INT PRIMARY KEY,
    commit_sha VARCHAR(255),
    file_name VARCHAR(255),
    changes TEXT,
    prev_blob TEXT,
    curr_blob TEXT,
    add_lines INT,
    rem_lines INT,
    FOREIGN KEY (commit_sha) REFERENCES Commit(commit_sha)
);

-- Issue Table
CREATE TABLE Issue (
    issue_id INT PRIMARY KEY,
    username VARCHAR(255),
    repo_id INT,
    title VARCHAR(255),
    description TEXT,
    open_date DATE,
    status VARCHAR(255),
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (repo_id) REFERENCES Repo(repo_id)
);

-- Pull Request Table
CREATE TABLE PullRequest (
    pr_id INT PRIMARY KEY,
    username VARCHAR(255),
    repo_id INT,
    commit_sha VARCHAR(255),
    description TEXT,
    create_date DATE,
    close_date DATE,
    status VARCHAR(255),
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (repo_id) REFERENCES Repo(repo_id),
    FOREIGN KEY (commit_sha) REFERENCES Commit(commit_sha)
);

-- Optional: Additional Tables for Followers and Followings if needed
CREATE TABLE Followers (
    user_id INT,
    follower_id INT,
    PRIMARY KEY (user_id, follower_id),
    FOREIGN KEY (user_id) REFERENCES User(userid),
    FOREIGN KEY (follower_id) REFERENCES User(userid)
);

CREATE TABLE Followings (
    user_id INT,
    following_id INT,
    PRIMARY KEY (user_id, following_id),
    FOREIGN KEY (user_id) REFERENCES User(userid),
    FOREIGN KEY (following_id) REFERENCES User(userid)
);
