<%@page import="Controller.CourseListServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Course"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Course"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<h2>Course Enrollment</h2>
<form action="CourseEnrollmentServlet" method="post">
	<label for="courseID">Select a Course:</label> <select name="courseID"
		required>
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
	</select> <br> <input type="submit" value="Enroll">
</form>
</body>
</html>