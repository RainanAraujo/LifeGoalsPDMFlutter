class ToDo {
  String id;
  String title;
  String description;
  String deadLineMonth;
  List<Options> typeToDo;

  ToDo(
    this.id,
    this.title,
    this.description,
    this.deadLineMonth,
    this.typeToDo,
  );

  static ToDo createToDoEmpty() {
    return ToDo(DateTime.now().toString(), "", "", "", [
      Options(label: "Estilo de vida", value: false, icon: "alarm-outline"),
      Options(label: "Vida saudável", value: false, icon: "ios-heart-outline"),
    ]);
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "deadLineMonth": deadLineMonth,
      "typeToDo": typeToDo.map((e) => e.toMap()).toList(),
    };
  }
}

class Options {
  String label;
  bool value;
  String icon;
  Options({required this.label, required this.value, required this.icon});
  static Options from(Map data) {
    return Options(
        label: data["label"], value: data["value"], icon: data["icon"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "label": label,
      "value": value,
      "icon": icon,
    };
  }
}
