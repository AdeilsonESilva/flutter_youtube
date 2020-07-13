import 'package:flutter/material.dart';
import 'package:flutter_ajtube/CONFIG.dart';
import 'package:flutter_ajtube/models/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import '../services/Api.dart';

class Inicio extends StatefulWidget {
  final String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Video>> _listarVideo(String pesquisa) {
    print(pesquisa);
    Api api = Api();

    return api.pesquisar(pesquisa);
  }

  @override
  void initState() {
    super.initState();
    print('chamado 1 - initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('chamado 2 - didChangeDependencies');
  }

  @override
  void didUpdateWidget(Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('chamado 2 - didUpdateWidget');
  }

  @override
  void dispose() {
    super.dispose();
    print('chamado 4 - dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('chamado 3 - build');

    return FutureBuilder<List<Video>>(
      future: _listarVideo(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (!snapshot.hasData) {
              return Center(
                child: Text('Nenhum dado a ser exibido!'),
              );
            }

            return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: Config.CHAVE_YOUTUBE_API,
                        videoId: snapshot.data[index].id,
                        autoPlay: true,
                        fullScreen: true,
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snapshot.data[index].imagem),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(snapshot.data[index].titulo),
                          subtitle: Text(snapshot.data[index].canal),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                itemCount: snapshot.data.length);
        }

        return Text('Error');
      },
    );
  }
}
