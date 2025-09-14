import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_service/api_endpoint.dart';
import 'package:movies_app/core/constant/assets/assets.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/core/theme/color_pallete.dart';
import 'package:movies_app/core/widgets/app_validator.dart';
import 'package:movies_app/core/widgets/change_language_widget.dart';
import 'package:movies_app/core/widgets/cusotm_snack_bar.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_show_dialog.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';
import 'package:movies_app/modules/auth/data/models/register_user.dart';
import 'package:movies_app/modules/auth/presentaion/manger/register_bloc/register_bloc.dart';
import 'package:movies_app/modules/auth/presentaion/widgets/custom_carouse_slider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController phone;
  int carouseSliderIndex = 0;
  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    phone = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    phone.dispose();
  }

  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  void onSave() {
    if (mykey.currentState!.validate()) {
      RegisterUser user = RegisterUser(
        name: name.text,
        email: email.text,
        password: password.text,
        confirmPassword: confirmPassword.text,
        phone: '+2${phone.text}',
        avaterId: carouseSliderIndex,
      );
      context.read<RegisterBloc>().add(
        RegisterUserEvent(
          endPoint: ApiEndpoint.registerEndPoint,
          registerUser: user.toJson(),
        ),
      );
    }
  }

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
      appBar: _appBar(),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            customShowDialog(context);
          }
          if (state is RegisterError) {
            Navigator.of(context).pop();
            var snack = customSnackBar(message: state.msError);
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
          if (state is RegisterSuccess) {
            Navigator.of(context).pop();
            var snack = customSnackBar(message: 'Account created successfully');
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: mykey,
              child: Column(
                children: [
                  CustomCarouseSlider(
                    avatars: avatars,
                    onPageChanged: (index, p1) {
                      carouseSliderIndex = index + 1;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: name,
                    hintText: 'Name',
                    validator: (val) {
                      return AppValidators.validateUsername(val);
                    },
                    prefixIcon: Image.asset(Assets.nameIcon),
                  ),
                  CustomTextFormField(
                    controller: email,
                    hintText: 'Email',
                    validator: (val) {
                      return AppValidators.validateEmail(val);
                    },
                    prefixIcon: Image.asset(Assets.emailIcon),
                  ),
                  CustomTextFormField(
                    controller: password,
                    hintText: 'Password',
                    validator: (val) {
                      return AppValidators.validatePassword(val);
                    },
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
                    controller: confirmPassword,
                    hintText: 'Confirm Password',
                    validator: (val) {
                      return AppValidators.validateConfirmPassword(
                        val,
                        password.text,
                      );
                    },
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
                    controller: phone,
                    hintText: 'Phone Number',
                    validator: (val) {
                      return AppValidators.validatePhoneNumber(val);
                    },
                    prefixIcon: Image.asset(Assets.phoneIcon),
                  ),
                  CustomButton(
                    onPressed: () {
                      //  changes  go to home

                      onSave();
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  _rowText(context),
                  const ChangeLanguageWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
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
    );
  }

  Row _rowText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already Have Account ?', style: TextStyle(color: Colors.white)),
        TextButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(PagesRoutesName.login, (route) => false);
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
    );
  }
}
