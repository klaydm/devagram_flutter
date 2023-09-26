import 'dart:io';

import 'package:devagram_flutter/Dto/ErroDTO.dart';
import 'package:devagram_flutter/Service/PublicacaoService.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localstorage/localstorage.dart';

import '../Component/MenuInferior.dart';
import '../Constant/Colors.dart';
import '../Constant/Enum/MenuSelecionadoEnum.dart';
import '../Model/PublicacaoModel.dart';
import '../Util/ScreenConverter.dart';

class PublicacaoView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PublicacaoViewState();
}

class _PublicacaoViewState extends State<PublicacaoView> {
  final LocalStorage storage = LocalStorage('main');

  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    _picker.pickImage(source: ImageSource.gallery).then((pickedFile) {
      _pickedFile = pickedFile as PickedFile?;

      if (pickedFile == null) {
        setState(() {
          _image = File(_pickedFile!.path);
        });
      } else {
        Navigator.of(context).popAndPushNamed('home');
      }
    });
  }

  final legendaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    bottom: 0,
                    left: 0,
                    top: convertHeight(32, size.height),
                    right: 0,
                  ),
                  child: SizedBox(
                    width: size.width,
                    height: convertHeight(50, size.height),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: 0,
                                    left: convertWidth(16, size.width),
                                    top: 0,
                                    right: convertWidth(16, size.width),),
                                child: Image.asset("assets/icons/voltar.png")
                                 ),
                            Padding(
                                padding: EdgeInsets.only(                             bottom: 0,
                              top: 0,
                              right: convertWidth(38, size.width),
                            ),
                            child: Text(
                              "Nova Publicação",
                              style: TextStyle(
                                  fontSize: convertHeight(16, size.height),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            ),
                            InkWell(
                              onTap: (){
                                var publicacaoCriar = PublicacaoCriarModel(foto: _image!, descricao: legendaController.text);

                                PublicacaoService().criarPublicacao(publicacaoCriar).then((resposta) {
                                  if(resposta.runtimeType == ErroDTO) {
                                    print(resposta);
                                  }else{
                                    print("Publicação criada com sucesso");
                                    Navigator.of(context).popAndPushNamed('/home');
                                  }
                                });
                                },
                            child: Text(
                              "Compartilhar",
                              style: TextStyle(
                                  fontSize: convertHeight(12, size.height),
                                  color: primaryColor),
                            )),
                          ],
                        ),
                        const Divider(
                          color: lineColor,
                        ),
                        SizedBox(
                          height: convertHeight(100, size.height),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 0,
                                        left: convertWidth(16, size.width),
                                        top: 0,
                                        right: convertWidth(16, size.width)),
                                    child: _image != null
                                        ? Container(
                                            width: convertWidth(80, size.width),
                                            height:
                                                convertHeight(80, size.height),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: Image.file(
                                                      _image!,
                                                      width: convertWidth(
                                                          110, size.width),
                                                      height: convertHeight(
                                                          110, size.height),
                                                    ).image,
                                                    fit: BoxFit.fill)),
                                          )
                                        : Image.asset(
                                            "assets/images/avatar.png",
                                            width: convertWidth(80, size.width),
                                            height:
                                                convertHeight(80, size.height),
                                          ),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: convertHeight(120, size.height),
                                      maxHeight: convertHeight(120, size.height),
                                      minWidth: convertWidth(150, size.width),
                                      maxWidth: convertWidth(150, size.width),
                                    ),
                                    child:  DecoratedBox(
                                      decoration: const BoxDecoration(
                                        border: null,
                                      ),
                                      child: TextField(
                                        controller: legendaController,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Escreva uma legenda"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: lineColor,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Text(storage.getItem("USUARIO_LOGADO")['email']),
              const MenuInferior(
                menuSelecionado: MenuSelecionadoEnum.HOME,
              )
            ],
          ),
        ),
      ),
    );
  }
}
