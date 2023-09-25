import 'dart:convert';

import 'package:devagram_flutter/Dto/ErroDTO.dart';
import 'package:devagram_flutter/Model/UsuarioModel.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<dynamic> login(String email, String senha) async {
    var resultado;

    var url = Uri.parse('https://devagram-klaydm.vercel.app/api/login');

    var headers = {'Content-Type': 'application/json'};

    var payload = {'email': email, 'senha': senha};

    var resposta =
        await http.post(url, body: jsonEncode(payload), headers: headers);

    switch (resposta.statusCode) {
      case 200:
        resultado = UsuarioModel.fromJson(jsonDecode(resposta.body)['dados']);
        break;

      case 401:
        resultado = ErroDTO(status: 401, mensagem: jsonEncode(resposta.body));
        break;
      default:
        resultado = ErroDTO(
            status: resposta.statusCode, mensagem: jsonEncode(resposta.body));
    }

    return resultado;
  }
}
