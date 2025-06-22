package SingletonPatternExample;

class SingletonTest {
    public static void main(String[] args) {
        Logger log1 = Logger.getInstance();
        Logger log2 = Logger.getInstance();
        log1.log("First log");
        log2.log("Second log");
        System.out.println(log1 == log2); // true
    }
}