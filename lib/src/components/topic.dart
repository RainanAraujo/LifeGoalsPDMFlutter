import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';

class Topic extends StatelessWidget {
  const Topic({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.iconTopic,
    required this.onPress,
  }) : super(key: key);
  final Function() onPress;
  final String? title;
  final String? subTitle;
  final Icon? iconTopic;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          primary: AppColors.backgroundItem,
          padding: const EdgeInsets.all(20),
        ),
        child: SizedBox(
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              iconTopic!,
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: AppTextStyles.button
                        .copyWith(color: AppColors.black, height: 1.2),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subTitle!,
                    style: AppTextStyles.subTitleItem,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lembrete",
                    style: AppTextStyles.reminder,
                  ),
                  Text(
                    "Todos os dias",
                    style: AppTextStyles.deadline,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
