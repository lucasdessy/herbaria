import 'package:flutter/material.dart';

class HerbariaPadding extends StatelessWidget {
  static const paddingValue = 16.0;
  final bool hasVerticalPadding;
  final bool hasHorizontalPadding;
  const HerbariaPadding({
    Key? key,
    required this.child,
    this.hasVerticalPadding = false,
    this.hasHorizontalPadding = true,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: hasHorizontalPadding ? paddingValue : 0,
          vertical: hasVerticalPadding ? paddingValue : 0),
      child: child,
    );
  }
}
