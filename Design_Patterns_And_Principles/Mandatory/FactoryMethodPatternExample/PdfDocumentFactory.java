package Design_Patterns_And_Principles.Mandatory.FactoryMethodPatternExample;

public class PdfDocument implements Document{
    
    public void create(){
        System.out.println("PDF Document Created");
    }
}
