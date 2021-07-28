import java.util.Objects;

public class Serie implements Comparable<Serie>{
    private String name;
    private String genero;
    private Integer duracao;

    public Serie(String name, String genero, Integer duracao) {
        this.name = name;
        this.genero = genero;
        this.duracao = duracao;
    }

    public String getName() {
        return name;
    }

    public String getGenero() {
        return genero;
    }

    public Integer getDuracao() {
        return duracao;
    }

    @Override
    public String toString() {
        return "{" +
                "name='" + name + '\'' +
                ", genero='" + genero + '\'' +
                ", duracao=" + duracao +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Serie serie = (Serie) o;
        return name.equals(serie.name) && genero.equals(serie.genero) && duracao.equals(serie.duracao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, genero, duracao);
    }

    @Override
    public int compareTo(Serie serie) {
        int duracao = Integer.compare(this.getDuracao(), serie.getDuracao());
        if (duracao != 0) return duracao;
        return this.getGenero().compareTo(serie.getGenero());
    }
}
