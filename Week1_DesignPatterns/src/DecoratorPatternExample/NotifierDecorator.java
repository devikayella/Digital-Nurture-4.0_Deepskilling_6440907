package DecoratorPatternExample;

abstract class NotifierDecorator implements Notifier {
    protected Notifier wrappee;
    public NotifierDecorator(Notifier notifier) {
        this.wrappee = notifier;
    }
    public void send() {
        wrappee.send();
    }
}