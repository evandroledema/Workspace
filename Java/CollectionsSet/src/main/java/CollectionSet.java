import java.util.*;


public class CollectionSet {
    public static void main(String[] args){
        System.out.println("Cria um conjunto e adiciona as notas");
        Set<Double> notas = new HashSet<>(Arrays.asList(7d, 8.5, 9.3, 5d, 7d, 0d, 3.6 ));
        System.out.println(notas);

        //Verifica um determinado valor no set
        System.out.println("confira se a nota 5.0 está no conjunto: " + notas.contains(5d));

        //Retorna o menor valor dentro do set
        System.out.println("Retorne a menor nota: " + Collections.min(notas));
        System.out.println("Retorne a maior nota: " + Collections.max(notas));

        //Exibe a soma das notas dentro do set
        System.out.println("Retorne a soma das notas: ");
        Iterator<Double> iterator = notas.iterator();
        Double soma = 0.0;
        while (iterator.hasNext()){
            Double next = iterator.next();
            soma += next;
        }
        System.out.println(soma);

        //Exibe a média das notas
        System.out.println("Retorne a média das notas: " + (soma/notas.size()));

        //Remove uma nota específica
        System.out.println("Remove a nota zero: ");
        notas.remove(0d);
        System.out.println(notas);

        //Remove notas menores que um dado valor
        System.out.println("Remove as notas menores que 7: ");
        notas.removeIf(next -> next < 7);
        System.out.println(notas);

        //Exibe as notas na ordem
        System.out.println("Exibe as notas na ordem em que foram informadas: ");
        Set<Double> notas2 = new LinkedHashSet<>(Arrays.asList(7d, 8.5, 9.3, 5d, 7d, 0d, 3.6 ));
        System.out.println(notas2);

        //Exibe na ordem natural
        System.out.println("Exibe as notas na ordem natural: ");
        Set<Double> notas3 = new TreeSet<>(notas2);
        System.out.println(notas3);

        //Apaga o collection
        System.out.println("Apaga todo o conjunto: ");
        notas.clear();
        System.out.println("Verifica se está Vazio: " + notas.isEmpty());


        //Exibir as series na ordem aleatória
        System.out.println("--\tOrdem Aleatoria\t--");
        Set<Serie> minhasSeries = new HashSet<>(){{
            add(new Serie("True", "Noir", 60));
            add(new Serie("The Witcher", "Fantasia", 90));
            add(new Serie("Brooklyn 99", "Comedy", 30));
        }};

        for (Serie serie: minhasSeries) System.out.println(serie.getName() +
                " - " + serie.getGenero() + " - " + serie.getDuracao());

        System.out.println("--\tOrdem de Inserção\t--");
        Set<Serie> minhasSeries1 = new LinkedHashSet<>(){{
            add(new Serie("True Detective", "Mystery", 60));
            add(new Serie("The Witcher", "Fantasia", 90));
            add(new Serie("Brooklyn 99", "Comedy", 30));
        }};

        for (Serie serie: minhasSeries1) {
            System.out.println(serie.getName() +
                    " - " + serie.getGenero() + " - " + serie.getDuracao());
        }

        System.out.println("--\tOrdem Natural Tempo Episódio\t--");
        Set<Serie> minhasSeries2 = new TreeSet<>(minhasSeries1);
        for (Serie serie: minhasSeries2) {
            System.out.println(serie.getName() + " - "
            + serie.getGenero() + " - " + serie.getDuracao());
        }

        System.out.println("--\tOrdem Nome/Gênero/Duração\t--");
        Set<Serie> minhasSeries3 = new TreeSet<>(new ComparetoNomeGeneroDuracao());
        minhasSeries3.addAll(minhasSeries2);
        for (Serie serie: minhasSeries3) {
            System.out.println(serie.getName() + " - "
                    + serie.getGenero() + " - " + serie.getDuracao());
        }
    }
}
