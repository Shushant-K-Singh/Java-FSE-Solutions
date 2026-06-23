package Design_Patterns_And_Principles.Mandatory.FactoryMethodPatternExample;

public class WordDocument implements Document {
    
    @Override
    public void create(){
        System.out.println("Word Document Created Successfully");
    }
}
