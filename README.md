# ToDo-App

A simple **Spring Boot & JSP based ToDo Application** with CRUD operations (Create, Read, Update, Delete).  
The app uses **Spring MVC**, **JSP pages**, **Bootstrap 5** for UI, and **JPA/Hibernate** for database operations.

---

## **Features**
- Add a new ToDo item.
- View all ToDo items in a table with status indicators.
- Mark items as **Completed**.
- Edit an existing ToDo item.
- Delete an item.
- Flash messages for success/failure using **Toastr** notifications.

---

## **Tech Stack**
- **Backend:** Spring Boot, Spring MVC, Spring Data JPA.
- **Frontend:** JSP, JSTL, Bootstrap 5, Font Awesome.
- **Database:** MySQL (via Spring JPA/Hibernate).
- **Build Tool:** Maven.
- **Java Version:** 17+ (recommended).

---

## **Project Structure**
ToDo-App
│── src
│ ├── main
│ │ ├── java
│ │ │ └── com.example.ToDo.App
│ │ │ ├── controller # Controllers
│ │ │ ├── model # Entity classes
│ │ │ ├── repo # Repositories
│ │ │ └── service # Service layer
│ │ ├── resources
│ │ │ └── application.properties
│ │ └── webapp
│ │ └── WEB-INF/jsp # JSP files
│ │ ├── AddToDoItem.jsp
│ │ ├── EditToDoItem.jsp
│ │ └── ViewToDoList.jsp
│── pom.xml
│── HELP.md
│── README.md



