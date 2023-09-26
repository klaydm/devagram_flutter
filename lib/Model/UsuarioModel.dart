import 'dart:io';

class UsuarioModel {
  final String id;
  final String nome;
  final String email;
  final int seguidores;
  final int seguindo;
  final int publicacoes;
  final String token;

  UsuarioModel(
      {required this.id,
      required this.nome,
      required this.email,
      required this.seguidores,
      required this.seguindo,
      required this.publicacoes,
      required this.token});

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      seguidores: json['seguidores'],
      seguindo: json['seguindo'],
      publicacoes: json['publicacoes'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'email': email,
        'seguidores': seguidores,
        'seguindo': seguindo,
        'postagens': publicacoes,
        'token': token,
      };
}

class UsuarioCadastrarModel {
  final File avatar;
  final String nome;
  final String email;
  final String senha;

  UsuarioCadastrarModel(
      {required this.avatar,
        required this.nome,
        required this.email,
        required this.senha});

  factory UsuarioCadastrarModel.fromJson(Map<String, dynamic> json) {
    return UsuarioCadastrarModel(
        avatar: json['avatar'],
        nome: json['nome'],
        email: json['email'],
        senha: json['senha']);
  }

  Map<String, dynamic> toJson() =>
      { 'nome': nome,
        'email': email,
        'senha': senha
    };
}
