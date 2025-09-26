import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/color_pallete.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color = ColorPallete.buttonBackGround,
  });
  final void Function()? onPressed;
  final Widget? child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(color),
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
