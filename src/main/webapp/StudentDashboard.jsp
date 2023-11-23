<%@page import="Model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession"%>
<%@ page import="Model.Student"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Course"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student's Dashboard</title>
</head>
<body>
	<h2>Welcome, Student!</h2>

	<%
	// Retrieve the student object from the request
	Student student = (Student) request.getAttribute("student");

	if (student != null) {
	%>

	<p>
		<strong>Student ID:</strong>
		<%=student.getStudentID()%></p>
	<p>
		<strong>Username:</strong>
		<%=student.getUsername()%></p>
	<p>
		<strong>Name:</strong>
		<%=student.getName()%></p>
	<p>
		<strong>Domain:</strong>
		<%=student.getDomain()%></p>


	<h3>Enrolled Courses:</h3>
	<ul>
		<%
		// Display enrolled courses
		for (String course : student.getEnrolledCourses()) {
			out.println("<li>" + course + "</li>");
		}
		%>
	</ul>
	
	<h3>Available Courses:</h3>
	<ul>
		<%
		List<Course> courseList = (List<Course>) request.getAttribute("courseList");
		if (courseList != null && !courseList.isEmpty()) {
			for (Course course : courseList) {
				out.println("<li>" + course.getCourseName() + " - " + course.getDomain() + "</li>");
			}
		} else {
			out.println("<li>No courses available.</li>");
		}
		%>
	</ul>

	<!-- Add a link or button to trigger the CourseListServlet -->

	<a href="CourseListServlet">Enroll in a Course</a>
	<%
	} else {
	out.println("<p>Student details not found.</p>");
	}
	%>

	<!-- Add more content to the student details page as needed -->
</body>
</html>