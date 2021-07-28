import java.util.*;

public class CollectionsMap {
    public static void main(String[] args){
    System.out.println("Crie um dicionário que relaciona os modelos e seus respectivos: ");
        Map<String, Double> carrosPopulares = new HashMap<>(){{
            put("gol", 14.4);
            put("uno", 15.6);
            put("mobi", 16.1);
            put("hb20", 14.5);
            put("kwid", 15.6);
        }};
        System.out.println(carrosPopulares.toString());

        System.out.println("Substitui o consumo do gol por 15.2 km/l: ");
        carrosPopulares.put( "gol", 15.2);
        System.out.println(carrosPopulares);

        System.out.println("Confere se o modelo tucson está no dicionário: " + carrosPopulares.containsKey("tucson"));

        System.out.println("Confere o consumo do uno: " + carrosPopulares.get("uno"));

        System.out.println("Exiba os modelos: ");
        Set<String> modelos = carrosPopulares.keySet();
        System.out.println(modelos);

        System.out.println("Exibe o consumo dos carros: ");
        Collection<Double> consumos = carrosPopulares.values();
        System.out.println(consumos);

        System.out.println("Exibe o mais econômico: ");
        Double consumoMaisEco = Collections.max(carrosPopulares.values());
        Set<Map.Entry<String, Double>> entries = carrosPopulares.entrySet();
        String modeloMaisEco = " ";
        for (Map.Entry<String, Double> entry : entries){
            if (entry.getValue().equals(consumoMaisEco)) {
                modeloMaisEco = entry.getKey();
                System.out.println(modeloMaisEco + " - " + consumoMaisEco );
            }
        }

        System.out.println("Exibe o consumo menos eficiente: ");
        Double consumoMenosEco = Collections.min(carrosPopulares.values());
        Set<Map.Entry<String, Double>> entries1 = carrosPopulares.entrySet();
        String modeloMenosEco = "";
        for (Map.Entry<String, Double> entry : entries1){
            if (entry.getValue().equals(consumoMenosEco)) {
                modeloMenosEco = entry.getKey();
                System.out.println(modeloMenosEco + " - " + consumoMenosEco);
            }
        }

        System.out.println("Exibe a soma dos consumos: ");
        Iterator<Double> iterator = carrosPopulares.values().iterator();
        Double soma = 0d;
        while (iterator.hasNext()){
            soma += iterator.next();
        }
        System.out.println(soma);

        System.out.println("Exibe a média de consumo deste dicionário: ");
        System.out.print(soma/ carrosPopulares.size());

        System.out.println("Remove os modelos com consumo igual a 15.6 km/l: ");
        carrosPopulares.values().removeIf(aDouble -> aDouble.equals(15.6));
        System.out.println(carrosPopulares);

        System.out.println("Exibe todos os carros na ordem em que foram informados: ");
        Map<String, Double> carrosPopulares1 = new LinkedHashMap<>(){{
            put("gol", 14.4);
            put("uno", 15.6);
            put("mobi", 16.1);
            put("hb20", 14.5);
            put("kwid", 15.6);
        }};
        System.out.println(carrosPopulares1.toString());

        System.out.println("Exibe o dicionário na ordem alfabetica: ");
        Map<String, Double> carrosPopulares2 = new TreeMap<>(carrosPopulares1);
        System.out.println(carrosPopulares2.toString());

        System.out.println("Apaga o dicionário de Carros");
        carrosPopulares.clear();
        System.out.println(carrosPopulares);

        System.out.println("Confere se está vazio: ");
        System.out.println(carrosPopulares.isEmpty());

    }
}
