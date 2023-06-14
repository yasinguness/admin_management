import 'package:admin_management/locator.dart';
import 'package:admin_management/network/model/order/order.dart';
import 'package:admin_management/network/services/order/order_service.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/dashboard/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final OrderModel item;

  const OrderItem({
    super.key,
    required this.item,
  });

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BaseView<DashboardViewModel>(
        builder: (context, value, widt) {
          DateTime serverDateTime = DateTime.parse(widget.item.createdAt.toString());

          String formattedTime = DateFormat('HH:mm').format(serverDateTime);
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: _orderCard(formattedTime, context, size),
          ));
        },
        model: DashboardViewModel(orderService: locator<OrderService>()));
  }

  SizedBox _orderCard(String formattedTime, BuildContext context, Size size) {
    return SizedBox(
      height: size.height * 0.09,
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
            child: _orderDetails(formattedTime, context),
          ),
        ),
      ),
    );
  }

  Row _orderDetails(String formattedTime, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [_orderId(), _orderTime(formattedTime)],
            ),
          ),
        ),
        //_price(context)
      ],
    );
  }

  Padding _orderId() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "${widget.item.id}",
        style: const TextStyle(fontSize: 22),
      ),
    );
  }

  Row _orderTime(String formattedTime) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(Icons.access_time_filled, size: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            formattedTime,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  Expanded _price(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: Text(widget.item.totalPrice.toString(),
            overflow: TextOverflow.clip,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
