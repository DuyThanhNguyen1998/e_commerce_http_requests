import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/helpers/notify_helper.dart';
import '/providers/auth_provider.dart';
import '/general_widgets/button_formfield.dart';
import '/general_widgets/content_formfield.dart';
import '/pages/authPage/auth_page.dart';
import '/pages/forgotPassPage/forgot_pass_page.dart';

class ForgotPassFormField extends StatefulWidget {
  const ForgotPassFormField({super.key});

  @override
  State<ForgotPassFormField> createState() => _ForgotPassFormFieldState();
}

class _ForgotPassFormFieldState extends State<ForgotPassFormField> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _emailFocusNode = FocusNode();

  bool? _formIsValided;

  String? _emailErrorText;

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

  void _send() async {
    _emailFocusNode.unfocus();

    if (_formKey.currentState!.validate() && _formIsValided!) {
      final auth = Provider.of<AuthProvider>(context, listen: false);
      await auth.forgotPassword(_emailController.text.trim());

      if (auth.authError.isNotEmpty) {
        debugPrint('ForgotPass error: ${auth.authError}');
        _showException(auth.authError);
      } else {
        _showNotification(
          'Check your email and follow these instructions, then back to sign in with new password',
        );
      }
    }
  }

  void _showException(String exception) {
    NotifyHelper.showException(
      context,
      exception,
      false,
      ForgotPassPage.routeName,
    );
  }

  void _showNotification(String notification) {
    const title = 'Send completed!';
    NotifyHelper.showNotification(
      context,
      title,
      notification,
      AuthPage.routeName,
    );
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: ButtonFormField(
              label: 'Send',
              fn: _send,
            ),
          ),
        ],
      ),
    );
  }
}
