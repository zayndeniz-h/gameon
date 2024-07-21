import 'package:flutter/material.dart';

import 'verification_interactor.dart';
import 'verification_ui.dart';

class VerificationPage extends StatefulWidget {
  final VoidCallback onVerificationDone;

  const VerificationPage(this.onVerificationDone, {super.key});

  @override
  VerificationPageState createState() => VerificationPageState();
}

class VerificationPageState extends State<VerificationPage>
    implements VerificationInteractor {
  @override
  Widget build(BuildContext context) {
    return VerificationUI(this);
  }

  @override
  void verify() {
    widget.onVerificationDone();
  }
}
