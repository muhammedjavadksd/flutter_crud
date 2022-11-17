import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../modal/student_modal.dart';

ValueNotifier<List<StudentModal>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent({required StudentModal studentModal}) async {
  final box_student = await Hive.openBox<StudentModal>("student_db");
  await box_student.add(studentModal);
  // studentListNotifier.value.add(studentModal);
  // studentListNotifier.notifyListeners();
  getStudents();
}

Future<void> getStudents() async {
  final box_student = await Hive.openBox<StudentModal>("student_db");
  final student_data = box_student.values;
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(student_data);
  print(box_student.values);
  studentListNotifier.notifyListeners();
}

Future<void> editStudent(
    {required StudentModal studentModal, required BuildContext context}) async {
  final box_student = await Hive.openBox<StudentModal>("student_db");
  var index = studentModal.rowid;
 

  if (index != null) {
    await box_student.add(studentModal);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Data Edited")));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Unable to edit")));
  }
  getStudents();
}

Future<void> deleteSingleStudnet(String id) async {
  final box_student = await Hive.openBox<StudentModal>("student_db");

  final Map deliveriesMap = box_student.toMap();
  var desiredKey;

  print(deliveriesMap);
  deliveriesMap.forEach((key, value) {
    if (value.rowid == id) {
      desiredKey = key;
    }
  });

  if (desiredKey != null) {
    box_student.delete(desiredKey);
  }

  getStudents();
}
