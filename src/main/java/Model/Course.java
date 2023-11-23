package Model;

public class Course {
	
	    private int courseID;
	    private String courseName;
	    private String domain;
	    private String description;

	    // Constructors
	    public Course() {
	    }

	    public Course(int courseID, String courseName, String domain, String description) {
	        this.courseID = courseID;
	        this.courseName = courseName;
	        this.domain = domain;
	        this.description = description;
	    }

	    // Getter and setter methods
	    public int getCourseID() {
	        return courseID;
	    }

	    public void setCourseID(int courseID) {
	        this.courseID = courseID;
	    }

	    public String getCourseName() {
	        return courseName;
	    }

	    public void setCourseName(String courseName) {
	        this.courseName = courseName;
	    }

	    public String getDomain() {
	        return domain;
	    }

	    public void setDomain(String domain) {
	        this.domain = domain;
	    }

	    public String getDescription() {
	        return description;
	    }

	    public void setDescription(String description) {
	        this.description = description;
	    }

	    // You can add more methods as needed

	    @Override
	    public String toString() {
	        return "Course{" +
	                "courseID=" + courseID +
	                ", courseName='" + courseName + '\'' +
	                ", domain='" + domain + '\'' +
	                ", description='" + description + '\'' +
	                '}';
	    }
	}
