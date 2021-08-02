import java.util.stream.IntStream;

public class ParallelStream {
    public static void main(String[] args) {
        //Serial
        long    inicio = System.currentTimeMillis();
//        IntStream.range(1, 10000).forEach(num->fatorial(num)); //Serial Streams
        IntStream.range(1, 100000).forEach(num->fatorial(num));
        long fim = System.currentTimeMillis();
        System.out.println("tempo de execução serial: " + (fim-inicio));

        //Parallel
        long    inicio2 = System.currentTimeMillis();
//        IntStream.range(1, 10000).forEach(num->fatorial(num)); //Serial Streams
        IntStream.range(1, 100000).parallel().forEach(ParallelStream::fatorial);
        long fim2 = System.currentTimeMillis();
        System.out.println("tempo de execução parallel: " + (fim2-inicio2));

    }

    public static long fatorial(long nun){
        long fat = 1;
        for (int i = 2; i <= nun; i ++){
            fat *= i;
        }
        return fat;
    }
}
