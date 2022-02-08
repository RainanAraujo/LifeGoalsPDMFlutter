import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';
import 'package:life_goals_pdm/src/components/check_box.dart';
import 'package:life_goals_pdm/src/models/to_do_model.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    this.onCheck,
    required this.toDo,
    this.temp = false,
    Key? key,
  }) : super(key: key);
  final Function? onCheck;
  final ToDo toDo;
  final bool temp;
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  String getNewDate(String deadline) {
    final date = DateTime.now();
    date.add(Duration(days: int.parse(deadline) * 30));
    return date.toString();
  }

  IconData getCurrentIcon() {
    List<IconData> currentIconTemp = [Ionicons.help];
    for (var index in widget.toDo.typeToDo) {
      if (index.value == true) {
        currentIconTemp.add(index.icon == "ios-heart-outline"
            ? Ionicons.ios_heart_outline
            : Ionicons.alarm_outline);
      }
    }
    if (currentIconTemp.length > 2) {
      return Ionicons.rocket_outline;
    }
    currentIconTemp = currentIconTemp.reversed.toList();
    return currentIconTemp[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      width: double.infinity,
      child: Stack(
        children: [
          ElevatedButton(
            onPressed: () {
              if (!widget.temp) {
                Navigator.of(context)
                    .pushNamed("/goalViewer", arguments: widget.toDo);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              primary: AppColors.backgroundItem,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            getCurrentIcon(),
                            color: AppColors.blue,
                            size: 25,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 230,
                            child: Text(
                              widget.toDo.title,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.titleTodo,
                            ),
                          ),
                          SizedBox(
                            width: 230,
                            child: Text(
                              widget.toDo.description,
                              style: AppTextStyles.descriptionTodo,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  if (widget.toDo.deadLineMonth != "")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: Container(
                              color: AppColors.shadow,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 280,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Entypo.clock,
                                color: AppColors.gray,
                                size: 18,
                              ),
                              Text(
                                "Prazo final",
                                style: AppTextStyles.reminder.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                getNewDate(widget.toDo.deadLineMonth),
                                style: AppTextStyles.reminder.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: widget.onCheck != null,
            child: Positioned(
              right: 0,
              top: 8,
              child: CustomCheckBox(
                onChange: () => widget.onCheck?.call(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
