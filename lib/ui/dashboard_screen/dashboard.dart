import 'package:admin_management/common/widgets/dashboard_widget/order_item.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/dashboard_screen/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/dashboard_widget/order_detail.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      builder: (context, value, widget) => value.busy
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.grey.shade300,
                    child: Column(
                      children: [_header(context), _tabs(), _orderItem(value)],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  _title(context),
                                  _headerInfoRow(value),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: OrderDetail(
                                order: value.order!,
                                dashboardViewModel: Provider.of<DashboardViewModel>(context),
                                /* asset: "assets/images/GLASS-2.png",
                                    itemName: value.order!.coffeeList![index].name,
                                    itemPrice: value.order!.coffeeList![index].mediumPrice,
                                    coffeSize: value.order!.coffeeList![index].coffeeSize,
                                    itemQuantity: value.order!.coffeeList![index].quantitiy, */
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    height: 60,
                                    width: 180,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700),
                                      onPressed: () {},
                                      child: const Text("Siparişi Onayla"),
                                    )),
                              ),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
      model: DashboardViewModel(api: Provider.of(context)),
      onModelReady: (p0) => p0.fetchOrders(),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      "Sipariş Detay",
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  IntrinsicHeight _headerInfoRow(DashboardViewModel value) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          children: [
            const VerticalDivider(
              thickness: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: OrderInfoRow(text1: "İsim", text2: value.order!.ordersOwner!),
            ),
            const VerticalDivider(
              thickness: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: OrderInfoRow(text1: "Masa Numarası", text2: value.order!.tableNumber.toString()),
            ),
            const VerticalDivider(
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Row _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "TASK LIST",
            style:
                Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        )
      ],
    );
  }

  SizedBox _orderItem(DashboardViewModel value) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: value.orders!.length,
          itemBuilder: (context, index) {
            value.indexx = index;
            return GestureDetector(
                onTap: () async {
                  await value.getOrder(value.orders![index].id!);
                },
                child: OrderItem(item: value.orders![index]));
          },
        ),
      ),
    );
  }

  DefaultTabController _tabs() {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                offset: Offset(10, 20),
                blurRadius: 30,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          margin: const EdgeInsets.only(left: 4, right: 4),
          height: 40,
          child: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                color: const Color.fromARGB(255, 4, 77, 172),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(
                  child: Text(
                    "Yeni",
                  ),
                ),
                Tab(
                  child: Text(
                    "Hazırlanıyor",
                  ),
                ),
                Tab(
                  child: Text(
                    "Tamamlandı",
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class OrderInfoRow extends StatelessWidget {
  final String text1;
  final String text2;
  const OrderInfoRow({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text2,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
 /* Header(),
            SizedBox(
              height: 16,
            ),
            OrderList() */


            /* Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                  )),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.blue,
                ),
              ) */