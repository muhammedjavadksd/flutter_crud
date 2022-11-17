import 'package:crud/db/student_db.dart';
import 'package:crud/screen/screen_add.dart';
import 'package:crud/screen/screen_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:  [
            ScreeenAdd(),
              ScreenList()
          ],
        )
      ),
    );
  }
}