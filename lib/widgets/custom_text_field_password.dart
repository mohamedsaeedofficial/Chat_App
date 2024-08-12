import 'package:flutter/material.dart';

class CustomTextFormFieldPassword extends StatefulWidget {
  CustomTextFormFieldPassword({
    super.key,
    this.onChange,
    this.hint,
  });
  final String? hint;
  Function(String)? onChange;

  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field Required';
        }
      },
      style: const TextStyle(color: Colors.white),
      onChanged: widget.onChange,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscure =! _obscure;
            });
          },
          icon: _obscure
              ? const Icon(
                  Icons.visibility,
                  color: Colors.white60,
                )
              : const Icon(
                  Icons.visibility_off,
                  color: Colors.white60,
                ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.white60),
      ),
    );
  }
}
