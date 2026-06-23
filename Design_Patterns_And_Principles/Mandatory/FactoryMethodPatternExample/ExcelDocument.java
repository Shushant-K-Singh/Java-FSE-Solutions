package Design_Patterns_And_Principles.Mandatory.FactoryMethodPatternExample;

public class ExcelDocument implements Document{
    
    @Override
    public void create(){
        System.out.println("Excel Document Created Successfully...");
    }
}
