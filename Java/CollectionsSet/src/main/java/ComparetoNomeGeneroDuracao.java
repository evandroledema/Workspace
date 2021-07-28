import java.util.Comparator;

public class ComparetoNomeGeneroDuracao implements Comparator<Serie> {

    @Override
    public int compare(Serie o1, Serie o2) {

        int name = o1.getName().compareTo(o2.getName());
        if (name != 0) return name;

        int genero = o1.getGenero().compareTo(o2.getGenero());
        if (genero != 0) return genero;

        return Integer.compare(o1.getDuracao(), o2.getDuracao());
    }
}
