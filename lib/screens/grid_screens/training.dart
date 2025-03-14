import 'package:flutter/material.dart';
import '../../common/strings.dart';
import '../../widgets/appbar.dart';

class TrainingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      AppbarWidget(
          title: Strings.training,
          search: false,
          profile: false,
          child: Container(
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade900, Colors.deepPurple.shade900],
                ),

              ),
              child: Center(child: Text("Welcome to the Screen!", style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold)))));

  }
}
