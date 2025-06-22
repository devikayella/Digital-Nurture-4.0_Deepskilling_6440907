package ProxyPatternExample;

class ProxyTest {
    public static void main(String[] args) {
        Image img = new ProxyImage("test.jpg");
        img.display();
        img.display();
    }
}