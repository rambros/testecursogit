import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, resultado = 0;

  final TextEditingController t1 = TextEditingController(text: '0');
  final TextEditingController t2 = TextEditingController(text: '0');

  int add() {
    return int.parse(t1.text) + int.parse(t2.text);
  }

  Function addState() {
    setState(() {
      resultado = int.parse(t1.text) + int.parse(t2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Resultado: $resultado',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo,
                )),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Entre number',
              ),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Entre number',
              ),
              controller: t2,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text('+'),
                  color: Colors.lightBlueAccent,
                  onPressed: addState,
                    // setState(() {
                    //   resultado = add();
                    //   //resultado = int.parse(t1.text) + int.parse(t2.text);
                    // }),
                  // },
                ),
                RaisedButton(
                  child: Text('-'),
                  color: Colors.lightBlueAccent,
                  onPressed: () => {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('*'),
                  color: Colors.lightBlueAccent,
                  onPressed: () => {},
                ),
                RaisedButton(
                  child: Text('/'),
                  color: Colors.lightBlueAccent,
                  onPressed: () => {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('CLEAR'),
                  color: Colors.green,
                  onPressed: () => {
                    setState((){
                      t1.text = '0';
                      t2.text = '0';
                    })
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
