import java.util.Comparator;
import java.util.Map;

public class ComparatorOrdemNomeContato implements Comparator<Map.Entry<Integer, Agenda>> {
    @Override
    public int compare(Map.Entry<Integer, Agenda> o1, Map.Entry<Integer, Agenda> o2) {
        return o1.getValue().getNome().compareToIgnoreCase(o2.getValue().getNome());
    }
}
