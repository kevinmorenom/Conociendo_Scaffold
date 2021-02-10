import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  //this is a comment to check commit
  bool pLike = false;
  bool pDislike = false;
  int counter = 0;
  DateTime now;
  DateTime date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Image.asset("assets/iteso.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ITESO, Universidad Jesuita de Guadalajara ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("San Pedro Tlaquepaque,Jal")
                      ],
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.thumb_up,
                          color: pLike ? Colors.blue : Colors.grey),
                      onPressed: () {
                        counter++;
                        pLike = !pLike;
                        setState(() {});
                      }),
                  IconButton(
                      icon: Icon(Icons.thumb_down,
                          color: pDislike ? Colors.red : Colors.grey),
                      onPressed: () {
                        counter--;
                        pDislike = !pDislike;
                        setState(() {});
                      }),
                  Text(("$counter")),
                  SizedBox(width: 10)
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                          iconSize: 60,
                          icon: Icon(Icons.mail),
                          onPressed: () {
                            _scaffoldKey.currentState
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                  SnackBar(content: Text("Enviar Correo")));
                          }),
                      Text("Correo")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                          iconSize: 60,
                          icon: Icon(Icons.call),
                          onPressed: () {
                            _scaffoldKey.currentState
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                  SnackBar(content: Text("Hacer LLamada")));
                          }),
                      Text("Llamar")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                          iconSize: 60,
                          icon: Icon(Icons.directions),
                          onPressed: () {
                            _scaffoldKey.currentState
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                  SnackBar(content: Text("ir a ITESO")));
                          }),
                      Text("Ruta")
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  "Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas."),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    if (counter % 2 == 0) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text("Los likes son Pares"),
                                content: Text("El número de likes es par"),
                                actions: <Widget>[
                                  TextButton(
                                      child: Text("close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      })
                                ]);
                          });
                      print("es par");
                    } else {
                      now = new DateTime.now();
                      date = new DateTime(now.year, now.month, now.day);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text("Los likes son Impares"),
                                content: Text("Fecha y Hora actuales: $now"),
                                actions: <Widget>[
                                  TextButton(
                                      child: Text("close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      })
                                ]);
                          });
                    }
                  },
                  child: Text('Par or Impar'),
                )
              ],
            )
          ]),
        ));
  }
}
