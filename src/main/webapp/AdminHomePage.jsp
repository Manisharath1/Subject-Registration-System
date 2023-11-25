<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
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
            color: #fff;
        }

        .navbar {
            background-color: #343a40;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            cursor: pointer;
        }

        .logout-button {
            background-color: #dc3545;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }

        .logout-button:hover {
            background-color: #c82333;
        }

        .container {
            width: 80%;
            margin: auto;
            margin-top: 20px;
        }

        .dashboard-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        h2 {
            color: #343a40;
            margin-bottom: 20px;
        }

        .dashboard-link {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
        }

        .dashboard-link:hover {
            text-decoration: underline;
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
        <span class="navbar-brand">Centurion University of Technology and Management</span>
        <a href="Home.jsp" class="logout-button">Logout</a>
    </div>

    <!-- Container for content -->
    <div class="container">

        <!-- Course List Container -->
        <div class="dashboard-container">
            <h2>Course List</h2>
            <a href="CourseListServlet" class="dashboard-link">View Course List</a>
        </div>

        <!-- Enrollment List Container -->
        <div class="dashboard-container">
            <h2>Enrollment List</h2>
            <a href="GetEnrollmentDetailsServlet" class="dashboard-link">View Enrollment List</a>
        </div>

    </div> <!-- End container -->

    <!-- Footer -->
    <div class="footer">
        <p>Contact Number: +123456789</p>
        <p>Address: HIG-4, Floor 1 and 2, Jaydev Vihar, Opp Pal Heights, Bhubaneswar, Dist: Khurda, Odisha, India.</p>
    </div>

</body>
</html>
