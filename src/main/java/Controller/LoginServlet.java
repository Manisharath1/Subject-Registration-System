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

import Dao.LoginDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/students";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// Check if the user is a student
		if (isValidStudent(username, password)) {
			// Set student information in the session
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("role", "student");

			// student dashboard
			response.sendRedirect("StudentDetailsServlet");
		}
		// Check if the user is an admin
		else if (isValidAdmin(username, password)) {
			// Set admin information in the session
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("role", "admin");

			//  admin dashboard
			response.sendRedirect(request.getContextPath() + "/AdminHomePage.jsp");
		} else {
			// Invalid login, redirect back to the login page with an error message
			response.sendRedirect("Login.jsp?error=1");
		}
	}

	private boolean isValidStudent(String username, String password) {
		try {
			// Load the JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Establish a connection
			try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
				// Create a prepared statement with parameters
				String sql = "SELECT * FROM Student WHERE Username = ? AND Password = ?";
				try (PreparedStatement statement = connection.prepareStatement(sql)) {
					statement.setString(1, username);
					statement.setString(2, password);

					// Execute the query
					try (ResultSet resultSet = statement.executeQuery()) {
						// If a record is found, authentication is successful
						return resultSet.next();
					}
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace(); // Handle exceptions appropriately in a real application
		}

		return false;
	}

	private boolean isValidAdmin(String username, String password) {
		try {
			// Load the JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Establish a connection
			try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
				// Create a prepared statement with parameters
				String sql = "SELECT * FROM admin WHERE Username = ? AND Password = ?";
				try (PreparedStatement statement = connection.prepareStatement(sql)) {
					statement.setString(1, username);
					statement.setString(2, password);

					// Execute the query
					try (ResultSet resultSet = statement.executeQuery()) {
						// If a record is found, authentication is successful
						return resultSet.next();
					}
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace(); // Handle exceptions appropriately in a real application
		}

		return false;
	}
}