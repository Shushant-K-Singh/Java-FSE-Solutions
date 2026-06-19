package Design_Patterns_And_Principles.Additional.AdapterPatternExample;

public class test {
    public static void main(String[] args) {
        PaymentProcessor phonepay = new PhonePayAdapter(new PhonePay());

        PaymentProcessor gpay = new GooglePayAdapter(new GooglePay());

        phonepay.processPayment(1000);
        gpay.processPayment(2000);
        
    }
}
