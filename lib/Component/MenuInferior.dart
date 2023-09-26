import 'package:flutter/material.dart';

import '../Constant/Colors.dart';
import '../Constant/Enum/MenuSelecionadoEnum.dart';
import '../Util/ScreenConverter.dart';

class MenuInferior extends StatelessWidget {
  final menuSelecionado;

  const MenuInferior({Key? key, required this.menuSelecionado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: convertHeight(55, size.height),
          maxHeight: convertHeight(55, size.height),
          minWidth: size.width,
          maxWidth: size.width),
      child: DecoratedBox(
        decoration: const BoxDecoration(color: blueColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
            onTap: () {
              if(menuSelecionado != MenuSelecionadoEnum.HOME) {
                Navigator.of(context).popAndPushNamed('/home');
              }
            },
              child: Image.asset(
                "assets/icons/home.png",
                color: menuSelecionado == MenuSelecionadoEnum.HOME
                    ? primaryColor
                    : grayColor,
              ),
            ),
            InkWell(
              onTap: () {
                if(menuSelecionado != MenuSelecionadoEnum.PUBLICACAO) {
                  Navigator.of(context).popAndPushNamed('/publicacao');
                }
              },
                child: Image.asset(
              "assets/icons/adicionar.png",
              color: menuSelecionado == MenuSelecionadoEnum.PUBLICACAO
                  ? primaryColor
                  : grayColor,
            )),
            InkWell(
              onTap: () {
                if(menuSelecionado != MenuSelecionadoEnum.PERFIL) {
                  Navigator.of(context).popAndPushNamed('/perfil');
                }
              },
              child: Image.asset(
                "assets/icons/user.png",
                color: menuSelecionado == MenuSelecionadoEnum.PERFIL
                    ? primaryColor
                    : grayColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
