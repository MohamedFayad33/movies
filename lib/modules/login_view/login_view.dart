import 'package:flutter/material.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.white ,title: Text("Login View",style: TextStyle(fontSize: 30,color: Colors.red)),centerTitle: true,) ,
    backgroundColor: Colors.orange,
    );
  }
}
