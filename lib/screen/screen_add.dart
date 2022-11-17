import 'package:crud/db/student_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../modal/student_modal.dart';

class ScreeenAdd extends StatelessWidget {
  ScreeenAdd({super.key});

  final _name= TextEditingController();
  final _age= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children:  [
             TextField(
              controller: _name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter student name"
              ),
            ),
             SizedBox(height: 15,),
             TextField(
              controller: _age,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter student age"
              ), 
            ),
            SizedBox(height: 15,),
            ElevatedButton.icon(
              onPressed: (){
                addStudentToDB(name: _name.text, age: _age.text);
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Student"))
        ],
      ),
    );
  }
}

void addStudentToDB({required name,required age})
{
  final time_id=DateTime.now().millisecondsSinceEpoch.toString();
  addStudent(studentModal: StudentModal(name:name,age: age,rowid: time_id));
  print(time_id);
}