import 'package:flutter/material.dart';
import 'package:notes_app/src/core/core.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    required this.hintText,
    super.key,
    this.height = 60,
    this.obscureText = false,
    this.keyboardType,
    this.errorText,
    this.onChanged,
    this.suffixIcon,
  });
  final double height;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? errorText;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 15, color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          errorText: errorText,
          filled: true,
          fillColor: AppTheme.darkGrey,
          hintStyle: const TextStyle(fontSize: 15, color: Colors.white),
          contentPadding: const EdgeInsets.only(
            left: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
