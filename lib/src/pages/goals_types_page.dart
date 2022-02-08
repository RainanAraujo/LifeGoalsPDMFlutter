import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/components/header_modals.dart';
import 'package:life_goals_pdm/src/components/to_do_item.dart';
import 'package:life_goals_pdm/src/controllers/to_do_controller.dart';

class GoalsTypes extends StatefulWidget {
  const GoalsTypes({Key? key}) : super(key: key);

  @override
  State<GoalsTypes> createState() => _GoalsTypesState();
}

class _GoalsTypesState extends State<GoalsTypes> {
  ToDoController toDoController = ToDoController.instance;

  @override
  void initState() {
    if (mounted) {
      super.initState();
      toDoController.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    toDoController.removeListener(() => setState(() {}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;
    final listToDoFiltred = toDoController.toDoList
        .where(
          (e) => (e.typeToDo[index].value),
        )
        .toList();

    return Scaffold(
      appBar: const HeaderModals(
        title: "Nome Tipo",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listToDoFiltred.length,
          itemBuilder: (context, index) {
            final item = listToDoFiltred[index];
            return Column(
              children: [
                TodoItem(
                  toDo: item,
                  onCheck: () {
                    toDoController.removeData(item.id);
                  },
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
