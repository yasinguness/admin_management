import 'package:admin_management/network/model/product/product.dart';
import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final ProductModel product;

  const ItemRow({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  width: 60,
                  height: 60,
                  child: Image.asset(product.image ?? "assets/images/GLASS-2.png"),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(flex: 3, child: Text(product.name!)),
                const Spacer(
                  flex: 3,
                ),
                Expanded(child: Text(product.quantitiy.toString())),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (product.isSweet == "sweet") ...[
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(child: Text(product.price.toString()))
                ] else ...[
                  Expanded(child: Text(product.size!)),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(child: Text(product.price.toString())),
                  const Spacer(
                    flex: 2,
                  ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
