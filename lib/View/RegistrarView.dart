import 'package:devagram_flutter/Constant/Colors.dart';
import 'package:devagram_flutter/Util/ScreenConverter.dart';
import 'package:devagram_flutter/View/LoginView.dart';
import 'package:flutter/material.dart';

import '../Component/CustomTextField.dart';

class RegistrarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrarViewState();
}

class _RegistrarViewState extends State<RegistrarView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    bottom: 0,
                    left: 0,
                    top: convertHeight(40, size.height),
                    right: 0),
                child: SizedBox(
                  child: Stack(
                    children: [
                      Image.asset("assets/images/avatar.png"),
                      Positioned(
                        top: convertHeight(65, size.height),
                        left: convertHeight(65, size.height),
                        child: Image.asset("assets/icons/camera.png"),
                      )
                    ],
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 0,
                  left: convertWidth(32, size.width),
                  top: convertHeight(48, size.height),
                  right: convertWidth(32, size.width)),
              child: const CustomTextField(
                textHint: 'Nome Completo',
                iconPath: 'assets/icons/user.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 0,
                  left: convertWidth(32, size.width),
                  top: convertHeight(24, size.height),
                  right: convertWidth(32, size.width)),
              child: const CustomTextField(
                textHint: 'E-mail',
                iconPath: 'assets/icons/envelope.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 0,
                  left: convertWidth(32, size.width),
                  top: convertHeight(24, size.height),
                  right: convertWidth(32, size.width)),
              child: const CustomTextField(
                textHint: 'Senha',
                iconPath: 'assets/icons/key.png',
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 0,
                  left: convertWidth(32, size.width),
                  top: convertHeight(24, size.height),
                  right: convertWidth(32, size.width)),
              child: const CustomTextField(
                textHint: 'Confirmar Senha',
                iconPath: 'assets/icons/key.png',
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 0,
                  left: convertWidth(32, size.width),
                  top: convertHeight(40, size.height),
                  right: convertWidth(32, size.width)),
              child: TextButton(
                onPressed: () {},
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
    );
  }
}
