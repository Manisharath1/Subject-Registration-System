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
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/students";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
		
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String domain = request.getParameter("domain");

        if (registerStudent(username, password, name, domain)) {
            // Registration successful, redirect to login page
            response.sendRedirect("Login.jsp");
        } else {
            // Registration failed, redirect back to registration page with an error message
            response.sendRedirect("Registration.jsp?error=1");
        }
    }

    private boolean registerStudent(String username, String password, String name, String domain) {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
                // Create a prepared statement with parameters
                String sql = "INSERT INTO Student (Username, Password, Name, Domain) VALUES (?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, username);
                    statement.setString(2, password);
                    statement.setString(3, name);
                    statement.setString(4, domain);

                    // Execute the query
                    int rowsAffected = statement.executeUpdate();

                    // If registration is successful, rowsAffected should be greater than 0
                    return rowsAffected > 0;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real application
        }

        return false;
    }
}
