import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/core/widgets/change_language_widget.dart';

import '../../core/constant/assets/assets.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Center(child: Image.asset(Assets.login, height: 120)),
              SizedBox(height: 30),
              CustomTextFormField(
                hintText: 'Email',
                prefixIcon: Image.asset(Assets.emailIcon),
              ),
              CustomTextFormField(
                hintText: 'Password',
                prefixIcon: Image.asset(Assets.passwordIcon),
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PagesRoutesName.forget);
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: ColorPallete.buttonBackGround,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    PagesRoutesName.layout,
                    (route) => false,
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have Account ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed(PagesRoutesName.register);
                    },
                    child: Text(
                      'Create One',
                      style: TextStyle(
                        color: ColorPallete.buttonBackGround,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 2,
                    color: ColorPallete.buttonBackGround,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "OR",
                    style: TextStyle(
                      color: ColorPallete.buttonBackGround,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 40,
                    height: 2,
                    color: ColorPallete.buttonBackGround,
                  ),
                ],
              ),
              SizedBox(height: 15),

              CustomButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.icongoogle, height: 24, width: 24),
                    SizedBox(width: 10),
                    Text(
                      "Login With Google",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              const ChangeLanguageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
