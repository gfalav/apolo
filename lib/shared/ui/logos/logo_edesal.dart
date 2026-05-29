import 'package:flutter/material.dart';

class LogoEdesal extends StatelessWidget {
  const LogoEdesal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      //color: Theme.of(context).colorScheme.surfaceContainerLow,
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/images/Qubit-Corp.png'),
    );
  }
}
