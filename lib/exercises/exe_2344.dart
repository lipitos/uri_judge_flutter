import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe_2344 extends StatefulWidget {

  @override
  _Exe_2344_State createState() => _Exe_2344_State();

}

class _Exe_2344_State extends State<Exe_2344> {

  static const platform = const MethodChannel('flutter.native/uri');
  String _result = '';

  Future _calcular() async {

    String conceito;
    int notas = int.parse(notasQtd);

    try {
      conceito = await platform.invokeMethod("notasProva", {'nota': notas});
    } on PlatformException catch (e) {
      debugPrint("Erro ao acessar o código nativo java " + e.message);
    }

    String result = conceito;

    setState(() {
      this._result = result;
    });

  }

  final _notasController = TextEditingController();

  String notasQtd;


  _reset() {
    _notasController.text = '';
    setState(() {
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text("Notas da Prova"),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
    );

    TextField notas = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Nota da Prova",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          notasQtd = text;
        });
      },
      controller: _notasController,
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
                child: notas,
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
                      fontSize: 28,
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