import 'dart:io';

import 'package:devagram_flutter/Constant/Colors.dart';
import 'package:devagram_flutter/Dto/ErroDTO.dart';
import 'package:devagram_flutter/Service/UsuarioService.dart';
import 'package:devagram_flutter/Util/ScreenConverter.dart';
import 'package:devagram_flutter/View/HomeView.dart';
import 'package:devagram_flutter/View/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localstorage/localstorage.dart';

import '../Component/CustomTextField.dart';
import '../Model/UsuarioModel.dart';

class RegistrarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrarViewState();
}

class _RegistrarViewState extends State<RegistrarView> {
  final LocalStorage storage = LocalStorage('main');

  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final repitaSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      bottom: 0,
                      left: 0,
                      top: convertHeight(40, size.height),
                      right: 0),
                  child: InkWell(
                    onTap: () async {
                      PickedFile? pickedFile = (await _picker.pickImage(
                          source: ImageSource.gallery)) as PickedFile?;
                      if (_pickedFile != null) {
                        _image = File(_pickedFile!.path);
                      }
                    },
                    child: SizedBox(
                      child: Stack(
                        children: [
                          _image != null
                              ? Container(
                            width: convertWidth(200, size.width),
                            height: convertHeight(200, size.height),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image : Image.file(
                                    _image!,
                                    width: convertWidth(110, size.width),
                                    height: convertHeight(110, size.height),
                                  ).image,
                                fit: BoxFit.fill
                              )
                            ),
                          )
                              : Image.asset("assets/images/avatar.png"),
                          Positioned(
                            top: convertHeight(65, size.height),
                            left: convertHeight(65, size.height),
                            child: Image.asset("assets/icons/camera.png"),
                          )
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0,
                    left: convertWidth(32, size.width),
                    top: convertHeight(48, size.height),
                    right: convertWidth(32, size.width)),
                child: CustomTextField(
                  textHint: 'Nome Completo',
                  iconPath: 'assets/icons/user.png',
                  textController: nomeController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0,
                    left: convertWidth(32, size.width),
                    top: convertHeight(24, size.height),
                    right: convertWidth(32, size.width)),
                child: CustomTextField(
                  textHint: 'E-mail',
                  iconPath: 'assets/icons/envelope.png',
                  textController: emailController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0,
                    left: convertWidth(32, size.width),
                    top: convertHeight(24, size.height),
                    right: convertWidth(32, size.width)),
                child: CustomTextField(
                  textHint: 'Senha',
                  iconPath: 'assets/icons/key.png',
                  obscureText: true,
                  textController: senhaController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0,
                    left: convertWidth(32, size.width),
                    top: convertHeight(24, size.height),
                    right: convertWidth(32, size.width)),
                child: CustomTextField(
                  textHint: 'Confirmar Senha',
                  iconPath: 'assets/icons/key.png',
                  obscureText: true,
                  textController: repitaSenhaController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0,
                    left: convertWidth(32, size.width),
                    top: convertHeight(40, size.height),
                    right: convertWidth(32, size.width)),
                child: TextButton(
                  onPressed: () {
                    var usuarioCadastrar = UsuarioCadastrarModel(
                      avatar: _image!,
                      nome: nomeController.text,
                      email: emailController.text,
                      senha: senhaController.text
                    );

                    UsuarioService().cadastrar(usuarioCadastrar).then((res){
                      if(res.runtimeType == ErroDTO) {
                        print('Erro ao cadastrar usuário');
                        print(res.mensagem);
                      }else{
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomeView()
                        ));

                        storage.setItem('USUARIO_LOGADO', res);
                      }

                    }).catchError((err) {
                      print(err);
                    });
                  },
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(
                          fontSize: convertHeight(16, size.height),
                          fontWeight: FontWeight.w600),
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      minimumSize:
                          Size(size.width, convertHeight(48, size.height)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  child: const Text('Cadastrar'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0,
                    left: 0,
                    top: convertHeight(24, size.height),
                    right: 0),
                child: const Text(
                  'Já possui conta?',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: grayColor),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                },
                child: const Text('Faça seu login agora!',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        decoration: TextDecoration.underline)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
