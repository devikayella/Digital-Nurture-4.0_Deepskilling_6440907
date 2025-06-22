package AdapterPatternExample;

public class RazorPayAdapter implements PaymentProcessor {
    private RazorPay razorPay = new RazorPay();

    public void processPayment() {
        razorPay.pay();
    }
}
