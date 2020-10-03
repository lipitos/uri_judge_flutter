import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe_1001 extends StatefulWidget {

  @override
  _Exe_1001_State createState() => _Exe_1001_State();

}

class _Exe_1001_State extends State<Exe_1001> {

  static const platform = const MethodChannel('flutter.native/uri');
  String _result = '';

  Future _calcular() async {


    int a = int.parse(numeroA);
    int b = int.parse(numeroB);
    int soma = 0;

    try {
      soma = await platform.invokeMethod("extremelyBasic", {'a': a, 'b': b});
    } on PlatformException catch (e) {
      debugPrint("Erro ao acessar o código nativo java " + e.message);
    }

    String result = "X = " + soma.toString();

    setState(() {
      this._result = result;
    });

  }

  final _aController = TextEditingController();
  final _bController = TextEditingController();

  String nomeVendedor = "";
  String numeroA;
  String numeroB;

  _reset() {
    _aController.text = '';
    _bController.text = '';
    setState(() {
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text("Extremely Basic"),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
    );

    TextField a = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "A",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          numeroA = text;
        });
      },
      controller: _aController,
    );

    TextField b = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "B",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          numeroB = text;
        });
      },
      controller: _bController,
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
                child: a,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: b,
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