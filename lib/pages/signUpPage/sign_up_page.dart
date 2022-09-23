import 'package:flutter/material.dart';

import '/pages/signInPage/sign_in_page.dart';
import './contents/sign_up_formfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const routeName = '/signUp';

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
                'Sign Up',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Register Account',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Complete your details',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              const SignUpFormField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        SignInPage.routeName,
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'By continuing your confirm that you agree \nwith our Team and Conditions',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
