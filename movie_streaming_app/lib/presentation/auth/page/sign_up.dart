import 'package:flutter/material.dart';
import 'package:movie_streaming_app/common/helper/message/display_message.dart';
import 'package:movie_streaming_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/core/configs/theme/app_colors.dart';
import 'package:movie_streaming_app/data/auth/models/signup_req_params.dart';
import 'package:movie_streaming_app/domain/auth/usecases/signup_usecase.dart';
import 'package:movie_streaming_app/presentation/auth/page/sign_in.dart';
import 'package:movie_streaming_app/presentation/home/page/home_page.dart';
import 'package:movie_streaming_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signUpText(),
              SizedBox(height: 30),
              _emailField(),
              SizedBox(height: 20),
              _passwordField(),
              SizedBox(height: 60),
              _signUpButton(context),
              SizedBox(height: 10),
              _signupText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpText() {
    return Label(
      label: 'Sign Up',
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCtrl,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async {
        await sl<SignUpUseCase>().call(
          params: SignupReqParams(
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigator.pushReplacement(context, HomePage());
      },
      onFailure: (error) {
        print(error);
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Label(
          label: 'Already have account?',
          fontSize: 14,
        ),
        InkWell(
          onTap: () {
            AppNavigator.push(context, SignInPage());
          },
          child: Label(
            label: ' Sign In',
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
