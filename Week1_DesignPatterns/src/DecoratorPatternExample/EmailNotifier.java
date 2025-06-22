package DecoratorPatternExample;

class EmailNotifier implements Notifier {
    public void send() {
        System.out.println("Sending Email");
    }
}