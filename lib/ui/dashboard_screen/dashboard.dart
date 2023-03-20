import 'package:admin_management/common/widgets/dashboard_widget/order_detail.dart';
import 'package:admin_management/common/widgets/dashboard_widget/order_item.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey.shade300,
            child: Column(
              children: [_header(context), _tabs(), _orderItem()],
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
                          _headerInfoRow(),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 8,
                      child: OrderDetail(
                        coffeeName: "Ice Mocha",
                        coffeePrice: 28,
                        quantity: 3,
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
    );
  }

  Text _title(BuildContext context) {
    return Text(
      "Sipariş Detay",
      style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  IntrinsicHeight _headerInfoRow() {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          children: const [
            VerticalDivider(
              thickness: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: OrderInfoRow(text1: "İsim", text2: "Yasin"),
            ),
            VerticalDivider(
              thickness: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: OrderInfoRow(text1: "Masa Numarası", text2: "NO:4"),
            ),
            VerticalDivider(
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
            style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        )
      ],
    );
  }

  SizedBox _orderItem() {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return const OrderItem();
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
          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text2,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
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