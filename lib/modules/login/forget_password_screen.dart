import 'package:flutter/material.dart';

import '../../core/constant/assets/assets.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
          style: TextStyle(
            color: ColorPallete.buttonBackGround,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: ColorPallete.buttonBackGround),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  Assets.forgetpassword,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 25),
              CustomTextFormField(
                hintText: 'Email',
                prefixIcon: Image.asset(Assets.emailIcon),
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPressed: () {},
                child: Text(
                  'Verify Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
