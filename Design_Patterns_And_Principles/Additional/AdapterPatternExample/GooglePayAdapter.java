package Design_Patterns_And_Principles.Additional.AdapterPatternExample;

public class GooglePayAdapter implements PaymentProcessor{
    
    private GooglePay googlepay;

    public GooglePayAdapter(GooglePay googlepay){
        this.googlepay = googlepay;
    }

    @Override
    public void processPayment(double amount){
        googlepay.makePayment(amount);
    }
}
