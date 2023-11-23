package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminApprovalServlet
 */
@WebServlet("/AdminApprovalServlet")
public class AdminApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/students";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getParameter("action");
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        int courseID = Integer.parseInt(request.getParameter("courseID"));

        // Perform the status change based on the action
        if ("approve".equals(action)) {
            updateEnrollmentStatus(studentID, courseID, "Approved");
        } else if ("reject".equals(action)) {
            updateEnrollmentStatus(studentID, courseID, "Rejected");
        }

        // Redirect back to the AdminDashboard.jsp
        response.sendRedirect("AdminDashboard.jsp");
    }

    private void updateEnrollmentStatus(int studentID, int courseID, String status) {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
                // Update the status in the Enrollment table
                String updateSql = "UPDATE Enrollment SET Status = ? WHERE StudentID = ? AND CourseID = ?";
                try (PreparedStatement updateStatement = connection.prepareStatement(updateSql)) {
                    updateStatement.setString(1, status);
                    updateStatement.setInt(2, studentID);
                    updateStatement.setInt(3, courseID);

                    // Execute the update
                    updateStatement.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real application
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
