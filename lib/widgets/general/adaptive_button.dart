import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final ButtonStyle style;
  const AdaptiveButton(
      {required this.child,
      required this.onPressed,
      this.style = const ButtonStyle(),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(child: child, onPressed: onPressed)
        : TextButton(onPressed: onPressed, style: style, child: child);
  }
}
