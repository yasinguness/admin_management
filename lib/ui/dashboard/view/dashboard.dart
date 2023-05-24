import 'package:admin_management/common/provider/order_provider.dart';
import 'package:admin_management/common/widgets/dashboard_widget/item_row.dart';
import 'package:admin_management/common/widgets/dashboard_widget/order_detail.dart';
import 'package:admin_management/common/widgets/dashboard_widget/order_item.dart';
import 'package:admin_management/common/widgets/dashboard_widget/tab_view_button.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/network/services/order/order_service.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/dashboard/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 3, vsync: this);
    var size = MediaQuery.of(context).size; // Değişkeni almak için Provider.of kullanılır

    return BaseView<DashboardViewModel>(
      builder: (context, value, widget) => value.busy
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _orderList(context, value, size, controller),
                ),
                Expanded(
                  flex: 7,
                  child: _detail(context, value, size, controller),
                )
              ],
            ),
      model:
          DashboardViewModel(orderService: locator<OrderService>(), orderProvider: Provider.of<OrderProvider>(context)),
      onModelReady: (p0) => p0.fetchOrders(),
    );
  }

  Container _orderList(BuildContext context, DashboardViewModel value, Size size, TabController controller) {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        children: [_header(context), _tabs(controller), _orderItem(value, size, controller)],
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

  DefaultTabController _tabs(TabController controller) {
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
              controller: controller,
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

  SizedBox _orderItem(DashboardViewModel value, Size size, TabController controller) {
    return SizedBox(
      height: size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(controller: controller, children: [
          _totalOrderTab(value),
          _inProgressOrderTab(value),
          _completedOrderTab(value),
        ]),
      ),
    );
  }

  ListView _totalOrderTab(DashboardViewModel value) {
    return ListView.builder(
      itemCount: value.orderProvider!.ordersList.length,
      itemBuilder: (context, index) {
        value.indexx = index;
        return GestureDetector(
            onTap: () {
              value.getOrder(value.orderProvider!.ordersList[index].id!);
            },
            child: OrderItem(item: value.orderProvider!.ordersList[index]));
      },
    );
  }

  ListView _inProgressOrderTab(DashboardViewModel value) {
    return ListView.builder(
      itemCount: value.orderProvider!.inProgressList.length,
      itemBuilder: (context, index) {
        value.indexx = index;
        return GestureDetector(
            onTap: () {
              value.getInProgress(value.orderProvider!.inProgressList[index].id!);
            },
            child: OrderItem(item: value.orderProvider!.inProgressList[index]));
      },
    );
  }

  ListView _completedOrderTab(DashboardViewModel value) {
    return ListView.builder(
      itemCount: value.orderProvider!.completedList.length,
      itemBuilder: (context, index) {
        value.indexx = index;
        return GestureDetector(
            onTap: () {
              value.getCompleted(value.orderProvider!.completedList[index].id!);
            },
            child: OrderItem(item: value.orderProvider!.completedList[index]));
      },
    );
  }
}

Padding _detail(BuildContext context, DashboardViewModel value, Size size, TabController controller) {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Container(
      color: Colors.white,
      child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleAndHeader(context, value),
            _orderDetail(value, size, controller), /* _button(value) */
          ]),
    ),
  );
}

Expanded _titleAndHeader(BuildContext context, DashboardViewModel value) {
  return Expanded(
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
            child: OrderInfoRow(text1: "İsim", text2: value.order!.customer!.name!),
          ),
          const VerticalDivider(
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: OrderInfoRow(text1: "Masa Numarası", text2: value.order!.customer!.qrNo.toString()),
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

Expanded _orderDetail(DashboardViewModel value, Size size, TabController controller) {
  return Expanded(
    flex: 8,
    child: value.busy
        ? const Center(child: CircularProgressIndicator())
        : TabBarView(controller: controller, children: [
            _pending(value),
            _inProgress(value),
            _completed(value),
          ]),
  );
}

Column _pending(DashboardViewModel value) {
  return Column(
    children: [
      OrderDetail(
        order: value.order,
      ),
      TabViewButton(
          text: "Sipariş Hazırla",
          onPressed: () {
            value.addOrderToInProgressList(value.order!);
          })
    ],
  );
}

Column _completed(DashboardViewModel value) {
  return Column(children: [
    Expanded(
        child: value.completedOrder == null
            ? const SizedBox.shrink()
            : SingleChildScrollView(
                child: ListView.separated(
                    itemBuilder: (context, index) => ItemRow(product: value.completedOrder!.products![index]),
                    separatorBuilder: (context, index) => const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: value.order!.products!.length),
              )),
    TabViewButton(
      text: "Sipariş Sil",
      onPressed: () {
        value.deleteCompletedOrder(value.order!);
      },
    )
  ]);
}

Column _inProgress(DashboardViewModel value) {
  return Column(children: [
    Expanded(
        child: value.iProgressOrder == null
            ? const SizedBox.shrink()
            : SingleChildScrollView(
                child: ListView.separated(
                  itemCount: value.iProgressOrder!.products!.length,
                  itemBuilder: (context, index) => ItemRow(product: value.iProgressOrder!.products![index]),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                ),
              )),
    TabViewButton(
      text: "Sipariş Tamamlandı",
      onPressed: () {
        value.addOrderToCompletedList(value.order!);
        //value.orderProvider!.removeOrder(value.order!);
      },
    )
  ]);
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