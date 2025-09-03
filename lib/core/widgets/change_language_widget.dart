import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/core/theme/color_pallete.dart';

class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget({super.key});

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguageWidget> {
  bool animationalignment = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
          side: BorderSide(color: ColorPallete.yellow, width: 2),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: InkWell(
              onTap: () {
                animationalignment = !animationalignment;
                setState(() {});
              },
              child: Row(
                children: [
                  Image.asset(Assets.enIcon),
                  const Spacer(),
                  Image.asset(Assets.arIcon),
                ],
              ),
            ),
          ),
          AnimatedAlign(
            duration: Duration(milliseconds: 100),
            alignment: animationalignment
                ? Alignment.bottomLeft
                : Alignment.bottomRight,
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  side: BorderSide(color: ColorPallete.yellow, width: 4),
                ),
              ),
              child: Opacity(opacity: 0, child: Image.asset(Assets.enIcon)),
            ),
          ),
        ],
      ),
    );
  }
}
