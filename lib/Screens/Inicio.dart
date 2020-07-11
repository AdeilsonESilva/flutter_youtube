import 'package:flutter/material.dart';

import '../Api.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Api api = Api();
    api.pesquisar('');

    return Container(
      child: Center(
        child: Text(
          'Início',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
