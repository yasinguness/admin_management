import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  final String? coffeeName;
  final double? coffeePrice;
  final int? quantity;
  const OrderDetail({super.key, this.coffeeName, this.quantity, this.coffeePrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              width: 60,
              height: 60,
              child: Image.asset("assets/images/GLASS-2.png"),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(coffeeName!),
            const Spacer(
              flex: 4,
            ),
            Text(quantity.toString()),
            const Spacer(
              flex: 4,
            ),
            Text(coffeePrice.toString()),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
