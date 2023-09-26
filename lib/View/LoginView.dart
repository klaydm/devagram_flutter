import 'package:devagram_flutter/Constant/Colors.dart';
import 'package:devagram_flutter/Dto/ErroDTO.dart';
import 'package:devagram_flutter/Service/AuthService.dart';
import 'package:devagram_flutter/Util/ScreenConverter.dart';
import 'package:devagram_flutter/View/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../Component/CustomTextField.dart';
import 'RegistrarView.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LocalStorage storage = LocalStorage('main');

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

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
                      top: convertHeight(133, size.height),
                      right: 0),
                  child: Image.asset("assets/images/logo.png")),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0,
                    left: convertWidth(32, size.width),
                    top: convertHeight(56, size.height),
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
                    top: convertHeight(40, size.height),
                    right: convertWidth(32, size.width)),
                child: TextButton(
                  onPressed: () {
                    AuthService()
                        .login(emailController.text, senhaController.text)
                        .then((resposta) {
                          if(resposta.runtimeType == ErroDTO) {
                            print('Usuário ou senha incorretos!!!.');
                          }else{
                            Navigator.of(context).popAndPushNamed('/home');
                            storage.setItem("USUARIO_LOGADO", resposta);
                          }
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
                  child: const Text('Login'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0,
                    left: 0,
                    top: convertHeight(24, size.height),
                    right: 0),
                child: const Text(
                  'Não possui conta?',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: grayColor),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegistrarView()));
                },
                child: const Text(
                    ''
                    'Faça seu cadastro agora!',
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
