import 'package:admin_management/network/model/order.dart';
import 'package:admin_management/ui/dashboard_screen/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  final Order order;
  final DashboardViewModel dashboardViewModel;
  final int? quantity;
  const OrderDetail({super.key, this.quantity, required this.order, required this.dashboardViewModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dashboardViewModel.getOrder(order.id!),
      builder: (context, snapshot) {
        var ordr = snapshot.data;
        return ListView.builder(
          itemCount: ordr.coffeeList.lenght,
          itemBuilder: (context, index) => Column(
            children: [
              ItemRow(
                asset: "assets/images/GLASS-2.png",
                itemName: ordr.coffeeList![index].name,
                itemPrice: order.coffeeList![index].mediumPrice,
                coffeSize: order.coffeeList![index].coffeeSize,
                itemQuantity: order.coffeeList![index].quantitiy,
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
          ),
        );
      },
    );
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
