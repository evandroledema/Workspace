public class Consumer {
    public static void main(String[] args){
//        java.util.function.Consumer<String> imprimirUmaFrase = frase -> System.out.println(frase);
        java.util.function.Consumer<String> imprimirUmaFrase = System.out::println;
        imprimirUmaFrase.accept("Hello World");

    }
}
