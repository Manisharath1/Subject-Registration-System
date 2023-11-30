package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Course;
import Model.Student;

/**
 * Servlet implementation class StudentDetailsServlet
 */
@WebServlet("/StudentDetailsServlet")
public class StudentDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/students";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";

	
	public StudentDetailsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Redirect");
//		
		HttpSession session = request.getSession(true);
		String username = (String) session.getAttribute("username");
		CourseListServlet obj = new CourseListServlet();

		// Fetch student details and enrolled courses
		Student student = getStudentDetails(username);
		List<Course> courseList = obj.getAvailableCourses();

		// Set student details as an attribute in the request
	        request.setAttribute("student", student);
	        request.setAttribute("courseList", courseList);


		// Forward the request to the StudentDetails.jsp page
		request.getRequestDispatcher("StudentDashboard.jsp").forward(request, response);
	}

	private Student getStudentDetails(String username) {
		try {
			// Load the JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Establish a connection
			try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
				// Create a prepared statement to retrieve student details and enrolled courses
				String sql = "SELECT s.*, c.CourseName FROM Student s LEFT JOIN Enrollment e ON s.StudentID = e.StudentID LEFT JOIN Course c ON e.CourseID = c.CourseID WHERE s.Username = ?";
				try (PreparedStatement statement = connection.prepareStatement(sql)) {
					statement.setString(1, username);

					// Execute the query
					try (ResultSet resultSet = statement.executeQuery()) {
						// Create a Student object to hold the details
						Student student = new Student();

						// Set student details
						if (resultSet.next()) {
							student.setStudentID(resultSet.getInt("StudentID"));
							student.setUsername(resultSet.getString("Username"));
							student.setName(resultSet.getString("Name"));
							student.setDomain(resultSet.getString("Domain"));
						}

						// Add enrolled courses to the student object
						do {
							String courseName = resultSet.getString("CourseName");
							if (courseName != null) {
								student.addEnrolledCourse(courseName);
							}
						} while (resultSet.next());

						return student;
					}
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace(); // Handle exceptions appropriately in a real application
		}

		return null;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
