import 'package:flutter/material.dart';
import 'package:flutter_ajtube/CustomSearchDelegate.dart';

import 'package:flutter_ajtube/Screens/Biblioteca.dart';
import 'package:flutter_ajtube/Screens/EmAlta.dart';
import 'package:flutter_ajtube/Screens/Inicio.dart';
import 'package:flutter_ajtube/Screens/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    print('build Home');
    List<Widget> _telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Image.asset(
          'assets/images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              print('on search $res');
              setState(() {
                _resultado = res;
              });
            },
          ),

          // IconButton(
          //   icon: Icon(Icons.videocam),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: Icon(Icons.account_circle),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _telas[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.orange,
            title: Text('Início'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            title: Text('Em alta'),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
            title: Text('Inscrições'),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,
            title: Text('Biblioteca'),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
