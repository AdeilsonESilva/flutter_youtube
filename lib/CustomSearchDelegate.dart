import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _closeResults(context);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // print(query);

    if (query.isEmpty) {
      return Center(
        child: Text('Nenhum resultado para a pesquisa!'),
      );
    }

    var lista = ['Android', 'Android navegação', 'iOS', 'Jogos']
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(lista[index]),
        onTap: () {
          close(context, lista[index]);
        },
      ),
    );
  }

  void _closeResults(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      close(context, query);
    });
  }
}
