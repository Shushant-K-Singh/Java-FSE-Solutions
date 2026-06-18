package Design_Patterns_And_Principles.Mandatory.SingletonPatternExample;

public class Test {
    public static void main(String[] args){
        Logger l1 = Logger.getLogger();
        l1.log("this is logger 1");
        
        Logger l2 = Logger.getLogger();
        l1.log("this is logger 2");
        
        System.out.println(l1 == l2); 
    }
}
