import 'package:flutter/material.dart';

import '../../../general_widgets/content_formfield.dart';
import '../../../general_widgets/button_formfield.dart';

class SignInFormField extends StatefulWidget {
  const SignInFormField({super.key});

  @override
  State<SignInFormField> createState() => _SignInFormFieldState();
}

class _SignInFormFieldState extends State<SignInFormField> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  String? _emailErrorText;

  String? _passwordErrorText;

  String? _emailValidator(String? value) {
    return null;
  }

  String? _passwordValidator(String? value) {
    return null;
  }

  void _signInFn() {
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();

    if (_formKey.currentState!.validate()) {}
  }

  void _forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ContentFormField(
            key: const ValueKey('email'),
            title: 'Email',
            controller: _emailController,
            focus: _emailFocusNode,
            validatorFn: _emailValidator,
            errorText: _emailErrorText,
          ),
          ContentFormField(
            key: const ValueKey('password'),
            title: 'Password',
            controller: _passwordController,
            focus: _passwordFocusNode,
            validatorFn: _passwordValidator,
            errorText: _passwordErrorText,
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                onPressed: _forgotPassword,
                child: Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: ButtonFormField(label: 'Sign In', fn: _signInFn),
          ),
        ],
      ),
    );
  }
}
