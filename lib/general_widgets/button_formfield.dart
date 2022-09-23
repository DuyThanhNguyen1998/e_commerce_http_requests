import 'package:flutter/material.dart';

class ButtonFormField extends StatelessWidget {
  const ButtonFormField({
    super.key,
    required this.label,
    required this.fn,
  });

  final String label;
  final void Function() fn;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.35,
          25,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: fn,
      child: Text(
        label,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
