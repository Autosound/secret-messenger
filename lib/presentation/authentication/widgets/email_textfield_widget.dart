import 'package:flutter/material.dart';
import '../../../core/validators.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (input) => Validator().emailValidator(input),
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        hintText: 'Email',
      ),
    );
  }
}
