import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final TextEditingController controller;
  const CardWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none)),
      ),
    );
  }
}
