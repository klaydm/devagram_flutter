import 'dart:convert';
import 'package:devagram_flutter/Dto/ErroDTO.dart';
import 'package:devagram_flutter/Model/UsuarioModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:localstorage/localstorage.dart';

import '../Model/PublicacaoModel.dart';

class PublicacaoService {
  Future<dynamic> criarPublicacao(PublicacaoCriarModel PublicacaoCriarModel) async {
    var resultado;
    final LocalStorage storage = LocalStorage('main');

    var url = Uri.parse('https://devagram-klaydm.vercel.app/api/publicacao');

    var filePayload = await PublicacaoCriarModel.foto.readAsBytes();

    var request = http.MultipartRequest("POST", url);

    request.headers.addAll({
      "Authorization": "Bearer " + storage.getItem("USUARIO_LOGADO")['token']
    });

    request.files.add(
        http.MultipartFile.fromBytes(
            'file', filePayload,
            contentType: MediaType('image', 'png'),
            filename: 'teste.png'));

    request.fields.addAll(PublicacaoCriarModel.toJson() as Map<String, String>);

    var resposta = await request.send();
    var body = await resposta.stream.bytesToString();


    switch (resposta.statusCode) {
      case 200:
        resultado = PublicacaoModel.fromJson(jsonDecode(body)['dados']);
        break;
      default:
        resultado = ErroDTO(
            status: resposta.statusCode, mensagem: jsonEncode(body));
    }

    return resultado;
  }
}
