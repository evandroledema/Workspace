public class Thread {
    public static void main(String[] args){
//        BarraDeCArregamento barraDeCArregamento = new BarraDeCArregamento();
        BarraDeCarregamento2 barraDeCarregamento2 = new BarraDeCarregamento2();
        BarraDeCarregamento2 barraDeCarregamento = new BarraDeCarregamento2();

        barraDeCarregamento.start();
        barraDeCarregamento2.start();
    }
}

class GerarPDF implements Runnable{
    @Override
    public void run() {
        System.out.println("Gerar PDF");
    }
}
class BarraDeCArregamento implements Runnable{
    @Override
    public void run() {
        System.out.println("Loading ...");
    }
}

class BarraDeCarregamento2 extends java.lang.Thread {
    @Override
    public void run() {
        super.run();
        System.out.println("rodei : " + this.getName());
    }
}
