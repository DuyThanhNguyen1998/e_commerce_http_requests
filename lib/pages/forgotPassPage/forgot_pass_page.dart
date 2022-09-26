import 'package:flutter/material.dart';

import '/pages/authPage/auth_page.dart';
import './contents/forgot_pass_formfield.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key});

  static const routeName = '/forgot-pass';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 32
                        : 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, AuthPage.routeName);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.blueGrey[500],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Forgot Password',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Reset Your Password',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Please enter your email and we will send \nyou a link to return to your account',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              const ForgotPassFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
