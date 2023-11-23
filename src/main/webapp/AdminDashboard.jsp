<%@page import="Model.Enrollment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h2>Welcome, Admin!</h2>

    <!-- Display the enrollment table -->
    <h3>Enrollment Table:</h3>
    <table border="1">
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
                    out.println("<tr>");
                    out.println("<td>" + enrollment.getStudentID() + "</td>");
                    out.println("<td>" + enrollment.getCourseID() + "</td>");
                    out.println("<td>" + enrollment.getStatus() + "</td>");
                    out.println("<td>");
                    out.println("<a href='AdminApprovalServlet?action=approve&studentID=" + enrollment.getStudentID() + "&courseID=" + enrollment.getCourseID() + "'>Approve</a> ");
                    out.println("<a href='AdminApprovalServlet?action=reject&studentID=" + enrollment.getStudentID() + "&courseID=" + enrollment.getCourseID() + "'>Reject</a>");
                    out.println("</td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr><td colspan='4'>No enrollment requests.</td></tr>");
            }
        %>
    </table>
</body>
</html>