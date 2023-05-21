import 'package:admin_management/common/constants/colors.dart';
import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  final String totalProductTitle;
  final String counter;
  const StatisticCard({
    Key? key,
    required this.size,
    required this.totalProductTitle,
    required this.counter,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4,
        color: Colors.yellow,
        child: Container(
          decoration: const BoxDecoration(),
          width: size.width,
          height: size.height * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                totalProductTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.brown, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      counter,
                      style: const TextStyle(
                          fontSize: 36, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 70, 38, 26)),
                    ),
                  ),
                  const Expanded(
                      child: Icon(
                    Icons.coffee,
                    size: 48,
                  ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
