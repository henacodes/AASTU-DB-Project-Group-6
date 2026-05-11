# Problem and Requirement Analysis: AASTU Cafeteria Database System

## 1.1 Background of the Organization
Addis Ababa Science and Technology University (AASTU) is one of Ethiopia’s leading public universities, focused on science, engineering, and technology education. The university hosts a significant number of students who rely on campus facilities, including cafeteria services, for their daily meals.

To manage meal distribution, the university uses a student ID-based scanning system that allows students to access breakfast, lunch, and dinner. This system helps regulate entry and ensures basic control over meal distribution.

However, although the system is functional, its data management and analytical capabilities are limited. It does not fully utilize the collected data for reporting, planning, or decision-making purposes.

## 1.2 Problem Statement
The cafeteria system at AASTU currently uses a student ID scanning mechanism to control meal access in a single cafeteria setting. While the system successfully verifies student access, it lacks advanced database functionality to support data analysis and information management.

Specifically, the current system does not provide insights into cafeteria usage patterns such as:
* Peak hours
* High-traffic days
* Meal consumption trends

This limits the university’s ability to effectively plan food preparation, allocate resources, and reduce congestion. Additionally, the system lacks a structured way to provide students with real-time information such as daily meal menus or schedule updates.

## 1.3 General Objective
To redesign and implement an improved database system for a single cafeteria at AASTU that enhances meal access control, data analysis, and information management using student ID scanning.

## 1.4 Specific Objectives
* Analyze the existing cafeteria meal access system and identify its limitations.
* Redesign the database using both MySQL (Relational) and MongoDB (Non-Relational).
* Implement secure ID-based meal tracking.
* Ensure each student can only access one meal per session per day.
* Generate reports on:
    * Peak cafeteria hours
    * High-traffic days
    * Meal consumption trends
* Support retrieval of daily meal menus and schedule updates.

## 1.5 Scope of the Project
### Included:
* Student ID-based meal access control
* Recording meal transactions (Breakfast, Lunch, Dinner)
* Prevention of duplicate meal access per session
* Database design using MySQL and MongoDB
* Storage of timestamps for analytics
* Generation of usage reports
* Storage of meal menus and schedule updates

### Out of Scope:
* Physical hardware integration (actual scanners)
* Student-facing application development (frontend/mobile interface)

## 1.6 Significance of the Project
### For the University:
* Improved resource planning based on usage data.
* Reduced food waste through demand analysis.
* Better decision-making using cafeteria statistics.

### For Students:
* Fair and controlled meal distribution.
* Access to meal schedules and updates.
* Reduced confusion and waiting time.

## 1.7 Methodology and Tools
### Methodology
1.  Study of existing cafeteria system
2.  Requirement analysis
3.  Database design (ER diagrams and normalization)
4.  Implementation using MySQL and MongoDB
5.  Testing and validation
6.  Documentation

### Tools and Technologies
* **MySQL**: Relational database design and queries
* **MongoDB**: Flexible document-based storage
* **Draw.io / Lucidchart**: ER diagrams
* **MySQL Workbench**: Database implementation
* **MongoDB Compass/Atlas**: NoSQL visualization
* **GitHub**: Version control and collaboration

## 1.8 System Requirements

### 1.8.1 Functional Requirements
The system shall:
* Verify student identity before granting access.
* Record each meal transaction (Breakfast, Lunch, Dinner).
* Ensure a student can only access one meal per session per day.
* Reject duplicate meal attempts for the same session.
* Store timestamped records of all meal activities.
* Allow administrators to view cafeteria usage records.
* Generate reports on daily meal consumption, peak hours, and high traffic days.
* Store and retrieve daily meal menus and schedule updates.

### 1.8.2 Non-Functional Requirements
* Ensure data accuracy and integrity.
* Provide fast response time for ID scanning verification.
* Be scalable to handle large numbers of students.
* Maintain high availability during meal hours.
* Ensure security of student data.
* Support reliable data storage using MySQL and MongoDB.
* Be easy to maintain and extend.

---
*This document serves as the developer documentation for the Project. for more contribution, refer to (https://docs.google.com/document/d/1g3s4DMzuxmaKivcCpu94Lx11fk02aFwRQ2_iP13M1YY/edit?usp=sharing).*