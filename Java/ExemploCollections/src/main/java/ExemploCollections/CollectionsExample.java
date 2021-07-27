package ExemploCollections;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CollectionsExample {
    public static void main(String[] args){
        List<Gato> meusGatos = new ArrayList<>(){{
            add(new Gato("jon", 18, "preto"));
            add(new Gato("Simba", 6, "tigrado"));
            add(new Gato("jon", 12, "amarelo"));
        }};

        //Imprime por ordem de inserção
        System.out.println("--\tOrdem de Inserção\t--");
        System.out.println(meusGatos + "\n");

        //Imprime numa ordem aleatória
        System.out.println("--\tOrdem Aleatória\t--");
        Collections.shuffle(meusGatos);
        System.out.println(meusGatos + "\n");

        //Imprime na Ordem Natural
        System.out.println("--\tOrdem Natural\t--");
        Collections.sort(meusGatos);
        System.out.println(meusGatos + "\n");

        //Imprime na Ordem Idade
        System.out.println("--\tOrdem Idade\t--");
        meusGatos.sort(new ComparatorIdade());
        System.out.println(meusGatos + "\n");

        //Imprime na Ordem do Nome/Cor/Idade
        System.out.println("--\tOrdem Nome/Cor/Idade\t--");
        meusGatos.sort(new ComparatorNomeCorIdade());
        System.out.println(meusGatos + "\n");



    }
}
