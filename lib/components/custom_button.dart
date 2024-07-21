import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? bgImage;
  final Widget? bgWidget;
  final TextStyle? style;
  final StackFit? fit;

  const CustomButton(
      {super.key, this.onTap, this.title, this.bgImage, this.style, this.bgWidget, this.fit});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return InkWell(
      onTap: onTap,
      child: Stack(
        fit: fit ?? StackFit.passthrough,
        alignment: Alignment.center,
        children: [
          bgWidget ??
              Image.asset(
                bgImage ?? 'assets/button/button1.png',
                fit: BoxFit.cover,
              ),
          Text(
            title ?? locale.continuee.toUpperCase(),
            style: style ?? Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
