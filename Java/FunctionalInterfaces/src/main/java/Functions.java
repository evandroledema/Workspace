import java.util.function.Function;

public class Functions {
    public static void main(String[] args){
        Function<String, String> retornaNomeAoContrario = texto -> new StringBuilder(texto).reverse().toString();
        System.out.println(retornaNomeAoContrario.apply("Evandro"));

//        Function<String, Integer> converteStringParaInteiro = string -> Integer.valueOf(string);
        Function<String, Integer> converteStringParaInteiro = Integer::valueOf;
        System.out.println(converteStringParaInteiro.apply("400"));

//        Function<String, Integer> converteStringParaInteiroRetornaDobro = string -> Integer.valueOf(string) * 2;
        Function<String, Integer> converteStringParaInteiroRetornaDobro = string -> Integer.parseInt(string) * 2;
        System.out.println(converteStringParaInteiroRetornaDobro.apply("40"));
    }
}
