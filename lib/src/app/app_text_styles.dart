import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';

mixin AppTextStyles {
  static final label = GoogleFonts.nunito(
    textStyle: const TextStyle(
      color: AppColors.gray,
      fontSize: 12,
    ),
  );
  static final message = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.black,
      fontSize: 16,
    ),
  );
  static final title = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
  );
  static final titleTodo = GoogleFonts.nunito(
    textStyle: const TextStyle(
      color: AppColors.blackStrong,
      height: 1.3,
      fontSize: 16,
    ),
  );
  static final descriptionTodo = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.black,
      height: 1.3,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),
  );
  static final subTitle = GoogleFonts.nunito(
    textStyle: const TextStyle(
      color: AppColors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
  static final button = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );
  static final labelTabBar = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.white,
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
  );
  static final subTitleItem = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.black,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );
  static final reminder = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.gray,
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
  );
  static final deadline = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.gray,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  );
}
