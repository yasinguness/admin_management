import 'package:admin_management/common/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  final TabController controller;
  const CategoryBar({
    super.key,
    required this.controller,
  });

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  var categoryList = ["Tümü", "Kahveler", "Tatlılar"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
            boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey.shade600, spreadRadius: 1, blurRadius: 15)],
          ),
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12.0,
              ),
              color: AppColors.brown,
            ),
            labelColor: AppColors.white,
            unselectedLabelColor: Colors.black,
            controller: widget.controller,
            tabs: categoryList.map((e) => Tab(text: e)).toList(),
          )),
    );
  }
}
