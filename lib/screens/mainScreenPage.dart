import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project_health_notes/widgets/noteCard.dart';

import '../main.dart';

class MainScreenPage extends StatefulWidget{
  @override
   _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage>{
  // final NoteController noteControler = NoteController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthScreen(),
                  ),
                );
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return NoteCard();

        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Text('click');
        },
      ),
    );
  }
}
