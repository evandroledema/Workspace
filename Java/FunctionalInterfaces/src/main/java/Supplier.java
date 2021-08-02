public class Supplier {
    public static void main(String[] args){
//        java.util.function.Supplier<Pessoa> supplier = () -> new Pessoa();
        java.util.function.Supplier<Pessoa> supplier = Pessoa::new;

        System.out.println(supplier.get());
    }
}

class Pessoa{
    private String nome;
    private Integer idade;

    public Pessoa(){
        nome = "Evandro";
        idade = 29;
    }

    @Override
    public String toString() {
        return "nome=" + nome +
                ", idade=" + idade;
    }

//    @Override
//    public String toString(){
//        return String.format("nome: %s, idade: %d", nome, idade);
//    }
}