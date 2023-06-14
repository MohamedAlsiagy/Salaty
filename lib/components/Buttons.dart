import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salaty/shared%20constants/shared%20colors.dart';

import '../cubit/signCubit.dart';

class NeumorphicIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  final double spaceing;
  final NeumorphicShape shape;
  final double depth;
  final bool disableDepth;

  const NeumorphicIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.spaceing = 5,
      this.shape = NeumorphicShape.flat,
      this.depth = 5,
      this.disableDepth = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spaceing),
      child: NeumorphicButton(
        style: NeumorphicStyle(
            disableDepth: disableDepth,
            boxShape: const NeumorphicBoxShape.circle(),
            depth: depth,
            shape: shape),
        onPressed: onPressed,
        child: Center(
          child: FaIcon(icon),
        ),
      ),
    );
  }
}

class NeumorphicButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  final double spaceing;
  final String text;
  final double size;
  final NeumorphicStyle? neumorphicStyle;

  const NeumorphicButtonWithIcon(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.text,
      this.size = 16,
      this.spaceing = 12,
      this.neumorphicStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: neumorphicStyle,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: size),
          ),
          SizedBox(width: spaceing),
          FaIcon(
            icon,
            size: size,
          )
        ],
      ),
    );
  }
}

class CustomizedNeumorphicRadio extends StatelessWidget {
  int radioSelected;
  int value;
  String radioVal;
  final Function onChanged;
  Color? color;

  CustomizedNeumorphicRadio(
      {Key? key,
      required this.value,
      required this.radioSelected,
      required this.radioVal,
      required this.onChanged,
      this.color})
      : super(key: key) {
    color ??= mainColor;
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicRadio(
      value: value,
      groupValue: radioSelected,
      style: NeumorphicRadioStyle(
        selectedDepth: 5,
        unselectedDepth: -5,
        selectedColor: color,
        // unselectedColor: mainColor.darken(10),
      ),
      onChanged: (value) {
        onChanged(value ?? this.value);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              radioVal,
              style: TextStyle(
                  fontSize: 18,
                  color: radioSelected == value ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
