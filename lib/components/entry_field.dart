import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextStyle? style;

  const EntryField({
    super.key,
    required this.title,
    required this.hintText,
    this.suffixIcon,
    this.initialValue,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14,
              ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          initialValue: initialValue,
          style: style ?? Theme.of(context).textTheme.titleSmall,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor,
                width: 0.8,
              ),
            ),
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Theme.of(context).hintColor),
          ),
        ),
      ],
    );
  }
}
