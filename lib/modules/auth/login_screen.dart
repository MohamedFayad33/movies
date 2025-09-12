import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_service/api_endpoint.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/core/widgets/change_language_widget.dart';
import 'package:movies_app/core/widgets/cusotm_snack_bar.dart';
import 'package:movies_app/core/widgets/custom_show_dialog.dart';
import 'package:movies_app/modules/auth/data/models/login_user.dart';
import 'package:movies_app/modules/auth/presentaion/manger/login_bloc/bloc/login_bloc.dart';
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
  late TextEditingController email;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  onSave(BuildContext context) {
    LoginUser user = LoginUser(email: email.text, password: password.text);
    context.read<LoginBloc>().add(
      LoginUserEvent(
        endPoint: ApiEndpoint.lodinEndPoint,
        loginUser: user.toJson(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          customShowDialog(context);
        }
        if (state is LoginError) {
          Navigator.of(context).pop();
          var snack = customSnackBar(message: state.msError);
          ScaffoldMessenger.of(context).showSnackBar(snack);
        }
        if (state is LoginSuccess) {
          Navigator.of(context).pop();
          var snack = customSnackBar(message: 'Account created successfully');
          ScaffoldMessenger.of(context).showSnackBar(snack);
        }
      },
      child: Scaffold(
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
                  controller: email,
                  hintText: 'Email',
                  prefixIcon: Image.asset(Assets.emailIcon),
                ),
                CustomTextFormField(
                  controller: password,
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
                    onSave(context);
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
                        Navigator.of(
                          context,
                        ).pushNamed(PagesRoutesName.register);
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
      ),
    );
  }
}
