import java.util.*;
//import java.util.function.Function;

public class StreamAPI {
    public static void main(String[] args){

        System.out.println("--\tOrdem Aleatória\t--");
        Map<Integer, Agenda> meusContatos = new HashMap<>(){{
           put(1,new Agenda("Evandro", 992348705));
           put(4,new Agenda("Morelo", 983138443));
           put(3,new Agenda("Angélica", 992374635));
        }};
        System.out.println(meusContatos);
        for( Map.Entry<Integer, Agenda> entry: meusContatos.entrySet()){
            System.out.println(entry.getKey() + " - " + entry.getValue().getNome());
        }

        System.out.println("--\tOrdem de Inserção\t--");
        Map<Integer, Agenda> meusContatos2 = new LinkedHashMap<>(){{
            put(1,new Agenda("Evandro", 992348705));
            put(4,new Agenda("Morelo", 983138443));
            put(3,new Agenda("Angélica", 992374635));
        }};
        System.out.println(meusContatos2);
        for( Map.Entry<Integer, Agenda> entry: meusContatos2.entrySet()){
            System.out.println(entry.getKey() + " - " + entry.getValue().getNome());
        }

        System.out.println("--\tOrdem ID\t--");
        Map<Integer, Agenda> meusContatos3 = new TreeMap<>(){{
            put(1,new Agenda("Evandro", 992348705));
            put(4,new Agenda("Morelo", 983138443));
            put(3,new Agenda("Angélica", 992374635));
        }};
        System.out.println(meusContatos3);
        for( Map.Entry<Integer, Agenda> entry: meusContatos3.entrySet()){
            System.out.println(entry.getKey() + " - " + entry.getValue().getNome());
        }

        System.out.println("--\tOrdem Número Telefone\t--");
        //Set<Map.Entry<Integer, Agenda>> set = new TreeSet<>(new ComparatorOrdemNumero());
        //Para comparar como clase Anônima:
        /*Set<Map.Entry<Integer, Agenda>> set = new TreeSet<>(new Comparator<Map.Entry<Integer, Agenda>>() {
            @Override
            public int compare(Map.Entry<Integer, Agenda> o1, Map.Entry<Integer, Agenda> o2) {
                return Integer.compare(o1.getValue().getNumero(), o2.getValue().getNumero());
            }
        });*/
        //Usando uma Function:
        /*Set<Map.Entry<Integer, Agenda>> set = new TreeSet<>(Comparator.comparing(
                new Function<Map.Entry<Integer,Agenda>, Integer>() {
                    @Override
                    public Integer apply(Map.Entry<Integer, Agenda> integerAgendaEntry) {
                        return integerAgendaEntry.getValue().getNumero();
                    }
                }));
         */
        //Simplificar por Lambda
        Set<Map.Entry<Integer, Agenda>> set = new TreeSet<>(Comparator.comparing(
                integerAgendaEntry -> integerAgendaEntry.getValue().getNumero()));
        set.addAll(meusContatos.entrySet());
        for( Map.Entry<Integer, Agenda> entry: set){
            System.out.println(entry.getKey() + " - " + entry.getValue().getNumero()
            + ": " + entry.getValue().getNome());
        }

        System.out.println("--\tOrdem nome contato\t--");
        //precisamos organizar os valores. Logo:
        Set<Map.Entry<Integer, Agenda>> set1 = new TreeSet<>(new ComparatorOrdemNomeContato());
        set1.addAll(meusContatos.entrySet());
        for (Map.Entry<Integer, Agenda> entry: set1) {
            System.out.println(entry.getKey() + " - " + entry.getValue().getNome());
        }

    }
}