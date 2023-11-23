package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CourseEnrollmentServlet
 */
@WebServlet("/CourseEnrollmentServlet")
public class CourseEnrollmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/students";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseEnrollmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 HttpSession session = request.getSession();
	        String username = (String) session.getAttribute("username");
	        int courseID = Integer.parseInt(request.getParameter("courseID"));

	        // Enroll the student in the course
	        enrollStudentInCourse(username, courseID);

	        // Redirect back to the student dashboard or a confirmation page
//	        response.sendRedirect("AdminDashboard.jsp");
	    }

	    private void enrollStudentInCourse(String username, int courseID) {
	        try {
	            // Load the JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish a connection
	            try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
	                // Check if the student is already enrolled in the course
	                if (!isStudentEnrolled(username, courseID, connection)) {
	                    // If not enrolled, insert a new enrollment record
	                    String sql = "INSERT INTO Enrollment (StudentID, CourseID, Status) VALUES (?, ?, 'Pending')";
	                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
	                        int studentID = getStudentID(username, connection);
	                        statement.setInt(1, studentID);
	                        statement.setInt(2, courseID);

	                        // Execute the update
	                        statement.executeUpdate();
	                    }
	                }
	                // If already enrolled, you may want to handle it accordingly (e.g., show a message)
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace(); // Handle exceptions appropriately in a real application
	        }
	    }

	    private boolean isStudentEnrolled(String username, int courseID, Connection connection) throws SQLException {
	        // Check if the student is already enrolled in the course
	        String sql = "SELECT * FROM Enrollment e " +
	                     "JOIN Student s ON e.StudentID = s.StudentID " +
	                     "WHERE s.Username = ? AND e.CourseID = ? AND e.Status = 'Approved'";
	        try (PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1, username);
	            statement.setInt(2, courseID);

	            try (ResultSet resultSet = statement.executeQuery()) {
	                return resultSet.next();
	            }
	        }
	    }

	    private int getStudentID(String username, Connection connection) throws SQLException {
	        // Retrieve the student ID based on the username
	        String sql = "SELECT StudentID FROM Student WHERE Username = ?";
	        try (PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1, username);

	            try (ResultSet resultSet = statement.executeQuery()) {
	                if (resultSet.next()) {
	                    return resultSet.getInt("StudentID");
	                }
	            }
	        }
	        return -1; // Return -1 if the student ID is not found (you might want to handle this case better)
	    }
	}