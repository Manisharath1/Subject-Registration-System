<%@page import="Controller.CourseListServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Course"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Course"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Course Enrollment</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: url('images/back.jpeg') center/cover no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .navbar {
            background-color: #343a40;
            padding: 10px 0;
            width: 100%;
            color: #fff;
            text-align: centre;
        }

        h2 {
            color: white;
            margin-bottom: 30px;
            text-align: center;
        }

        form {
            width: 50%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            margin-bottom: 10px;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: auto;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            width: 100%;
            text-align: center;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h3>Centurion University of Technology and Management</h3>
    </div>

    <h2>Course Enrollment</h2>
    <form action="CourseEnrollmentServlet" method="post">
        <label for="courseID">Select a Course:</label>
        <select name="courseID" required>
            <!-- Populate this dropdown with available courses from the request -->
            <%
            List<Course> courseList = (List<Course>) request.getAttribute("courseList");

            if (courseList != null && !courseList.isEmpty()) {
                for (Course course : courseList) {
                    out.println("<option value=\"" + course.getCourseID() + "\">" + course.getCourseName() + "</option>");
                }
            } else {
                out.println("<option value=\"\">No courses available</option>");
            }
            %>
        </select>
        <br>
        <input type="submit" value="Enroll">
    </form>

    <!-- Footer -->
    <div class="footer">
        <p>Contact Number: +123456789</p>
        <p>Address:HIG-4, Floor 1 and 2, Jaydev Vihar, Opp Pal Heights, Bhubaneswar, Dist: Khurda, Odisha, India.</p>
    </div>
</body>
</html>
