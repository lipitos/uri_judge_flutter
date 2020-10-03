package br.com.lptis.uri_judge;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "flutter.native/uri";


    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine){
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                (call, result) -> {

                    switch(call.method){
                        case "salaryWithBonus": {
                            double salarioVendedor = call.argument("salarioVendedor");
                            double comissaoVendedor = call.argument("comissaoVendedor");
                            double resultado = salaryWithBonus(salarioVendedor, comissaoVendedor);
                            result.success(resultado);
                        break;
                        }
                        case "notasProva": {
                            int notas = call.argument("nota");
                            String conceito = notasProva(notas);
                            result.success(conceito);
                        break;
                        }
                        case "tree": {
                            int height = call.argument("height");
                            int diameter = call.argument("diameter");
                            int branchs = call.argument("branchs");
                            String resultado = tree(height, diameter, branchs);
                            result.success(resultado);
                        break;
                        }
                        case "bankNotes": {
                            int notas = call.argument("notas");
                            String resultado = bankNotes(notas);
                            result.success(resultado);
                            break;
                        }
                        case "extremelyBasic": {
                            int a = call.argument("a");
                            int b = call.argument("b");
                            Integer resultado = extremelyBasic(a, b);
                            result.success(resultado);
                            break;
                        }
                        default:
                            result.notImplemented();
                    }

                }
        );

    }

    private Double salaryWithBonus(double salario, double comissao){
        return salario + (comissao * 0.15);
    }

    private String notasProva(Integer nota){
        String conceito = null;

        if(nota == 0){
            conceito = "E";
        }else if (nota>0 && nota<36){
            conceito = "D";
        }else if(nota>35 && nota<61){
            conceito = "C";
        }else if(nota>60 && nota<86){
            conceito = "B";
        }else if(nota>85){
            conceito = "A";
        }

        return conceito;
    }

    private String tree(Integer height, Integer diameter, Integer branchs) {
        String resp = "";
        int flag = 0;

        if(height > 199 && height < 301){
            resp = "Sim";
        }else{
            flag = 1;
        }
        if(diameter > 49){
            resp = "Sim";
        }else{
            flag = 1;
        }
        if(branchs > 149){
            resp = "Sim";
        }else{
            flag = 1;
        }

        if (flag == 1){
            resp = "Não";
        }

        return resp;
    }

    private String bankNotes(Integer n){
        int aux, n100, n50, n20, n10, n5, n2, n1;

        n100 = n/100;
        aux = n%100;
        n50 = aux/50;
        aux = aux%50;
        n20 = aux/20;
        aux = aux%20;
        n10 = aux/10;
        aux = aux%10;
        n5 = aux/5;
        aux = aux%5;
        n2 = aux/2;
        aux = aux%2;
        n1 = aux/1;

        String resp = (n + "\n" + n100 + " nota(s) de R$ 100,00\n" +
                n50 + " nota(s) de R$ 50,00\n" +
                n20 + " nota(s) de R$ 20,00\n" +
                n10 + " nota(s) de R$ 10,00\n" +
                n5 + " nota(s) de R$ 5,00\n" +
                n2 + " nota(s) de R$ 2,00\n" +
                n1 +" nota(s) de R$ 1,00\n");

        return resp;

    }

    private Integer extremelyBasic(int a, int b) {
        int resp;
        resp = a + b;

        return resp;
    }

}



