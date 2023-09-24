import 'package:devagram_flutter/Constant/Colors.dart';
import 'package:devagram_flutter/Util/ScreenConverter.dart';
import 'package:flutter/material.dart';

import '../Component/CustomTextField.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                    top: convertHeight(133, size.height),
                    right: 0),
                child: Image.asset("assets/images/logo.png")),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 0,
                  left: convertWidth(32, size.width),
                  top: convertHeight(56, size.height),
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
                  top: convertHeight(40, size.height),
                  right: convertWidth(32, size.width)),
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(
                      fontSize: convertHeight(16, size.height),
                      fontWeight: FontWeight.w600
                      ),
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
            const Text(
                ''
                'Faça seu cadastro agora!',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    decoration: TextDecoration.underline))
          ],
        ),
      ),
    );
  }
}
