package Model;

public class Enrollment {

	private int studentID;
    private int courseID;
    private String status;

    // Constructors
    public Enrollment() {
    }

    public Enrollment(int studentID, int courseID, String status) {
        this.studentID = studentID;
        this.courseID = courseID;
        this.status = status;
    }

    // Getter and setter methods
    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // You can add more methods as needed

    @Override
    public String toString() {
        return "Enrollment{" +
                "studentID=" + studentID +
                ", courseID=" + courseID +
                ", status='" + status + '\'' +
                '}';
    }
}