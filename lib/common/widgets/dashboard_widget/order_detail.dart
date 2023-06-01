import 'package:admin_management/common/widgets/dashboard_widget/item_row.dart';
import 'package:admin_management/network/model/order/order.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  final OrderModel? order;
  const OrderDetail({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: order?.products?.length ?? 0,
          itemBuilder: (context, index) => ItemRow(product: order?.products?[index] ?? order!.products![0]),
        ),
      ),
    );
  }
}
