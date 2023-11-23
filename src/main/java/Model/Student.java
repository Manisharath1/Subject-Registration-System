package Model;

import java.util.ArrayList;
import java.util.List;

public class Student {
	
	 private int studentID;
	    private String username;
	    private String name;
	    private String domain;
	    private List<String> enrolledCourses;

	    public Student() {
	        enrolledCourses = new ArrayList<>();
	    }

	    // Getter and setter methods for the attributes

	    public int getStudentID() {
	        return studentID;
	    }

	    public void setStudentID(int studentID) {
	        this.studentID = studentID;
	    }

	    public String getUsername() {
	        return username;
	    }

	    public void setUsername(String username) {
	        this.username = username;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getDomain() {
	        return domain;
	    }

	    public void setDomain(String domain) {
	        this.domain = domain;
	    }

	    public List<String> getEnrolledCourses() {
	        return enrolledCourses;
	    }

	    public void setEnrolledCourses(List<String> enrolledCourses) {
	        this.enrolledCourses = enrolledCourses;
	    }

	    // Method to add an enrolled course
	    public void addEnrolledCourse(String course) {
	        enrolledCourses.add(course);
	    }
}
