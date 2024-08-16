
class TaskModel {
  String title;
  int date;
  String description;
  String id;
  bool isDone;

  TaskModel({
    required this.date,
    required this.title,
    required this.description,
    this.id = '',
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
  :this
  (
    title: json['title'] ,
    date: json['date'],
    description: json['description'] ,
    id: json['id'] ,
    isDone: json['isDone'] ,
  );

  // {
  //   return TaskModel(
  //     title: map['title'] ?? '',
  //     date: map['date']?.toInt() ?? 0,
  //     description: map['description'] ?? '',
  //     id: map['id'] ?? '',
  //     time: map['time'] ?? '',
  //     isDone: map['isDone'] ?? false,
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'description': description,
      'id': id,
      'isDone': isDone,
    };
  }




}