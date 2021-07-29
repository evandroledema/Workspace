import java.util.Comparator;
import java.util.Map;

public class ComparatorOrdemNumero implements Comparator<Map.Entry<Integer, Agenda>> {


    @Override
    public int compare(Map.Entry<Integer, Agenda> o1, Map.Entry<Integer, Agenda> o2) {
        return Integer.compare(o1.getValue().getNumero(), o2.getValue().getNumero());
    }
}
