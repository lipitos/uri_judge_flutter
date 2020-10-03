import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe_1009 extends StatefulWidget {

  @override
  _Exe_1009_State createState() => _Exe_1009_State();

}

class _Exe_1009_State extends State<Exe_1009> {

  static const platform = const MethodChannel('flutter.native/uri');
  String _result = '';

  Future _calcular() async {

    double bonus = 0.0;
    double salario = double.parse(salarioVendedor);
    double comissao = double.parse(comissaoVendedor);

    try {
      bonus = await platform.invokeMethod("salaryWithBonus", {'salarioVendedor': salario, 'comissaoVendedor': comissao});
    } on PlatformException catch (e) {
      debugPrint("Erro ao acessar o código nativo java " + e.message);
    }

    String result = "O salário do vendedor " + nomeVendedor + " foi de R\$ " + bonus.toStringAsFixed(2);

    setState(() {
      this._result = result;
    });

  }

  final _nomeController = TextEditingController();
  final _salarioController = TextEditingController();
  final _comissaoController = TextEditingController();

  String nomeVendedor = "";
  String salarioVendedor;
  String comissaoVendedor;

  _reset() {
    _nomeController.text = '';
    _salarioController.text = '';
    _comissaoController.text = '';
    setState(() {
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text("Salary with Bonus"),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
    );

    TextField nome = TextField(
      decoration: InputDecoration(
        labelText: "Nome",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          nomeVendedor = text;
        });
      },
      controller: _nomeController,
    );

    TextField salario = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Salário",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          salarioVendedor = text;
        });
      },
      controller: _salarioController,
    );

    TextField comissao = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Comissão",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          comissaoVendedor = text;
        });
      },
      controller: _comissaoController,
    );

    RaisedButton enviar = RaisedButton(
      onPressed: (){
        _calcular();
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Row(
        children: <Widget> [
          Icon(
              Icons.done,
              color: Colors.white
          ),
          Text("Enviar",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)
      ),
      color: Colors.blueAccent,
    );

    RaisedButton limpar = RaisedButton(
      onPressed: (){
        _reset();
      },
      child: Row(
        children: <Widget> [
          Icon(
              Icons.restore_from_trash,
              color: Colors.white
          ),
          Text("Limpar",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)
      ),
      color: Colors.deepOrange,
    );

    Padding padding = Padding(
      padding: EdgeInsets.only(),
    );

    Row row = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: enviar,
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: limpar,
        ),
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column (
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: nome,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: salario,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: comissao,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: row,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    _result,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                    ),
                )
              ),
            ],
          )
      ),
    );

    return scaffold;
  }

}