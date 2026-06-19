package Design_Patterns_And_Principles.Additional.AdapterPatternExample;

public class GooglePay {
    public void makePayment(double amount){
        System.out.println("Payment of Rs." + amount + "Processed Successfully through Google Pay...");
    }
}
