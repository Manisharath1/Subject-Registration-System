package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Enrollment;

/**
 * Servlet implementation class GetEnrollmentDetailsServlet
 */
@WebServlet("/GetEnrollmentDetailsServlet")
public class GetEnrollmentDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/students";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEnrollmentDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		  List<Enrollment> enrollmentList = getEnrollmentData();

	        // Set the enrollment data as an attribute in the request
	        request.setAttribute("enrollmentList", enrollmentList);

	        // Forward the request to the AdminDashboard.jsp page
	        request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
	    }

	    private List<Enrollment> getEnrollmentData() {
	        List<Enrollment> enrollmentList = new ArrayList<>();

	        try {
	            // Load the JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish a connection
	            try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
	                // Retrieve enrollment data from the Enrollment table
	                String sql = "SELECT * FROM Enrollment";
	                try (PreparedStatement statement = connection.prepareStatement(sql)) {
	                    try (ResultSet resultSet = statement.executeQuery()) {
	                        // Populate the enrollment data
	                        while (resultSet.next()) {
	                            Enrollment enrollment = new Enrollment();
	                            enrollment.setStudentID(resultSet.getInt("StudentID"));
	                            enrollment.setCourseID(resultSet.getInt("CourseID"));
	                            enrollment.setStatus(resultSet.getString("Status"));
	                            enrollmentList.add(enrollment);
	                        }
	                    }
	                }
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace(); // Handle exceptions appropriately in a real application
	        }

	        return enrollmentList;
	    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
