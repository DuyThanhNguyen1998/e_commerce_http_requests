import 'package:e_commerce_http_requests/helpers/exception_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/repositories/auth_http_repo.dart';
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

  bool? _formIsValided;

  String? _emailErrorText;

  String? _passwordErrorText;

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

  void _signInFn() async {
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();

    if (_formKey.currentState!.validate() && _formIsValided!) {
      final signInError = await Provider.of<AuthHttpRepo>(
        context,
        listen: false,
      ).signInWithEmailAndPass(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (signInError != null) {
        // ignore: use_build_context_synchronously
        ExceptionHelper(message: signInError).showException(context);
      }
    }
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
