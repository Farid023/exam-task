import 'package:flutter/material.dart';


import '../../../../utils/constants/app_colors.dart';

class ProductCardCategory extends StatelessWidget {
  const ProductCardCategory({
    super.key,
    required this.category,
  });

  final String? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: AppColors.colorPrimary,
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        "$category",
        maxLines: 1,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
