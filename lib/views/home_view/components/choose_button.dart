import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ChooseButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClick;
  const ChooseButton(
      {Key? key, required this.icon, required this.text, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: HerbariaColors.green,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          onTap: onClick,
          child: SizedBox(
            width: 203,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: HerbariaColors.white),
                  Text(
                    text,
                    style: const TextStyle(
                      color: HerbariaColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Not that optimized
                  Icon(icon, color: Colors.transparent),
                ],
              ),
            ),
          ),
        ));
  }
}
