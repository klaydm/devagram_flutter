import 'dart:io';

class PublicacaoModel {
  final String idUsuario;
  final String descricao;
  final String foto;
  final DateTime data;
  final List<dynamic> comentarios;
  final List<dynamic> likes;


  PublicacaoModel({
    required this.idUsuario,
    required this.descricao,
    required this.foto,
    required this.data,
    required this.comentarios,
    required this.likes,
  });

  factory PublicacaoModel.fromJson(Map<String, dynamic> json) {
    return PublicacaoModel(
      idUsuario: json['idUsuario'],
      descricao: json['descricao'],
      foto: json['foto'],
      data: DateTime.parse(json['data']),
      comentarios: json['comentarios'],
      likes: json['likes']
    );
  }

  Map<String, dynamic> toJson() => {
        'idUsuario': idUsuario,
        'descricao': descricao,
        'foto': foto,
        'data': data,
        'comentarios': comentarios,
        'likes': likes
      };
}

class PublicacaoCriarModel {
  final File foto;
  final String descricao;


  PublicacaoCriarModel(
      {required this.foto,
        required this.descricao
      });

  factory PublicacaoCriarModel.fromJson(Map<String, dynamic> json) {
    return PublicacaoCriarModel(
        foto: json['foto'],
        descricao: json['descricao']);
  }

  Map<String, dynamic> toJson() => {
      'descricao': descricao,
  };
}
