package Design_Patterns_And_Principles.Mandatory.SingletonPatternExample;
public class Logger{
    private static Logger instance;

    private Logger(){}

    public static Logger getLogger(){
        if(instance==null){
            instance = new Logger();
        }
        return instance;
    }

    public void log(String message){
        System.out.println(message);
    }

}