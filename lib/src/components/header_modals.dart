import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';

class HeaderModals extends StatefulWidget implements PreferredSizeWidget {
  const HeaderModals({
    Key? key,
    required this.title,
    this.preferredSize = const Size.fromHeight(90),
  }) : super(key: key);

  @override
  final Size preferredSize;
  final String title;

  @override
  State<HeaderModals> createState() => _HeaderModalsState();
}

class _HeaderModalsState extends State<HeaderModals> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          widget.title,
          style: AppTextStyles.title,
        ),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.backgroundItem,
                    padding: const EdgeInsets.all(0),
                  ),
                  child: const Icon(
                    Ionicons.md_close,
                    size: 20,
                    color: AppColors.black,
                  )),
            ),
          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
