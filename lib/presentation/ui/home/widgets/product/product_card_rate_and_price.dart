import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/constants/app_assets.dart';
import '../../../../../utils/constants/app_colors.dart';



class ProductCardRateAndPrice extends StatelessWidget {
  const ProductCardRateAndPrice({
    super.key,
    required this.price,
    required this.rating,
  });

  final double? price;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppAssets.star),
        Text("$rating"),
        const Spacer(),
        Text(
          "\$$price",
          style: const TextStyle(
            color: AppColors.colorPrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
