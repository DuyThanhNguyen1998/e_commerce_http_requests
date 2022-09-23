import 'package:flutter/material.dart';

import '../../../general_widgets/content_formfield.dart';
import '../../../general_widgets/button_formfield.dart';

class SignUpFormField extends StatefulWidget {
  const SignUpFormField({super.key});

  @override
  State<SignUpFormField> createState() => _SignUpFormFieldState();
}

class _SignUpFormFieldState extends State<SignUpFormField> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPassController = TextEditingController();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  final _confirmPassFocusNode = FocusNode();

  String? _emailErrorText;

  String? _passwordErrorText;

  String? _confirmPassErrorText;

  String? _emailValidator(String? value) {
    return null;
  }

  String? _passwordValidator(String? value) {
    return null;
  }

  String? _confirmPassValidator(String? value) {
    return null;
  }

  void _signUpFn() {
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _confirmPassFocusNode.unfocus();

    if (_formKey.currentState!.validate()) {}
  }

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
          ContentFormField(
            key: const ValueKey('confirm password'),
            title: 'Confirm Password',
            controller: _confirmPassController,
            focus: _confirmPassFocusNode,
            validatorFn: _confirmPassValidator,
            errorText: _confirmPassErrorText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: ButtonFormField(label: 'Sign Up', fn: _signUpFn),
          ),
        ],
      ),
    );
  }
}
