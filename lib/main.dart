import 'package:flutter/material.dart';
import 'package:restauranteapp/chat/chat_screen.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de pessoa",
      home: Home()));
}

//stful + tab
//Stateful para widgets q alteram
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//estado interno
class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "pode entrar";

  void _changePeople(int delta) {
    //setState = atualiza a tela
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "mundo invertido?";
      } else if (_people <= 10) {
        _infoText = "pode entrar";
      } else {
        _infoText = "lotado";
      }
    });
  }

  @override
  //build é chamado sempre q precisamos modificar algo no layout
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/original.jpg",
          //cover = preencher a tela
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Positioned(
          bottom: 30.0,
          child: RaisedButton(
            child: Icon(Icons.message, color: Colors.blue,),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> ChatScreen() )
              );
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      //_people++;
                      //debugPrint("-1");
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
    ],
    );
  }
}
