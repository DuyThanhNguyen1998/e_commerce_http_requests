import 'package:flutter/material.dart';

class ContentFormField extends StatefulWidget {
  const ContentFormField({
    super.key,
    required this.title,
    required this.controller,
    this.focus,
    this.validatorFn,
    this.errorText,
  });

  final String title;
  final TextEditingController controller;
  final FocusNode? focus;
  final String? Function(String?)? validatorFn;
  final String? errorText;

  @override
  State<ContentFormField> createState() => _ContentFormFieldState();
}

class _ContentFormFieldState extends State<ContentFormField> {
  var _hintText = '';
  var _keyboardType = TextInputType.text;
  var _suffixIcon = Icons.email_outlined;

  @override
  void initState() {
    super.initState();

    switch (widget.title) {
      case 'Email':
        _hintText = 'Enter your email';
        _keyboardType = TextInputType.emailAddress;
        _suffixIcon = Icons.email_outlined;
        break;
      case 'Password':
        _hintText = 'Enter your password';
        _keyboardType = TextInputType.text;
        _suffixIcon = Icons.lock_outline_rounded;
        break;
      case 'Confirm Password':
        _hintText = 'Re-enter your password';
        _keyboardType = TextInputType.text;
        _suffixIcon = Icons.lock_outline_rounded;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(
        vertical: widget.errorText == null ? 10 : 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 10,
            ),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: _hintText,
                hintStyle: Theme.of(context).textTheme.bodyText2,
                suffixIcon: Icon(_suffixIcon),
              ),
              keyboardType: _keyboardType,
              controller: widget.controller,
              focusNode: widget.focus,
              validator: widget.validatorFn,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Positioned(
            top: -12,
            left: 25,
            child: Container(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 25,
            bottom: -20,
            child: Text(
              widget.errorText ?? '',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
