import 'package:flutter/material.dart';

import '/pages/signUpPage/sign_up_page.dart';
import './contents/sign_in_formfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const routeName = '/signIn';

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
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Sign in with your email and password',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              const SignInFormField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        SignUpPage.routeName,
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
