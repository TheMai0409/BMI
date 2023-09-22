import 'package:flutter/material.dart';

class InkWellButton extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final GestureTapCallback? onTap;

  const InkWellButton({
    Key? key,
    required this.child,
    this.borderRadius,
    this.backgroundColor = Colors.transparent,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius,
      color: backgroundColor,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
