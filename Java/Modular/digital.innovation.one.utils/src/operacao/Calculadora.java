package operacao;

import operacao.Internal.DivHelper;
import operacao.Internal.MultHelper;
import operacao.Internal.SubHelper;
import operacao.Internal.SumHelper;

public class Calculadora {

    private DivHelper divHelper;
    private MultHelper multHelper;
    private SumHelper sumHelper;
    private SubHelper subHelper;

    public Calculadora(){
        divHelper = new DivHelper();
        multHelper = new MultHelper();
        sumHelper = new SumHelper();
        subHelper = new SubHelper();
    }

    public int sum(int a, int b){
        return sumHelper.execucao(a,b);
    }

    public int sub(int a, int b){
        return subHelper.execucao(a,b);
    }

    public int mult(int a, int b){
        return multHelper.execucao(a,b);
    }

    public int div(int a, int b){
        return divHelper.execucao(a,b);
    }
}
