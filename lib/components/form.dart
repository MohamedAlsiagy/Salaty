import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../shared constants/shared colors.dart';

class NeumorphicTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? prefixIcon, suffixIcon;
  final bool obscureText;
  String? Function(String? value)? validator;

  NeumorphicTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.validator})
      : super(key: key) {
    validator ??= (String? value) {
      return null;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(shape: NeumorphicShape.flat,intensity: 0.8 , depth: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
          validator: validator,
          obscureText: obscureText,
          controller: controller,
          keyboardType: hintText == "email"
              ? TextInputType.emailAddress
              : TextInputType.text,
          decoration: InputDecoration(
              errorStyle: TextStyle(color: mainColor.complement()),
              border: InputBorder.none,
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefixIconColor: Colors.grey.shade400),
          cursorColor: mainColor.darken(10),
        ),
      ),
    );
  }
}

class EmailAndPassWordForm extends StatefulWidget {
  final TextEditingController emailController, passController;
  String? Function(String? value)? emailValidator, passValidator;

  EmailAndPassWordForm(
      {Key? key,
      required this.emailController,
      required this.passController,
      this.emailValidator,
      this.passValidator})
      : super(key: key) {
    emailValidator ??= (String? value) {
      return null;
    };
    passValidator ??= (String? value) {
      return null;
    };
  }

  @override
  State<EmailAndPassWordForm> createState() => _EmailAndPassWordFormState();
}

class _EmailAndPassWordFormState extends State<EmailAndPassWordForm> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NeumorphicTextField(
            hintText: "Email",
            controller: widget.emailController,
            prefixIcon: const Icon(Icons.email),
            validator: widget.emailValidator),
        const SizedBox(height: 20),
        NeumorphicTextField(
          hintText: "Password",
          controller: widget.passController,
          obscureText: obscureText,
          prefixIcon: const Icon(Icons.password),
          suffixIcon: IconButton(
              onPressed: () {
                obscureText = !obscureText;
                setState(() {});
              },
              icon: Icon(
                obscureText ? Icons.lock : Icons.lock_open,
                color: mainColor,
              )),
          validator: widget.passValidator,
        ),
      ],
    );
  }
}
