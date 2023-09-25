import 'package:devagram_flutter/Constant/Colors.dart';
import 'package:devagram_flutter/Dto/ErroDTO.dart';
import 'package:devagram_flutter/Service/AuthService.dart';
import 'package:devagram_flutter/Util/ScreenConverter.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../Component/CustomTextField.dart';
import 'RegistrarView.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final LocalStorage storage = LocalStorage('main');

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
