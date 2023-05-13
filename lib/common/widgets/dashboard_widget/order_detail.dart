import 'package:admin_management/network/model/order/order.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  final OrderModel order;
  const OrderDetail({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: order.products!.length,
            itemBuilder: (context, index) => ItemRow(
              asset: "assets/images/GLASS-2.png",
              itemName: order.products![index].name,
              itemPrice: order.products![index].price,
              coffeSize: order.products![index].size,
              itemQuantity: order.products![index].quantitiy ?? 1,
            ),

            /* ItemRow(
                            asset: "assets/images/TREAT_0.png",
                            itemName: order.treat?.first.name!,
                            itemQuantity: 2,
                            itemPrice: 24) */
          ),
        ),
      ),
    ]);
  }

  /* else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                ItemRow(
                  asset: "assets/images/GLASS-2.png",
                  itemName: order.coffee![index].name,
                  itemPrice: order.coffee![index].mediumPrice,
                  coffeSize: order.coffee![index].coffeeSize,
                  itemQuantity: order.coffee![index].quantitiy,
                ),
                const SizedBox(
                  height: 2,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                /* ItemRow(
                  asset: "assets/images/TREAT_0.png",
                  itemName: order.treat?.first.name!,
                  itemQuantity: 2,
                  itemPrice: 24) */
              ],
            );
          },
          itemCount: order.coffee!.length);
    }
  } */
}

class ItemRow extends StatelessWidget {
  final String? itemName;
  final String? asset;
  final String? coffeSize;
  final int? itemQuantity;
  final double? itemPrice;
  const ItemRow({
    Key? key,
    this.itemName,
    this.itemQuantity,
    this.itemPrice,
    this.asset,
    this.coffeSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            width: 60,
            height: 60,
            child: Image.asset(asset!),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(flex: 3, child: Text(itemName!)),
          const Spacer(
            flex: 3,
          ),
          Expanded(child: Text(itemQuantity.toString())),
          const Spacer(
            flex: 2,
          ),
          Expanded(child: Text(coffeSize!)),
          const Spacer(
            flex: 2,
          ),
          Expanded(child: Text(itemPrice.toString())),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
