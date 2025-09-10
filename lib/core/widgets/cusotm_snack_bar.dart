import 'package:flutter/material.dart';

SnackBar customSnackBar({required String message}) {
  return SnackBar(
    content: Center(
      child: Text(
        message,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    backgroundColor: Colors.white,
  );
}

AlertDialog alertDialog() {
  return AlertDialog();
}
