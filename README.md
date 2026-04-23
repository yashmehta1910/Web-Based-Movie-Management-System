# 🎬 MoviesHub

A full-stack movie discovery and watchlist web application built with Java Servlets, JSP, MySQL, and the TMDB API.

---

## 📸 Features

- **User Authentication** — Register and login with server-side validation backed by MySQL
- **Trending Movies** — Browse 12 trending movies on the home dashboard
- **Top Rated Sidebar** — Quick view of top-rated films with posters and ratings
- **Genre Filter** — Filter movies by genre (Comedy, Horror, Sci-Fi, Romance, Animation)
- **Movie Search** — Search movies by title in real time on the dashboard
- **Movie Detail Page** — View individual movie details, poster, and recommendations
- **Watchlist** — Add movies to a personal watchlist with status tracking
- **Status Tracking** — Mark each movie as Watched, Watching, or Pending
- **Live TMDB Search** — Search and add any movie from TMDB's database to your watchlist
- **Watchlist Stats** — Summary panel showing total, watched, watching, and pending counts
- **Remove Movies** — Remove any movie from your watchlist with a smooth animation

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Backend | Java (Jakarta Servlets) |
| Frontend | HTML, CSS, JavaScript, jQuery 3.7.1 |
| UI Framework | Bootstrap 5.3.2 |
| Database | MySQL 8.x |
| DB Driver | MySQL Connector/J 9.6.0 |
| Server | Apache Tomcat 10.x |
| Movie Data | TMDB API + Wikipedia poster images |
| Build Tool | Eclipse Dynamic Web Project |

---

## 📁 Project Structure

```
MoviesHub/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/auth/servlets/
│       │       ├── LoginServlet.java       # Handles user login + session
│       │       └── SignupServlet.java      # Handles user registration
│       └── webapp/
│           ├── dashboard.jsp               # Home page — trending & top rated
│           ├── movie.html                  # Movie detail page
│           ├── watchlist.html              # Watchlist management page
│           ├── index.html                  # Login / Sign up page
│           ├── META-INF/
│           │   └── MANIFEST.MF
│           └── WEB-INF/
│               └── lib/
│                   └── mysql-connector-j-9.6.0.jar
└── build/
    └── classes/                            # Compiled .class files
```

---

## ⚙️ Setup & Installation

### 1. Prerequisites
Make sure you have the following installed:
- Java JDK 17 or higher
- Apache Tomcat 10.x
- MySQL 8.x
- Eclipse IDE (with Eclipse IDE for Enterprise Java Developers)

### 2. Clone the Repository
```bash
git clone https://github.com/YourUsername/MoviesHub.git
cd MoviesHub
```

### 3. Set Up the Database
Open MySQL and run the following SQL:

```sql
CREATE DATABASE authdb;

USE authdb;

CREATE TABLE users (
    id       INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100),
    email    VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
```

### 4. Configure Database Credentials
Open both servlet files and update the DB config:

- `src/main/java/com/auth/servlets/LoginServlet.java`
- `src/main/java/com/auth/servlets/SignupServlet.java`

```java
private static final String DB_URL      = "jdbc:mysql://localhost:3306/authdb";
private static final String DB_USER     = "root";
private static final String DB_PASSWORD = "your_password_here";
```

### 5. Import into Eclipse
1. Open Eclipse → `File` → `Import` → `Existing Projects into Workspace`
2. Select the cloned project folder
3. Right-click project → `Build Path` → confirm `mysql-connector-j-9.6.0.jar` is in the build path

### 6. Deploy to Tomcat
1. Right-click the project → `Run As` → `Run on Server`
2. Select your Tomcat 10.x installation
3. Open browser and go to: `http://localhost:8080/Project/index.html`

---

## 🔑 Environment Variables (Recommended for Production)

Instead of hardcoding credentials, use environment variables or a `context.xml` JNDI datasource. Example:

```java
private static final String DB_PASSWORD = System.getenv("DB_PASSWORD");
```

---

## 🌐 API Used

- **TMDB (The Movie Database)** — Used for live movie search in the Watchlist page
  - Docs: https://developer.themoviedb.org/docs
  - You need a free API key from https://www.themoviedb.org/settings/api
  - Add your key in `watchlist.html`:
    ```javascript
    const TMDB_KEY = 'your_api_key_here';
    ```

---

## ⚠️ Known Limitations

- Passwords are stored in plain text — use BCrypt hashing in production
- Watchlist data is not persisted to the database (frontend only)
- Session is lost on server restart

---

## 📄 License

This project is for educational purposes. Feel free to fork and improve it.

---

## 👤 Author

Made by **[Your Name]**  
GitHub: [@YourUsername](https://github.com/YourUsername)
