import 'package:crud/db/student_db.dart';
import 'package:crud/screen/edit_student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
     getStudents();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          child: ValueListenableBuilder(
            valueListenable: studentListNotifier,
            builder: (context, value, child) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    var data = value[index];
                    return ListTile(
                      onLongPress: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context) => ScreenEdit(
                          editid: data.rowid,
                          name: data.name,
                          age: data.age
                        ),));
                      },
                      leading: const CircleAvatar(
                        backgroundColor: Colors.indigo,
                      ),
                      title: Text("${data.name}"),
                      subtitle: Text(
                          "Student age ${data.age} & Student id ${data.rowid}"),
                      trailing:IconButton(
                        onPressed: () {
                          if(data.rowid==null)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unable to Delete")));
                          }else{
                            deleteSingleStudnet(data.rowid.toString());
                          }
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                        
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: value.length);
            },
          ),
        ),
      ),
    );
  }
}
