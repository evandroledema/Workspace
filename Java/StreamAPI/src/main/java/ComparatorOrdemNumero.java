import java.util.Comparator;

public class ComparatorOrdemNumero implements Comparator<Agenda> {
    @Override
    public int compare(Agenda o1, Agenda o2) {
        return Integer.compare(o1.getNumero(), o2.getNumero());
    }
}
