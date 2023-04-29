import 'package:admin_management/common/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  final String text;
  const CategoryBar({super.key, required this.text});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
//TODO:Kategori onTap, isSelected işlemleri eksik. Bir çözüm bul
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 200,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? AppColors.brown : AppColors.white,
            boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey.shade600, spreadRadius: 1, blurRadius: 15)],
          ),
          child: Center(
              child: Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: isSelected ? Colors.white : AppColors.brown, fontWeight: FontWeight.w400),
          )),
        ),
      ),
    );
  }
}
