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

import Model.Course;

/**
 * Servlet implementation class CourseListServlet
 */
@WebServlet("/CourseListServlet")
public class CourseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/students";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		List<Course> courseList = getAvailableCourses();

        // Set the course list as an attribute in the request
        request.setAttribute("courseList", courseList);

        // Forward the request to the StudentDashboard.jsp page
        request.getRequestDispatcher("CourseEnrollmentForm.jsp").forward(request, response);
    }

    public List<Course> getAvailableCourses() {
        List<Course> courseList = new ArrayList<>();
        System.out.print("There");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
                // Retrieve the list of available courses from the database
                String sql = "SELECT * FROM Course";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    try (ResultSet resultSet = statement.executeQuery()) {
                        // Populate the course list
                        while (resultSet.next()) {
                            Course course = new Course();
                            course.setCourseID(resultSet.getInt("CourseID"));
//                            System.out.print(resultSet.getString("CourseName"));
                            course.setCourseName(resultSet.getString("CourseName"));
                            course.setDomain(resultSet.getString("Domain"));
                            course.setDescription(resultSet.getString("Description"));
                            courseList.add(course);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real application
        }

        return courseList;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
