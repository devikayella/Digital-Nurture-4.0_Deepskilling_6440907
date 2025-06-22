package MVCPatternExample;

class MVCTest {
    public static void main(String[] args) {
        Student student = new Student("Alice", "101");
        StudentView view = new StudentView();
        StudentController controller = new StudentController(student, view);

        controller.updateView();
        student.setName("Bob");
        controller.updateView();
    }
}