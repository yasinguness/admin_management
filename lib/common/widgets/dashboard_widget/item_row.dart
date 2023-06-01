import 'package:admin_management/network/model/order_product/order_product.dart';
import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final OrderProductModel product;

  const ItemRow({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height * 0.1,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 15,
            blurRadius: 17,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.4), borderRadius: BorderRadius.circular(12)),
                      width: size.width * 0.06,
                      height: size.height * 0.08,
                      child: Image.asset(product.product!.image ?? "assets/images/GLASS-2.png", fit: BoxFit.contain),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        product.product!.name!,
                        style: Theme.of(context).textTheme.headline3,
                      )),
                  const Spacer(
                    flex: 3,
                  ),
                  Expanded(child: Text(product.amount.toString(), style: Theme.of(context).textTheme.headline4)),
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
                  if (product.product!.isSweet == "sweet") ...[
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(child: Text(product.currentPrice.toString(), style: Theme.of(context).textTheme.headline4))
                  ] else ...[
                    Expanded(child: Text(product.selectedSize!, style: Theme.of(context).textTheme.headline4)),
                    const Spacer(
                      flex: 2,
                    ),
                    Expanded(
                        child: Text(product.currentPrice.toString(), style: Theme.of(context).textTheme.headline4)),
                    const Spacer(
                      flex: 2,
                    ),
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
