package Data_Structures_And_Algorithms.Mandatory.ECommerce_Platform_Search_Function;

public class Search {
    public static Product linearSearch(Product[] products, int targetId){
        for(Product product : products){
            if(product.productId == targetId){
                return product;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, int targetId){
        int left = 0;
        int right = products.length-1;

        while(left<right){
            int mid = left + (right-left)/2;
            
            if(products[mid].productId == targetId){
                return products[mid];
            }

            if(products[mid].productId < targetId){
                left = mid+1;
            }
            else{
                right = mid-1;
            }
        }

        return null;
    }

    public static void main(String[] args){
        Product[] prod = {
            new Product(101, "Laptop","Electrnics"),
            new Product(102, "Phone", "Electronics"),
            new Product(103, "Shoes", "Fashion")
        };

        Product linearResult = linearSearch(prod, 103);
        if(linearResult!=null){
            System.out.println("Linear Search Result:");
            System.out.println("Product ID: " + linearResult.productId);
            System.out.println("Product Name: " + linearResult.productName);
            System.out.println("Category: " + linearResult.category);
        }
        else{
            System.out.println("Product Not Found");
        }

        Product binaryResult = binarySearch(prod, 101);
        if(binaryResult != null){
            System.out.println("\nBinary Search Result:");
            System.out.println("Product ID: " + binaryResult.productId);
            System.out.println("Product Name: " + binaryResult.productName);
            System.out.println("Category: " + binaryResult.category);
        }else{
            System.out.println("Product Not Found");
        }
    }
}
