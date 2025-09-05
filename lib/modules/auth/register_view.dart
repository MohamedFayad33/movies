import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/core/theme/color_pallete.dart';
import 'package:movies_app/core/widgets/change_language_widget.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';
import 'package:movies_app/modules/auth/widgets/custom_carouse_slider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  final List<String> avatars = const [
    Assets.boyAvatar,
    Assets.womanAvatar,
    Assets.girlAvatar,
    Assets.manAvatar,
    Assets.avatar1,
    Assets.avatar2,
    Assets.avatar3,
    Assets.avatar4,
    Assets.avatar5,
    Assets.avatar6,
    Assets.avatar7,
    Assets.avatar8,
    Assets.avatar9,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(color: ColorPallete.buttonBackGround),
        ),
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: ColorPallete.buttonBackGround),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomCarouseSlider(avatars: avatars),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'Name',
                prefixIcon: Image.asset(Assets.nameIcon),
              ),
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
              CustomTextFormField(
                hintText: 'Confirm Password',
                prefixIcon: Image.asset(Assets.passwordIcon),
                obscureText: !showConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    showConfirmPassword = !showConfirmPassword;
                    setState(() {});
                  },
                  icon: Icon(
                    showConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              CustomTextFormField(
                hintText: 'Phone Number',
                prefixIcon: Image.asset(Assets.phoneIcon),
              ),
              CustomButton(
                onPressed: () {
                  //changes  go to home
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(PagesRoutesName.layout);
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        PagesRoutesName.login,
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: ColorPallete.buttonBackGround,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              const ChangeLanguageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
