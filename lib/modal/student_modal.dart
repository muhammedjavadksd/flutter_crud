

import 'package:hive_flutter/hive_flutter.dart';
part "student_modal.g.dart";

@HiveType(typeId: 1)
class StudentModal{

  @HiveField(0)
  String rowid;

  @HiveField(1)
  String name;

  @HiveField(2)
  String age;

  StudentModal({required this.rowid,required this.name,required this.age});
}