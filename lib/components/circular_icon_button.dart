import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;

  const CircularIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: getDecoration(
          context,
          Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 16,
        ),
      ),
    );
  }

  static BoxDecoration getDecoration(BuildContext context, Color backgroundColor) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: backgroundColor,
      border: Border.all(
        color: Theme.of(context).primaryColor.withOpacity(0.5),
      ),
    );
  }
}
