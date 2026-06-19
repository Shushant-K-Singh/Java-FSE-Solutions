package Design_Patterns_And_Principles.Additional.AdapterPatternExample;

public class PhonePay {
    public void makePayment(double amount){
        System.out.println("Payment of Rs." + amount + "Processed Successfully through Phone Pay...");
    }
}
