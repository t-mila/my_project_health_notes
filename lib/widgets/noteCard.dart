import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class NoteCard extends StatefulWidget {

  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard>{
  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 10.0,
              height: 10.0,
              child: Text("Date"),
            ),
            Expanded(
              child: Text(
                  "Some note",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),),
            Icon(
              Icons.menu,
              color: Colors.blueGrey,
            )
          ],
        ),
      )
    );
  }
}