import 'dart:convert';
import 'package:devagram_flutter/Dto/ErroDTO.dart';
import 'package:devagram_flutter/Model/UsuarioModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UsuarioService {
  Future<dynamic> cadastrar(UsuarioCadastrarModel usuarioCadastrarModel) async {
    var resultado;

    var url = Uri.parse('https://devagram-klaydm.vercel.app/api/cadastro');

    var filePayload = await usuarioCadastrarModel.avatar.readAsBytes();

    var request = http.MultipartRequest("POST", url);

    request.files.add(
        http.MultipartFile.fromBytes(
            'file', filePayload,
            contentType: MediaType('image', 'png'),
            filename: 'teste.png'));

    request.fields.addAll(usuarioCadastrarModel.toJson() as Map<String, String>);

    var resposta = await request.send();
    var body = await resposta.stream.bytesToString();


    switch (resposta.statusCode) {
      case 200:
        resultado = UsuarioModel.fromJson(jsonDecode(body)['dados']);
        break;
      default:
        resultado = ErroDTO(
            status: resposta.statusCode, mensagem: jsonEncode(body));
    }

    return resultado;
  }
}
