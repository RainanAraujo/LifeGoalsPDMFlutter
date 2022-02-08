import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:life_goals_pdm/src/models/to_do_model.dart';

class ToDoController extends ChangeNotifier {
  ToDoController._() {
    getData();
  }
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  List<ToDo> toDoList = [];
  static final ToDoController _toDoController = ToDoController._();
  static ToDoController get instance => _toDoController;

  CollectionReference get _toDoRef => users.doc(user!.uid).collection("toDos");
  Future<void> getData() async {
    final _toDo = await users.doc(user!.uid).collection("toDos").get();
    toDoList.clear();
    for (var doc in _toDo.docs) {
      toDoList.add(
        ToDo(
          doc.id,
          doc.data()["title"],
          doc.data()["description"],
          doc.data()["deadLineMonth"],
          List.from(doc.data()["typeToDo"])
              .map((e) => Options.from(e))
              .toList(),
        ),
      );
    }
    toDoList = toDoList.reversed.toList();

    notifyListeners();
  }

  Future<void> setData(ToDo toDo) async {
    await _toDoRef.doc(toDo.id).set(toDo.toMap());
    getData();
  }

  Future<void> removeData(String toDoId) async {
    await _toDoRef.doc(toDoId).delete();
    getData();
  }
}
