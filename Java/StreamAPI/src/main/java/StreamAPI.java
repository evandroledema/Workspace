import java.util.*;

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
        Set<Map.Entry<Integer, Agenda>> set = new TreeSet<>(new ComparatoOrdemNumero()){{
            put(1,new Agenda("Evandro", 992348705));
            put(4,new Agenda("Morelo", 983138443));
            put(3,new Agenda("Angélica", 992374635));
        }};
        System.out.println(meusContatos3);
        for( Map.Entry<Integer, Agenda> entry: meusContatos3.entrySet()){
            System.out.println(entry.getKey() + " - " + entry.getValue().getNome());
        }
    }
}
