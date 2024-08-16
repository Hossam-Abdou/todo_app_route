import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_route/model/task_model.dart';

class FirebaseFunctions {

  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
      toFirestore: (TaskModel, _) => TaskModel.toJson(),
    );
  }


  static Future<void> addTask(TaskModel model) async {
    var collection = getCollection();
    var docInfo= collection.doc();
    model.id = docInfo.id;
    docInfo.set(model);

  }

  static Future<void> updateTask(TaskModel model) async {
    var collection = getCollection();
    await collection.doc(model.id).update(model.toJson());
  }

  static Future<void> deleteTask(String taskId) async {
    var collection = getCollection();
    await collection.doc(taskId).delete();
  }



  static Stream<QuerySnapshot<TaskModel>> getTasks() {
    var collection = getCollection();
    return collection.orderBy('date', descending: true).snapshots();
  }
}
