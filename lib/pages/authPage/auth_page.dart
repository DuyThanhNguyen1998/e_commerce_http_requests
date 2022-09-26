import 'package:flutter/material.dart';

import './contents/sign_in_formfield.dart';
import './contents/sign_up_formfield.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static const routeName = '/auth';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _onSignIn = true;

  void _changeAuthContents() {
    setState(() {
      _onSignIn = !_onSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _getPageOnBeforeShowException);
  }

  void _getPageOnBeforeShowException() {
    final arg = ModalRoute.of(context)!.settings.arguments as bool?;
    if (arg != null) {
      setState(() {
        _onSignIn = arg;
      });
    }
  }

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
                _onSignIn ? 'Sign In' : 'Sign Up',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _onSignIn ? 'Welcome Back' : 'Register Account',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                _onSignIn
                    ? 'Sign in with your email and password'
                    : 'Complete your details',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              _onSignIn ? const SignInFormField() : const SignUpFormField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _onSignIn ? 'Don\'t have an account?' : 'Have an account?',
                  ),
                  TextButton(
                    onPressed: _changeAuthContents,
                    child: Text(
                      _onSignIn ? 'Sign Up' : 'Sign In',
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
