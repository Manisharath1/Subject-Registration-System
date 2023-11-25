<%@page import="Model.Enrollment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
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
            color: #343a40;
        }

        .navbar {
            background-color: #343a40;
            padding: 10px 0;
            text-align: center;
            color: #fff;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
        }

        .container {
            width: 80%;
            margin: auto;
        }

        h2, h3 {
            text-align: center;
            color: #343a40;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #343a40;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            width: 100%;
            text-align: center;
            margin-top: auto;
        }

        .action-buttons {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

        .approve-button,
        .reject-button {
            background-color: #007bff;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }

        .approve-button:hover {
            background-color: #0056b3;
        }

        .reject-button:hover {
            background-color: #dc3545;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Centurion University of Technology and Management</a>
            </div>
        </nav>
        <h2>Welcome, Admin!</h2>
    </div>
    
    <!-- Container for content -->
    <div class="container">

        <!-- Display the enrollment table -->
        <h3>Enrollment Table:</h3>
        <table>
            <tr>
                <th>Student ID</th>
                <th>Course ID</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <% 
                List<Enrollment> enrollmentList = (List<Enrollment>) request.getAttribute("enrollmentList");
                if (enrollmentList != null && !enrollmentList.isEmpty()) {
                    for (Enrollment enrollment : enrollmentList) {
            %>
            <tr>
                <td><%=enrollment.getStudentID()%></td>
                <td><%=enrollment.getCourseID()%></td>
                <td><%=enrollment.getStatus()%></td>
                <td class="action-buttons">
                    <a href='AdminApprovalServlet?action=approve&studentID=<%=enrollment.getStudentID()%>&courseID=<%=enrollment.getCourseID()%>' class="approve-button">Approve</a>
                    <a href='AdminApprovalServlet?action=reject&studentID=<%=enrollment.getStudentID()%>&courseID=<%=enrollment.getCourseID()%>' class="reject-button">Reject</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan='4'>No enrollment requests.</td>
            </tr>
            <%
                }
            %>
        </table>

    </div> <!-- End container -->

    <!-- Footer -->
    <div class="footer">
        <p>Contact Number: +123456789</p>
        <p>Address: HIG-4, Floor 1 and 2, Jaydev Vihar, Opp Pal Heights, Bhubaneswar, Dist: Khurda, Odisha, India.</p>
    </div>

</body>
</html>
