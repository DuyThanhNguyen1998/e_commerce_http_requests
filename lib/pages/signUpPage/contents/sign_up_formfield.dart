import 'package:e_commerce_http_requests/helpers/exception_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/repositories/auth_http_repo.dart';
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

  bool? _formIsValided;

  String? _emailErrorText;

  String? _passwordErrorText;

  String? _confirmPassErrorText;

  String? _emailValidator(String? email) {
    setState(() {
      if (email!.isEmpty) {
        _formIsValided = false;
        _emailErrorText = 'Please add an email';
      } else if (!email.contains('@')) {
        _formIsValided = false;
        _emailErrorText = 'Invalid email';
      } else {
        _formIsValided = true;
        _emailErrorText = null;
      }
    });

    return null;
  }

  String? _passwordValidator(String? password) {
    setState(() {
      if (password!.isEmpty) {
        _formIsValided = false;
        _passwordErrorText = 'Please set a password';
      } else if (password.length < 6) {
        _formIsValided = false;
        _passwordErrorText = 'It must be at least 6 characters';
      } else {
        _formIsValided = true;
        _passwordErrorText = null;
      }
    });

    return null;
  }

  String? _confirmPassValidator(String? confirmPass) {
    setState(() {
      if (confirmPass!.isEmpty) {
        _formIsValided = false;
        _confirmPassErrorText = 'Please re-enter password';
      } else if (confirmPass.length < 6) {
        _formIsValided = false;
        _confirmPassErrorText = 'It must be at least 6 characters';
      } else if (confirmPass != _passwordController.text.trim()) {
        _formIsValided = false;
        _confirmPassErrorText = 'Wrong password';
      } else {
        _formIsValided = true;
        _confirmPassErrorText = null;
      }
    });

    return null;
  }

  void _signUpFn() async {
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _confirmPassFocusNode.unfocus();

    if (_formKey.currentState!.validate() && _formIsValided!) {
      final signUpError = await Provider.of<AuthHttpRepo>(
        context,
        listen: false,
      ).signUpWithEmailAndPass(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (signUpError != null) {
        // ignore: use_build_context_synchronously
        ExceptionHelper(message: signUpError).showException(context);
      }
    }
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
