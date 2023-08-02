import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/color_palatte.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/core/constant/textstyle_constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.title, required this.onTap, this.color});

  final String title;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        child: Text(
          title,
          style: color == null
              ? TextStyles.defaultStyle.whiteTextColor.bold
              : TextStyles.defaultStyle.bold.copyWith(
                  color: ColorPalette.primaryColor,
                ),
        ),
      ),
    );
  }
}
