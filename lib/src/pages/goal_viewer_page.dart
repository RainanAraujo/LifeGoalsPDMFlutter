import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';
import 'package:life_goals_pdm/src/components/custom_float_buttom.dart';
import 'package:life_goals_pdm/src/components/header_modals.dart';
import 'package:life_goals_pdm/src/components/header_session.dart';
import 'package:life_goals_pdm/src/models/to_do_model.dart';

class GoalViewer extends StatelessWidget {
  const GoalViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getNewDate(String deadline) {
      final date = DateTime.now();
      date.add(Duration(days: int.parse(deadline) * 30));
      return date.toString();
    }

    ToDo toDo = ModalRoute.of(context)?.settings.arguments as ToDo;
    return Scaffold(
      floatingActionButton: CustomFloatButtom(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/manageGoal",
            arguments: toDo,
          );
        },
        icon: const Icon(
          Feather.edit_2,
          size: 25,
        ),
      ),
      appBar: const HeaderModals(
        title: "Obejtivo",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSession(
              title: toDo.title,
              subTitle: toDo.description,
            ),
            if (toDo.deadLineMonth != "")
              SizedBox(
                width: 240,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prazo final",
                      style: AppTextStyles.reminder.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      getNewDate(toDo.deadLineMonth),
                      style: AppTextStyles.reminder.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
