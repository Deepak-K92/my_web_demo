import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final Size size;
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const InputField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.obscureText = false,
      this.validator,
      required this.size});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(widget.size.aspectRatio * 30),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            fillColor: Colors.white.withOpacity(0.5),
            labelStyle: const TextStyle(color: Colors.white),
            filled: true,
            labelText: widget.labelText,
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(widget.size.aspectRatio * 30))),
        validator: widget.validator,
      ),
    );
  }
}
