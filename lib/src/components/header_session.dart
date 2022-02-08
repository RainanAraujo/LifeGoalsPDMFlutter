import 'package:flutter/material.dart';
import '../app/app_text_styles.dart';

class HeaderSession extends StatelessWidget {
  const HeaderSession({
    Key? key,
    required this.title,
    this.subTitle,
  }) : super(key: key);

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.title,
        ),
        Visibility(
          visible: subTitle != null,
          child: Text(
            subTitle ?? "",
            style: AppTextStyles.subTitle,
          ),
        ),
      ],
    );
  }
}
