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
