import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/controllers/to_do_controller.dart';
import 'package:life_goals_pdm/src/models/to_do_model.dart';

class ManageGoalController extends ChangeNotifier {
  final _toDoController = ToDoController.instance;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController deadLineMonthController;

  late ToDo toDoTemp;

  late List<Options> toDoTypes = [];
  bool lifeStyle = false;
  bool healthyLife = false;

  ManageGoalController(this.toDoTemp) {
    titleController = TextEditingController(text: toDoTemp.title);
    descriptionController = TextEditingController(text: toDoTemp.description);
    deadLineMonthController =
        TextEditingController(text: toDoTemp.deadLineMonth);
    lifeStyle = toDoTemp.typeToDo[0].value;
    healthyLife = toDoTemp.typeToDo[1].value;

    titleController.addListener(() {
      toDoTemp.title = titleController.text;
      notifyListeners();
    });
    descriptionController.addListener(() {
      toDoTemp.description = descriptionController.text;
      notifyListeners();
    });
    deadLineMonthController.addListener(() {
      toDoTemp.deadLineMonth = deadLineMonthController.text;
      notifyListeners();
    });
  }

  SnackBar snackBarAlert = const SnackBar(
    content: Text("Preencha todos os dados obrigatórios"),
    backgroundColor: AppColors.red,
  );

  List<Options> getToDoTypes() {
    return toDoTypes = [
      Options(label: "Estilo de vida", value: lifeStyle, icon: "alarm-outline"),
      Options(
          label: "Vida saudável",
          value: healthyLife,
          icon: "ios-heart-outline"),
    ];
  }

  toggleLifeStyle() {
    lifeStyle = !lifeStyle;
    toDoTemp.typeToDo = getToDoTypes();

    notifyListeners();
  }

  togglehealthyLife() {
    healthyLife = !healthyLife;
    toDoTemp.typeToDo = getToDoTypes();
    notifyListeners();
  }

  Future<void> onSave(BuildContext context) async {
    if (titleController.text == "" ||
        descriptionController.text == "" ||
        (healthyLife == false && lifeStyle == false)) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarAlert);
    } else {
      await _toDoController.setData(toDoTemp);
      Navigator.pushReplacementNamed(context, "/navigationBottomBar");
    }
  }
}
