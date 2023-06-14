import 'package:admin_management/common/constants/colors.dart';
import 'package:admin_management/ui/order_statistic/view_model/order_statistic_view_model.dart';
import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  final OrderStatisticViewModel? model;
  final String? title;
  final String counter;
  final Widget widget;
  final double? height;
  final Color? color;
  final Widget? textWidget;
  const StatisticCard({
    Key? key,
    required this.size,
    this.title,
    required this.counter,
    required this.widget,
    this.height,
    this.model,
    this.color,
    this.textWidget,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: Card(
        elevation: 4,
        color: color ?? const Color.fromARGB(255, 202, 195, 181),
        child: Container(
          decoration: const BoxDecoration(),
          width: size.width,
          height: height ?? size.height * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    textWidget ??
                        Text(
                          title!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColors.brown, fontWeight: FontWeight.w500),
                        ),
                    SizedBox(height: size.height * 0.01),
                    Expanded(
                      child: Text(
                        counter,
                        style: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 70, 38, 26)),
                      ),
                    )
                  ]),
                ),
                Expanded(flex: 4, child: widget)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
