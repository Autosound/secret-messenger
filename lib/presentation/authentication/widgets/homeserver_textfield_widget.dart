import 'package:flutter/material.dart';

class HomeserverTextField extends StatelessWidget {
  final TextEditingController controller;
  const HomeserverTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        labelText: 'Homeserver',
        hintText: 'https://matrix.org',
      ),
    );
  }
}
