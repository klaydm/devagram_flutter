import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../Component/MenuInferior.dart';
import '../Constant/Colors.dart';
import '../Constant/Enum/MenuSelecionadoEnum.dart';
import '../Util/ScreenConverter.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  bottom: 0,
                  left: 0,
                  top: convertHeight(38, size.height),
                  right: 0,),
                child: SizedBox(
                  width: size.width,
                  height: convertHeight(50, size.height),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(
                              bottom: 0,
                              left: convertWidth(16, size.width),
                              top: 0,
                              right: convertWidth(16, size.width)),
                              child: Image.asset("assets/images/logo-horizontal.png")),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: convertWidth(32, size.width),
                              maxHeight: convertWidth(32, size.width),
                              minWidth: convertWidth(190, size.width),
                              maxWidth: convertWidth(190, size.width),),
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  color: blueColor,
                                  border: null,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: TextField(
                                style: const TextStyle(color: primaryColor),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Pesquisar',
                                    icon: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 0,
                                            left: convertWidth(10, size.width),
                                            top: convertHeight(0, size.height),
                                            right: convertWidth(0, size.width)),
                                        child: const ImageIcon(AssetImage('assets/icons/lupa.png')))),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: lineColor,
                      ),
                    ],
                  ),
                )),
            Text(storage.getItem("USUARIO_LOGADO")['email']),
            const MenuInferior(menuSelecionado: MenuSelecionadoEnum.HOME,)
          ],
        )
      ),
    );
  }
}
