import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "Configurações",
            style: AppTextStyles.title,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: TextButton.icon(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(AppColors.shadow),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: MaterialStateProperty.all(
                    EdgeInsets.zero,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/");
                },
                icon: const Icon(
                  Feather.log_out,
                  color: AppColors.red,
                ),
                label: Text(
                  "Sair",
                  style: AppTextStyles.message.copyWith(color: AppColors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
