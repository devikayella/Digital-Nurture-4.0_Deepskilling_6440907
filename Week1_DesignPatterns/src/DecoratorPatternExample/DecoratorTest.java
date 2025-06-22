package DecoratorPatternExample;

class DecoratorTest {
    public static void main(String[] args) {
        Notifier notifier = new SMSNotifier(new EmailNotifier());
        notifier.send();
    }
}
