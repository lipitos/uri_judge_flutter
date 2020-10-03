import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe_1018 extends StatefulWidget {

  @override
  _Exe_1018_State createState() => _Exe_1018_State();

}

class _Exe_1018_State extends State<Exe_1018> {

  static const platform = const MethodChannel('flutter.native/uri');
  String _result = '';

  Future _calcular() async {

    String resultado;
    int notas = int.parse(nota);

    try {
      resultado = await platform.invokeMethod("bankNotes", {'notas': notas});
    } on PlatformException catch (e) {
      debugPrint("Erro ao acessar o código nativo java " + e.message);
    }

    String result = resultado;

    setState(() {
      this._result = result;
    });

  }

  _reset() {
    _notaController.text = '';
    setState(() {
      _result = '';
    });
  }

  final _notaController = TextEditingController();

  String nota;

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text("Bank Notes"),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
    );

    TextField notas = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Notas",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          nota = text;
        });
      },
      controller: _notaController,
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
                      fontSize: 16,
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