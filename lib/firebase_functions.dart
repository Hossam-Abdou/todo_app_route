import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_route/features/auth/model/user_model.dart';
import 'package:todo_app_route/features/home/model/task_model.dart';

class FirebaseFunctions {

  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
      toFirestore: (TaskModel, _) => TaskModel.toJson(),
    );
  }

  // static CollectionReference<UserModel> getUsersCollection() {
  //   return FirebaseFirestore.instance
  //       .collection('Users')
  //       .withConverter<UserModel>(
  //     fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
  //     toFirestore: (UserModel, _) => UserModel.toJson(),
  //   );
  // }


  static Future<void> addTask(TaskModel model) async {
    var collection = getCollection();
    var docInfo= collection.doc();
    model.id = docInfo.id;
    docInfo.set(model);

  }
  //
  // static Future<void> addUser(UserModel userModel) async {
  //   var collection = getCollection();
  //   var docInfo= collection.doc();
  //
  // }

  static Future<void> updateTask(TaskModel model)  {

    var collection = getCollection();
     return getCollection().doc(model.id).update(model.toJson());
  }

  static Future<void> deleteTask(String taskId) async {
    var collection = getCollection();
    await collection.doc(taskId).delete();
  }



  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    var collection = getCollection();
    return collection.where('date',isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch).snapshots();
    // return collection.orderBy('date', descending: true).snapshots();
  }
}
