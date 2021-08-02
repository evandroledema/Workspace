import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Iterations {
    public static void main(String[] args){
        String[] nomes = {"Evandro", "Angélica", "Elbanice", "Leonardo","Tiago", "Heloísa"};
        Integer[] numeros = {1, 2, 3, 4, 5};
        System.out.println("--\tNome Filtrado\t--");
        imprimrirNomesFiltrados(nomes);
        System.out.println("--\tLista de Nomes\t--");
        imprimirTodosOsNomes(nomes);
        System.out.println("--\tLista de Números x 2\t--");
        imprimirODobroDeCadaItemDALista(numeros);
        System.out.println("--\tUsando List para Stream\t--");
        List<String> profissoes = new ArrayList<>();
        profissoes.add("Engenheiro Eletricista");
        profissoes.add("Médico");
        profissoes.add("Farmaceutico");
        profissoes.add("Administrador");

        profissoes.stream()
                .filter(profissao -> profissao.startsWith("E"))
                .forEach(System.out::println);

    }

    public static void imprimrirNomesFiltrados(String... nomes){
//        String nomesParaImprimir = "";
//        for (String nome : nomes) {
//            if (nome.equals("Evandro")) {
//                nomesParaImprimir = " " + nome;
//            }
//        }

        String nomesParaImprimirDaStream =
                Stream.of(nomes)
                .filter(nome -> nome.equals("Evandro"))
                .collect(Collectors.joining());

        System.out.println("Nomes do stream: " + nomesParaImprimirDaStream);
    }

    public static void  imprimirTodosOsNomes(String... nomes){
//        for (String nome : nomes)
//            System.out.println(nome);
        Stream.of(nomes)
                .forEach(System.out::println);
    }

    public static void imprimirODobroDeCadaItemDALista(Integer... numeros){
//        for (Integer numero : numeros){
//            System.out.println(numero * 2);
//        }
        Stream.of(numeros)
                .map(numero -> numero * 2)
                .forEach(System.out::println);

    }
}

