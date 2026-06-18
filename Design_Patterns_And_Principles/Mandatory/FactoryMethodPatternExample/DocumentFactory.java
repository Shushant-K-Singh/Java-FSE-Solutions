package Design_Patterns_And_Principles.Mandatory.FactoryMethodPatternExample;

public class DocumentFactory{
    public static Document createDocument(String str){
        if(str.equalsIgnoreCase("Word Document")){
            return new WordDocument();
        }
        else if(str.equalsIgnoreCase("Excel Document")){
            return new ExcelDocument();
        }
        else if(str.equalsIgnoreCase("PDF Document")){
            return new PdfDocument();
        }
        return null;
    }
}

