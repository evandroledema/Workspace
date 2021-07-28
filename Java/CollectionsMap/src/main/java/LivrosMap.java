import java.util.*;

public class LivrosMap {
    public static  void main(String[] arg){
        System.out.println("--\tOdem Aleatória\t--");
        Map<String, Livro> meusLivros = new HashMap<>(){{
            put("Émile Zola", new Livro("Germinal", 500));
            put("J. R. R. Tolkien", new Livro("Lord of The Rings", 1800));
            put("Ursula K. le Guin", new Livro("Earthsea", 2000));
        }};
        for (Map.Entry<String, Livro>  livro : meusLivros.entrySet()){
            System.out.println(livro.getKey() + " - " + livro.getValue().getNome());
        }

        System.out.println("--\tOdem Inserção\t--");
        Map<String, Livro> meusLivros1 = new LinkedHashMap<>(){{
            put("Émile Zola", new Livro("Germinal", 500));
            put("J. R. R. Tolkien", new Livro("Lord of The Rings", 1800));
            put("Ursula K. le Guin", new Livro("Earthsea", 2000));
        }};
        for (Map.Entry<String, Livro>  livro : meusLivros1.entrySet()){
            System.out.println(livro.getKey() + " - " + livro.getValue().getNome());
        }

        System.out.println("--\tOdem Alfabética Autores\t--");
        Map<String, Livro> meusLivros2 = new TreeMap<>(meusLivros);
        for (Map.Entry<String, Livro>  livro : meusLivros2.entrySet()){
            System.out.println(livro.getKey() + " - " + livro.getValue().getNome());
        }

        System.out.println("--\tOdem Alfabética Livros\t--");
        Set<Map.Entry<String, Livro>> meusLivros3 = new TreeSet<>(new ComparatorLivros());
        meusLivros3.addAll(meusLivros.entrySet());
        for (Map.Entry<String, Livro>  livro : meusLivros3){
            System.out.println(livro.getKey() + " - " + livro.getValue().getNome());
        }
    }
}
