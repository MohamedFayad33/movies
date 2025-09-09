import 'package:flutter/material.dart';

Future<dynamic> customShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(8.0),
        content: Center(child: CircularProgressIndicator()),
      );
    },
  );
}
