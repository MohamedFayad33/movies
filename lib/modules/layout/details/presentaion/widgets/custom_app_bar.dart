import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (Navigator.of(context).pop),
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 40),
          ),
          IconButton(
            onPressed: (Navigator.of(context).pop),
            icon: Icon(Icons.bookmark, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }
}
