# Stemsview Police Case Management System

## Overview
This is a Java Swing application integrated with MySQL for managing police officers and cases. It supports registering new cases, viewing records and handling errors gracefully. Developed using NetBeans IDE and MySQL Workbench.

## Features
- User-friendly GUI with tabs for Officers and Cases.
- CRUD operations (Create, Read, Update, Delete) for officers and cases.
- Database connectivity via JDBC with exception handling.
- Combo boxes for selecting officers, categories, and statuses.
- Input validation and user feedback via popups.

## Dependencies
- Java JDK 8 or higher.
- MySQL Server 8.0+.
- MySQL Connector/J JAR (e.g., mysql-connector-j-8.0.xx.jar).
- NetBeans IDE for development.

## Setup Instructions
1. **Database Setup**:
   - Open MySQL Workbench.
   - Create the database: `CREATE DATABASE crime_management;`.
   - Run the provided SQL script (from crime_management_dump.sql) to create tables and insert lookup data.
   - Note: Use backticks for reserved words like `Rank` in queries.

2. **Configure Database Connection**:
   - Edit `src/db/DBConnection.java`.
   - Update the password: `private static final String PASS = "your_mysql_password";`.

3. **Add JDBC Driver**:
   - Download MySQL Connector/J from https://dev.mysql.com/downloads/connector/j/.
   - In NetBeans: Right-click **Libraries** → **Add JAR/Folder** → Select the JAR file.

4. **Run the Application**:
   - Open `src/gui/MainFrame.java`.
   - Right-click → **Run File** (or Shift + F6).
   - The GUI will launch with Officers and Cases tabs.

## Usage
- **Officers Tab**: Enter details and use buttons to add/update/delete.
- **Cases Tab**: Select from combos, enter date as yyyy-MM-dd, and manage records.
- For updates/deletes: Select a row in the table first.

## Code Quality Notes
- Follows Java naming conventions (camelCase for variables, PascalCase for classes).
- Consistent indentation (4 spaces).
- Comments explain logic in classes and methods.

## Question 5 – Data Capture
Under the README folder is a screenshot of the 5 cases inserted into the system:

Named: q5_screenshot.png

