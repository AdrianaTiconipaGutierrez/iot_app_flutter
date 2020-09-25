import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'nodo.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:wave_progress_widget/wave_progress_widget.dart';

class NodoPage extends StatefulWidget {
  @override
  _NodoPageState createState() => _NodoPageState();
}

class _NodoPageState extends State<NodoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabIndex = 0;
  bool _boton = false;
  int _riego = 0;
  int _calor = 0;
  DatabaseReference _bdRef = FirebaseDatabase.instance.reference();
  DatabaseReference _nodoRef =
      FirebaseDatabase.instance.reference().child('Nodos');
  DatabaseReference _alarmaRef =
      FirebaseDatabase.instance.reference().child('alarmas');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'IOT APP',
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.tealAccent,
          controller: _tabController,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          tabs: [
            Tab(
              icon: Icon(Icons.opacity),
            ),
            Tab(
              icon: Icon(Icons.wb_sunny),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: _nodoRef.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            print('snapshot data: ${snapshot.data.snapshot.value.toString()}');
            var _nodo = Nodo.fromJson(snapshot.data.snapshot.value['Nodo1']);
            print(
                "Nodo Object: ${_nodo.temperatura}/${_nodo.humedad}/${_nodo.nivelDioxidoCarbono}");
            return IndexedStack(
              index: tabIndex,
              children: [
                _humedadLayout(_nodo),
                _temperaturaLayout(_nodo),
              ],
            );
          } else {
            return Center(
              child: Text('No hay datos aun'),
            );
          }
        },
      ),
    );
  }

  Widget _temperaturaLayout(Nodo _nodo) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'TEMPERATURA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FAProgressBar(
                progressColor: Colors.pinkAccent.shade100,
                backgroundColor: Colors.grey,
                direction: Axis.vertical,
                verticalDirection: VerticalDirection.up,
                size: 100,
                currentValue: _nodo.temperatura.round(),
                changeColorValue: 70,
                changeProgressColor: Colors.pink,
                maxValue: 100,
                displayText: ' °C',
                borderRadius: 16,
                animatedDuration: Duration(milliseconds: 500),
              ),
            ),
          ),
          Card(
            color: Colors.deepPurple,
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Temperatura actual: ${_nodo.temperatura.toStringAsFixed(2)} °C",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xffefbdd9),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            _alarmaRef.push().set({
                              'prueba': 'Enviar mensaje de alerta'
                            }).asStream();
                          },
                          backgroundColor: Color(0xffefbdd9),
                          child: Icon(
                            Icons.add_alert,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _boton = !_boton;
                              _calor = 1;
                            });
                            _bdRef
                                .child('calor')
                                .set({'button': _calor}).asStream();
                          },
                          backgroundColor: Color(0xffefbdd9),
                          child: Icon(
                            Icons.invert_colors,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _boton = !_boton;
                              _calor = 0;
                            });
                            _bdRef
                                .child('calor')
                                .set({'button': _calor}).asStream();
                          },
                          backgroundColor: Color(0xffefbdd9),
                          child: Icon(
                            Icons.invert_colors_off,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _humedadLayout(Nodo _nodo) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'HUMEDAD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FAProgressBar(
                progressColor: Colors.tealAccent,
                backgroundColor: Colors.grey,
                direction: Axis.vertical,
                verticalDirection: VerticalDirection.up,
                size: 130,
                currentValue: _nodo.humedad.round(),
                changeColorValue: 50,
                changeProgressColor: Colors.deepPurple,
                maxValue: 100,
                displayText: ' %',
                borderRadius: 16,
                animatedDuration: Duration(milliseconds: 500),
              ),
            ),
          ),
          Card(
            color: Color(0xffefbdd9),
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Porcentaje de humedad: ${_nodo.humedad.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _boton = !_boton;
                              _riego = 1;
                            });
                            _bdRef
                                .child('agua')
                                .set({'button': _riego}).asStream();
                          },
                          backgroundColor: Colors.deepPurple,
                          child: Icon(
                            Icons.cloud_done,
                            color: Color(0xffefbdd9),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _boton = !_boton;
                              _riego = 0;
                            });
                            _bdRef
                                .child('agua')
                                .set({'button': _riego}).asStream();
                          },
                          backgroundColor: Colors.deepPurple,
                          child: Icon(
                            Icons.cloud_off,
                            color: Color(0xffefbdd9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
