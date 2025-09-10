import 'package:flutter/material.dart';

class ActionMovies extends StatelessWidget {
  const ActionMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Action Movies", style: TextStyle(color: Colors.red)),
      ),
      backgroundColor: Colors.orange,
    );
  }
}
