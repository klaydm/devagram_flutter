import 'package:flutter/material.dart';
import '../Constant/Colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textHint,
    required this.iconPath,
    this.obscureText = false,
  }): super (key: key);

  final textHint;
  final String iconPath;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: size.width,
        maxWidth: size.width,
        minHeight: 40,
        maxHeight: 40
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: primaryColor))
        ),
        child: TextField(
         obscureText: obscureText,
         style: const TextStyle(color: primaryColor),
        decoration: InputDecoration(
          icon: ImageIcon(AssetImage(iconPath), color: primaryColor,),
          hintText: textHint,
          border: InputBorder.none
        ),
        ),
      ),
    );
  }
}