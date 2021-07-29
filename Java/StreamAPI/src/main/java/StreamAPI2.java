import java.util.Arrays;
//import java.util.DoubleSummaryStatistics;
import java.util.List;
/*import java.util.function.DoubleConsumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.ToIntFunction;

 */
import java.util.stream.Collectors;

public class StreamAPI2 {
    public static void main(String[] args){
        List<String> numerosAleatorios;
        numerosAleatorios = Arrays.asList("1", "0", "4", "1", "2", "3", "9", "6", "5");

        System.out.println("Imprime todos os elementos de uma lista de String: ");
        numerosAleatorios.forEach(System.out::println);

        System.out.println("Imprime os cinco primeiros numeros e coloca dentro de um set: ");
        numerosAleatorios.stream()
                .limit(5)
                .collect(Collectors.toSet())
                .forEach(System.out::println);

        System.out.println("Tronsforma a lista em números inteiros: ");
        numerosAleatorios.stream()
                .map(Integer::parseInt)
                .collect(Collectors.toList())
                .forEach(System.out::println);

        System.out.println("Pega os numeros pares e maiores so que 2: ");
        List<Integer> ListaParesMaioresQue2 = numerosAleatorios.stream()
                .map(Integer::parseInt)
                .filter(integer -> integer % 2 == 0 && integer > 2)
                .collect(Collectors.toList());
        System.out.println(ListaParesMaioresQue2);

        System.out.println("Mostra a média dos números: ");
        numerosAleatorios.stream()
                .mapToInt(Integer::parseInt)
                .average()
                .ifPresent(System.out::println);

        System.out.println("Remova os valores impares: ");
        List<Integer> numerosAleatoriosInteger = numerosAleatorios.stream()
                .map(Integer::parseInt)
                .collect(Collectors.toList());
        numerosAleatoriosInteger.removeIf(integer -> integer % 2 != 0);
        System.out.println(numerosAleatoriosInteger);

    }
}
