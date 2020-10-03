import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe_3040 extends StatefulWidget {

  @override
  _Exe_3040_State createState() => _Exe_3040_State();

}

class _Exe_3040_State extends State<Exe_3040> {

  static const platform = const MethodChannel('flutter.native/uri');
  String _result = '';

  Future _calcular() async {

    String resultado;
    int h = int.parse(heightTree);
    int d = int.parse(diameterTree);
    int b = int.parse(branchTree);

    try {
      resultado = await platform.invokeMethod("tree", {'height': h, 'diameter': d, 'branchs': b});
    } on PlatformException catch (e) {
      debugPrint("Erro ao acessar o código nativo java " + e.message);
    }

    String result = resultado;

    setState(() {
      this._result = result;
    });

  }

  final _heightController = TextEditingController();
  final _diameterController = TextEditingController();
  final _branchController = TextEditingController();

  String heightTree;
  String diameterTree;
  String branchTree;

  _reset() {
    _heightController.text = '';
    _diameterController.text = '';
    _branchController.text = '';
    setState(() {
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text("The Christmas Tree"),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
    );

    TextField diameter = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Diâmetro",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          diameterTree = text;
        });
      },
      controller: _diameterController,
    );

    TextField height = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Altura",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          heightTree = text;
        });
      },
      controller: _heightController,
    );

    TextField branch = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Galhos",
        border: OutlineInputBorder(),
      ),
      onChanged: (text){
        setState((){
          branchTree = text;
        });
      },
      controller: _branchController,
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
                child: height,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: diameter,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: branch,
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