import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A748C),
        title: const Text("Add details"),
        actions: [
          IconButton(
              onPressed: (){
                // save to firebase
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
              decoration: const InputDecoration(
              labelText: 'Date',
                hintText: 'Enter date',
              )),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Doctor',
                    hintText: 'Enter doctor\'s name',
                  )),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                    hintText: 'Enter note of the visit',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
