import 'package:crud/db/student_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../modal/student_modal.dart';

class ScreenEdit extends StatefulWidget {
  final editid;
  final name;
  final age;


  ScreenEdit({super.key, required this.editid,required this.name,required this.age});

  @override
  State<ScreenEdit> createState() => _ScreenEditState();
}

class _ScreenEditState extends State<ScreenEdit> {
  final _name = TextEditingController();
  final _age = TextEditingController();

  @override
  void initState()
  {
    _name.text=widget.name;
    _age.text=widget.age;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.editid);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
                controller: _name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: _age,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  editStudent(studentModal: StudentModal(rowid:widget.editid,name: _name.text,age: _age.text ), context: context);
                },
                icon: const Icon(Icons.add),
                label: const Text("Edit Student"))
          ],
        ),
      )),

    );
  }
}
