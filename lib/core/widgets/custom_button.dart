import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/color_pallete.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            ColorPallete.buttonBackGround,
          ),
          fixedSize: WidgetStateProperty.all<Size>(Size.infinite),
          maximumSize: WidgetStateProperty.all<Size>(Size.infinite),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),

        child: child,
      ),
    );
  }
}
