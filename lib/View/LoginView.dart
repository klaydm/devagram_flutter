import 'package:devagram_flutter/Constant/Colors.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginViewState();

}

class _LoginViewState extends State<LoginView>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Image.asset("assets/images/logo.png"),
          const Padding(
            padding: EdgeInsets.only(bottom: 0, left: 32, top: 56, right: 32),
            child:
              TextField(
               style: TextStyle(color: primaryColor),
              decoration: InputDecoration(
                icon: ImageIcon(AssetImage("assets/icons/envelope.png"), color: primaryColor,),
                hintText: 'E-mail'
              ),
            ),
          ),
            const Padding(
              padding: EdgeInsets.only(bottom: 0, left: 32, top: 0, right: 32),
              child:
              TextField(
                obscureText: true,
                style: TextStyle(color: primaryColor),
                decoration: InputDecoration(
                    icon: ImageIcon(AssetImage("assets/icons/key.png"), color: primaryColor,),
                    hintText: 'Senha'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0, left: 32, top: 40, right: 32),
              child: TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
                  minimumSize: Size(size.width, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                ),
                child: const Text('Login'),
              ),
            ),
            const Padding(
            padding: EdgeInsets.only(bottom: 0, left: 0, top: 40, right: 0),
            child: Text(
              'Não possui conta?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: grayColor),
            ),
            ),
            const Text(''
                'Faça seu cadastro agora!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryColor,
                decoration: TextDecoration.underline
              )
            )
          ],
        ),
      ),
    );

  }

}