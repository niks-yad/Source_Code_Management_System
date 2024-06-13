# Source Code Management System
This project was developed as a part of coursework in 2023.
## Overview

This repository contains the SQL scripts necessary to create and initialize a database for managing source code projects, including user management, repository tracking, and collaboration tools such as issues and pull requests.

## Files Included

- `schema.sql` - This script creates all the necessary database tables and establishes the relationships between them.
- `sample entries.sql` - Provides initial data for testing the database, including sample entries for organizations, users, and repositories.

## Getting Started

### Prerequisites

Before running the SQL scripts, ensure you have the following:

- A SQL database system (e.g., MySQL, PostgreSQL) installed and running.
- Access to a database user account that can create tables and insert data.

### Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/niks-yad/Source_Code_Management_System
   cd Source_Code_Management_System
   ```

2. **Create the Database:**
   - Log into your SQL database management system.
   - Create a new database:
     ```sql
     CREATE DATABASE SourceCodeManagement;
     USE SourceCodeManagement;
     ```

3. **Run the Schema Setup Script:**
   - To create the tables and define relationships:
     ```bash
     mysql -u [username] -p SourceCodeManagement < source_code_management_schema.sql
     ```

4. **Insert Sample Data:**
   - Populate the database with initial data:
     ```bash
     mysql -u [username] -p SourceCodeManagement < sample_data.sql
     ```

5. **Verify Installation:**
   - Check if the tables and data are set up correctly:
     ```sql
     SELECT * FROM User;
     SELECT * FROM Organization;
     ```

## Using the Database

After setting up the database and populating it with data, you can start using it to manage your source code projects. Utilize SQL queries to interact with the data, update records, and manage relationships between tables.

The SCM approach has following functional requirement:

Organization – unique identity in the system – name, description, email address.
User – can be part of an organisation – unique identity in the system – consists of their avatar, name, email address, description, followers, and following.
Repo – unique identity (referred when forked), name of the repository, username who owns it (can be an organization), date of initialization, visibility parameter (public/private), reference (branch, tags), contributors on the repo.
Branch – unique identity of branch, name of branch, last commit on that branch, time of update.
Tag – unique identity of tag, name of tag, last commit on that branch, create date.
Commit – unique identity as SHA, author of the commit, committed by user, date of commit, title of the commit, parent commit, author of commit (user committing else’s commit).
Patch – unique index (based on the git diff), name of old blob (in case of rename), name of new file, changes made by additions and deletion of lines of code.
Pull Request – if a commit is made on other user’s repo – this request is generated – have a unique identity, name of the repo, author of the commit, status of pull request, date of creation, date of closure (when status is updated).
Issue – if any user faces a problem in the working of a code – an issue can be raised in the repo – unique identity, author of the issue raised, status of issue, title, description of the issue, date of creation.
Comment – corresponding to a commit, pull request or an issue – has a unique identity, comment content, date of creation, author of the comment.
