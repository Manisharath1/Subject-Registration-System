<%@page import="Model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Course"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student's Dashboard</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
         body {
        font-family: 'Arial', sans-serif;
        background-image: url('images/back.jpeg'); /* Replace 'your-image-url.jpg' with the actual path to your image */
        background-size: cover;
        background-position: center;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }


        .container {
            margin-top: 30px;
        }

       h2 {
    font-family: 'Tahoma', sans-serif;
    color: white; /* Change the color to your preferred color */
    font-size: 36px; /* Adjust the font size as needed */
    margin-bottom: 30px;
    font-style: italic;
}

        p {
            color: #495057;
        }

        .enrolled-courses,
        .available-courses {
            list-style-type: none;
            padding: 0;
        }

        .enrolled-courses li,
        .available-courses li {
            margin-bottom: 10px;
            color: #007bff;
        }

        .course-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin-top: 20px;
        }

        .course-card {
            width: 30%;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        .navbar {
            background-color: #343a40;
            padding: 10px 0;
        }

        .navbar-brand {
            color: #fff;
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-nav {
            margin-top: 10px;
        }

        .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            margin-top: auto;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Centurion University of Technology and Management</a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">

        <h2>Welcome, Student!</h2>

        <%
        // Retrieve the student object from the request
        Student student = (Student) request.getAttribute("student");

        if (student != null) {
        %>

        <div class="row">
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Student Information</h5>
                        <p class="card-text"><strong>Student ID:</strong> <%=student.getStudentID()%></p>
                        <p class="card-text"><strong>Username:</strong> <%=student.getUsername()%></p>
                        <p class="card-text"><strong>Name:</strong> <%=student.getName()%></p>
                        <p class="card-text"><strong>Domain:</strong> <%=student.getDomain()%></p>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Enrolled Courses</h5>
                        <ul class="enrolled-courses">
                            <%
                            // Display enrolled courses
                            for (String course : student.getEnrolledCourses()) {
                                out.println("<li>" + course + "</li>");
                            }
                            %>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Available Courses</h5>
                        <div class="course-list">
                            <%
                            List<Course> courseList = (List<Course>) request.getAttribute("courseList");
                            if (courseList != null && !courseList.isEmpty()) {
                                for (Course course : courseList) {
                            %>
                            <div class="course-card">
                                <h6><%=course.getCourseName()%></h6>
                                <p><strong>Domain:</strong> <%=course.getDomain()%></p>
                            </div>
                            <%
                                }
                            } else {
                                out.println("<p>No courses available.</p>");
                            }
                            %>
                        </div>
                    </div>
                </div>

                <a href="CourseListServlet" class="btn btn-primary">Enroll in a Course</a>
            </div>
        </div>

        <%
        } else {
            out.println("<p>Student details not found.</p>");
        }
        %>

        <!-- Add more content to the student details page as needed -->
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container text-center">
            <p>Contact Number: +123456789</p>
            <p>Address: HIG-4, Floor 1 and 2, Jaydev Vihar, Opp Pal Heights, Bhubaneswar, Dist: Khurda, Odisha, India.</p>
        </div>
    </footer>

    <!-- Bootstrap JS scripts (required for Bootstrap components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
