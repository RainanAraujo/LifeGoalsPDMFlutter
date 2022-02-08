import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';
import 'package:life_goals_pdm/src/components/check_box.dart';
import 'package:life_goals_pdm/src/components/custom_float_buttom.dart';
import 'package:life_goals_pdm/src/components/default_text_form_field.dart';
import 'package:life_goals_pdm/src/components/header_modals.dart';
import 'package:life_goals_pdm/src/components/header_session.dart';
import 'package:life_goals_pdm/src/components/to_do_item.dart';
import 'package:life_goals_pdm/src/controllers/manage_goal_controller.dart';
import 'package:life_goals_pdm/src/models/to_do_model.dart';

class ManageGoal extends StatefulWidget {
  const ManageGoal({Key? key}) : super(key: key);

  @override
  _ManageGoalState createState() => _ManageGoalState();
}

class _ManageGoalState extends State<ManageGoal> {
  @override
  Widget build(BuildContext context) {
    ToDo _toDoTemp = ModalRoute.of(context)?.settings.arguments as ToDo;

    final manageGoalController = ManageGoalController(_toDoTemp);
    return Scaffold(
      floatingActionButton: CustomFloatButtom(
        onPressed: () {
          manageGoalController.onSave(context);
        },
        icon: const Icon(
          MaterialIcons.done,
          size: 35,
        ),
      ),
      appBar: const HeaderModals(
        title: "Novo Obejtivo",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextFormField(
                controller: manageGoalController.titleController,
                textCapitalization: TextCapitalization.sentences,
                autoFocus: true,
                textInputAction: TextInputAction.next,
                label: "Título da meta * ",
                hintText: "Digite aqui",
              ),
              const SizedBox(height: 15),
              DefaultTextFormField(
                controller: manageGoalController.descriptionController,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                label: "Descrição da meta *",
                hintText: "Digite aqui",
              ),
              const SizedBox(height: 15),
              DefaultTextFormField(
                controller: manageGoalController.deadLineMonthController,
                keyboardType: TextInputType.number,
                label: "Data de vencimento (Meses)",
                hintText: "Digite aqui",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tipo de objetivo *",
                      style: AppTextStyles.label,
                    ),
                    const SizedBox(height: 10),
                    CustomCheckBox(
                      isChecked: manageGoalController.lifeStyle,
                      onChange: () => manageGoalController.toggleLifeStyle(),
                      label: "Estilo de vida",
                    ),
                    const SizedBox(height: 10),
                    CustomCheckBox(
                      isChecked: manageGoalController.healthyLife,
                      onChange: () => manageGoalController.togglehealthyLife(),
                      label: "Vida saudável",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const HeaderSession(
                title: "Visualização da meta",
              ),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: manageGoalController,
                builder: (context, _) {
                  return TodoItem(
                    key: UniqueKey(),
                    temp: true,
                    toDo: manageGoalController.toDoTemp,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
