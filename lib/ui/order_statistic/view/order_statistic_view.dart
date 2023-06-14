import 'package:admin_management/common/constants/colors.dart';
import 'package:admin_management/common/widgets/dashboard_widget/statistic_card_widget.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/network/services/order/order_service.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/order_statistic/view_model/order_statistic_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class OrderStatisticScreen extends StatelessWidget {
  const OrderStatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var iconHeight = size.height * 0.1;

    return BaseView<OrderStatisticViewModel>(
      onModelReady: (p0) => p0.getStatistics(),
      model: OrderStatisticViewModel(orderService: locator<OrderService>(), productService: locator<ProductService>()),
      builder: (context, value, widget) => value.busy
          ? Center(child: LoadingAnimationWidget.threeRotatingDots(color: AppColors.brown, size: 48))
          : Column(
              children: [
                Expanded(
                  child: _mostOrderedCoffee(size, context, value),
                ),
                Expanded(
                  child: _mostOrdererdSweet(size, context, value),
                ),
                Row(
                  children: [
                    Expanded(
                      child: _dailyTotalOrderAmount(size, context, value, iconHeight),
                    ),
                    Expanded(
                      child: _totalOrderAmount(size, context, value, iconHeight),
                    )
                  ],
                ),
                Row(
                  children: [
                    _totalOrdererdNumberOfCoffee(size, context, value, iconHeight),
                    _totalOrderedNumberOfDesserts(size, context, value, iconHeight)
                  ],
                ),
              ],
            ),
    );
  }

  StatisticCard _dailyTotalOrderAmount(
      Size size, BuildContext context, OrderStatisticViewModel value, double iconHeight) {
    return StatisticCard(
        color: const Color.fromARGB(104, 255, 172, 64),
        size: size,
        textWidget: Text(
          "Günlük Toplam Sipariş Tutarı",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 36, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 49, 19, 3)),
        ),
        counter: "${value.model!.dailyTotalOrderAmount.toString()} ₺",
        widget: SizedBox(height: iconHeight, child: Image.asset("assets/ic/daily-report.png")));
  }

  StatisticCard _totalOrderAmount(Size size, BuildContext context, OrderStatisticViewModel value, double iconHeight) {
    return StatisticCard(
        color: const Color.fromARGB(104, 255, 172, 64),
        size: size,
        textWidget: Text(
          "Toplam Sipariş Tutarı",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 36, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 49, 19, 3)),
        ),
        counter: "${value.model!.totalOrderAmount.toString()} ₺",
        widget: SizedBox(height: iconHeight, child: Image.asset("assets/ic/money.png")));
  }

  Expanded _totalOrdererdNumberOfCoffee(
      Size size, BuildContext context, OrderStatisticViewModel value, double iconHeight) {
    return Expanded(
      child: StatisticCard(
          color: const Color.fromARGB(104, 255, 172, 64),
          size: size,
          textWidget: Text(
            "Toplam Sipariş Verilen Kahve Sayısı",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 36, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 49, 19, 3)),
          ),
          counter: value.model!.totalCoffeeOrders.toString(),
          widget: SizedBox(height: iconHeight, child: Image.asset("assets/ic/coffee-cup.png"))),
    );
  }

  Expanded _totalOrderedNumberOfDesserts(
      Size size, BuildContext context, OrderStatisticViewModel value, double iconHeight) {
    return Expanded(
      child: StatisticCard(
          color: const Color.fromARGB(104, 255, 172, 64),
          size: size,
          textWidget: Text(
            "Toplam Sipariş Verilen Tatlı Sayısı",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 36, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 49, 19, 3)),
          ),
          counter: value.model!.totalDessertOrders.toString(),
          widget: SizedBox(height: iconHeight, child: Image.asset("assets/ic/donut.png"))),
    );
  }

  StatisticCard _mostOrdererdSweet(Size size, BuildContext context, OrderStatisticViewModel value) {
    return StatisticCard(
        color: const Color.fromARGB(104, 255, 172, 64),
        size: size,
        textWidget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "En Çok Sipariş Verilen Tatlı",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 36, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 49, 19, 3)),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "${value.mostSweet!.name}",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 70, 38, 26)),
          ),
        ]),
        counter: value.model!.mostOrderedDessertAmount.toString(),
        widget: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade300, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
          child: CachedNetworkImage(imageUrl: value.mostSweet!.image!.path),
        ));
  }

  StatisticCard _mostOrderedCoffee(Size size, BuildContext context, OrderStatisticViewModel value) {
    return StatisticCard(
        color: const Color.fromARGB(104, 255, 172, 64),
        size: size,
        textWidget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "En Çok Sipariş Verilen Kahve",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 36, fontWeight: FontWeight.w700, color: const Color.fromARGB(255, 49, 19, 3)),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "${value.mostCoffee!.name}",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 70, 38, 26)),
          ),
        ]),
        counter: value.model!.mostOrderedCoffeeAmount.toString(),
        widget: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade300, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
          child: CachedNetworkImage(imageUrl: value.mostCoffee!.image!.path),
        ));
  }
}
