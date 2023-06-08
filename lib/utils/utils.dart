import 'package:flutter/material.dart';
import 'package:teen_patti/components/circular_icon_button.dart';

class Utils {
  Future<dynamic> showGuideDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/poker_guide.png'),
              Positioned(
                right: 12,
                top: 12,
                child: CircularIconButton(
                  icon: Icons.close,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
