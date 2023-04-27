import 'package:admin_management/network/model/order.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/dashboard_screen/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatefulWidget {
  final Order item;
  final void Function()? onTap;
  final String? assetName;
  final double? coffePrice;
  final double? treatPrice;
  const OrderItem({
    super.key,
    this.onTap,
    this.assetName,
    this.coffePrice,
    this.treatPrice,
    required this.item,
  });

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
        builder: (context, value, widt) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2,
                  child: ClipPath(
                    clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: Container(
                      decoration: isSelected
                          ? const BoxDecoration(
                              border: Border(
                                left: BorderSide(color: Colors.blueAccent, width: 5),
                              ),
                            )
                          : const BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.item.toString(),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Icon(Icons.access_time_filled, size: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Text("${widget.item.time}"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Text(widget.item.totalPrice.toString(),
                                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        model: DashboardViewModel(api: Provider.of(context)));
  }
}
