import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';

class CustomFloatButtom extends StatelessWidget {
  const CustomFloatButtom({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final Function()? onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 5),
      child: FloatingActionButton(
        onPressed: onPressed,
        elevation: 2,
        backgroundColor: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 2),
          child: icon,
        ),
      ),
    );
  }
}
