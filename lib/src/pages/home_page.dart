import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';
import 'package:life_goals_pdm/src/components/to_do_item.dart';
import 'package:life_goals_pdm/src/components/topic.dart';
import 'package:life_goals_pdm/src/components/custom_float_buttom.dart';
import 'package:life_goals_pdm/src/components/header_session.dart';
import 'package:life_goals_pdm/src/controllers/to_do_controller.dart';
import 'package:life_goals_pdm/src/models/to_do_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoController toDoController = ToDoController.instance;
  @override
  void initState() {
    if (!mounted) return;
    toDoController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    toDoController.removeListener(() => setState(() {}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatButtom(
        onPressed: () {
          Navigator.of(context)
              .pushNamed("/manageGoal", arguments: ToDo.createToDoEmpty());
        },
        icon: const Icon(
          Ionicons.add,
          size: 35,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "NAO DESISTA",
            style: AppTextStyles.title.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
        actions: const [
          AvatarUser(),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const HeaderSession(
                title: "2 Grandes Desafios",
                subTitle: "Pessoa ambiciosa não é?",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Topic(
                    onPress: () {
                      Navigator.of(context)
                          .pushNamed("/goalsTypes", arguments: 0);
                    },
                    title: "Estilo de vida",
                    subTitle: "Torne-se uma pessoa matinal",
                    iconTopic: const Icon(
                      Ionicons.alarm_outline,
                      size: 40,
                      color: AppColors.green,
                    ),
                  ),
                  Topic(
                    onPress: () {
                      Navigator.of(context)
                          .pushNamed("/goalsTypes", arguments: 1);
                    },
                    iconTopic: const Icon(
                      Ionicons.ios_heart_outline,
                      size: 40,
                      color: AppColors.red,
                    ),
                    title: "Vida saudável",
                    subTitle: "Porque a saúde é o mais importante",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              HeaderSession(
                title: "Todos desafios",
                subTitle:
                    "Você tem ${toDoController.toDoList.length} desafios para fazer",
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: toDoController.toDoList.length,
                itemBuilder: (context, index) {
                  final item = toDoController.toDoList[index];
                  return Column(
                    children: [
                      TodoItem(
                        toDo: item,
                        key: UniqueKey(),
                        onCheck: () {
                          toDoController.removeData(item.id);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
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

class AvatarUser extends StatelessWidget {
  const AvatarUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 55,
          height: 55,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://ac24horas.com/wp-content/uploads/2021/06/DICK-CV.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
