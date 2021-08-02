public class Predicate {
    public static void main(String[] args){

//    java.util.function.Predicate<String> estaVazio = valor -> valor.isEmpty();
    java.util.function.Predicate<String> estaVazio = String::isEmpty;
    System.out.println(estaVazio.test(""));
    System.out.println(estaVazio.test("Evandro"));


    }
}
