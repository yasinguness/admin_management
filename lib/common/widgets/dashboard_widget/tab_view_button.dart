import 'package:flutter/material.dart';

class TabViewButton extends StatelessWidget {
  final void Function()? onPressed;
  const TabViewButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          height: 60,
          width: 180,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700),
            onPressed: onPressed,
            child: const Text("Siparişi Onayla"),
          )),
    );
  }
}
