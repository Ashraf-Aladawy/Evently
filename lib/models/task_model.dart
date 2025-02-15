class TaskModel {
  String id;
  String title;
  String description;
  String imageName;
  String time;
  int date;
  String userId;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.imageName,
      required this.date,
      required this.time,
      required this.userId});

  static TaskModel fromjson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      imageName: json["imageName"],
      date: json["date"],
      time: json["time"],
      userId: json["userId"]
    );
  }

  static Map<String, dynamic> toJson(TaskModel model) {
    return {
      "id": model.id,
      "title": model.title,
      "description": model.description,
      "imageName": model.imageName,
      "date": model.date,
      "time": model.time,
      "userId":model.userId
    };
  }
}
