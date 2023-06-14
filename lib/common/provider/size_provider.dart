import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizeProvider extends StatelessWidget {
  final Widget child;

  const SizeProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Provider.value(
      value: size,
      child: child,
    );
  }
}
