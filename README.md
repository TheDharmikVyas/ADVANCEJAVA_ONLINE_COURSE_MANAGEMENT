# 📚 Online Course Management System

> An Advanced Java-based web application for managing online courses, students, instructors, and enrollments efficiently.

---

## 🖥️ Project Overview

The **Online Course Management System** is a full-featured web application built using **Advanced Java** technologies. It provides a centralized platform for administrators, instructors, and students to manage and access online courses seamlessly.

---

## ✨ Features

### 👨‍💼 Admin
- Manage users (students & instructors)
- Add, update, and delete courses
- View all enrollments and reports
- Assign instructors to courses


### 👨‍🎓 Student
- Browse and enroll in available courses
- View course materials and lectures
- Track personal learning progress
- Manage profile information

---

## 🛠️ Tech Stack

| Layer        | Technology                          |
|--------------|--------------------------------------|
| Language     | Java (Advanced Java / J2EE)          |
| Frontend     | HTML, CSS, JSP                       |
| Backend      | Java Servlets, JDBC                  |
| Database     | PostSQL                              |
| Server       | Apache Tomcat                        |
| Build Tool   | Maven / Manual                       |
| IDE          | Netbeans                             |

---

## 📁 Project Structure

```
ADVANCEJAVA_ONLINE_COURSE_MANAGEMENT/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── controller/       # Servlet Controllers
│   │   │   ├── dao/              # Database Access Layer
│   │   │   ├── model/            # Java Bean / Model Classes
│   │   │   └── util/             # Utility Classes (DB Connection, etc.)
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── web.xml
│   │       ├── views/            # JSP Pages
│   │       ├── css/              # Stylesheets
│   │       ├── js/               # JavaScript Files
│   │       └── images/
│
├── database/
│   └── course_management.sql     # Database Schema & Sample Data
│
├── pom.xml                        # Maven Configuration (if applicable)
└── README.md
```

---

## ⚙️ Getting Started

### Prerequisites

- Java JDK 8 or higher
- Apache Tomcat 10.1
- Postgresql
- Netbeans
- Maven (optional)

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/TheDharmikVyas/ADVANCEJAVA_ONLINE_COURSE_MANAGEMENT.git
cd ADVANCEJAVA_ONLINE_COURSE_MANAGEMENT
```

### 2️⃣ Set Up the Database

1. Open PostgreSQL and create a database:
   ```sql
   CREATE DATABASE course_management;
   ```
2. Import the SQL file:
   ```bash
   postgresql -u root -p course_management < database/course_management.sql
   ```

### 3️⃣ Configure Database Connection

Update the DB credentials in your `DBConnection.java` or `db.properties` file:

```java
String url = "jdbc:postgressql://localhost:3306/course_management";
String username = "your_mysql_username";
String password = "your_mysql_password";
```

### 4️⃣ Deploy on Tomcat

1. Build the project and generate the `.war` file.
2. Copy the `.war` file to Tomcat's `webapps/` directory.
3. Start Tomcat and navigate to:
   ```
   http://localhost:8080/ADVANCEJAVA_ONLINE_COURSE_MANAGEMENT/
   ```

---

## 🗃️ Database Schema

Key tables include:

- `users` — Stores admin, instructor, and student accounts
- `courses` — Course details and metadata
- `enrollments` — Student-course enrollment records
- `course_materials` — Uploaded content linked to courses

---




## 👤 Author

**Dharmik Vyas**  
🔗 [GitHub Profile](https://github.com/TheDharmikVyas)

---

> ⭐ If you found this project helpful, please give it a star on GitHub!
