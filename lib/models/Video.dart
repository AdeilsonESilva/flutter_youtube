import 'dart:convert';

class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.canal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'imagem': imagem,
      'canal': canal,
    };
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      descricao: json['descricao'],
      imagem: json['snippet']['thumbnails']['high']['url'],
      canal: json['snippet']['channelId'],
    );
  }
}
