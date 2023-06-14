import 'package:flutter/material.dart';

void pushAndRemoveUntil(BuildContext context, Widget destination) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => destination), (route) => false);
}

void pop(BuildContext context) {
  Navigator.of(context).pop();
}

void push(BuildContext context, Widget destination) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => destination));
}
