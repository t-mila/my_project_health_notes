import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project_health_notes/widgets/noteCard.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../main.dart';
import '../models/data.dart';
import '../services/auth.dart';
import '../screens/noteDetails.dart';
import '../services/listOfNotes.dart';

class MainScreenPage extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const MainScreenPage({Key? key, required this.auth, required this.firestore})
      : super(key: key);

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A748C),
          title: Row(
            children: const [
              Icon(Icons.monitor_heart_outlined),
              SizedBox(width: 10),
              Text('My Journal'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Auth(auth: widget.auth).signOut();
              },
              icon: const Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color(0xFFECF0F1),
              title: const ListTile(
                leading: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.blueGrey,
                  size: 50.0,
                ),
                title: Text(
                  "User name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Some addional info"),
                trailing: Icon(Icons.calendar_today_sharp),
                tileColor: Color(0xFFECF0F1),
              ),
            ),
            body: _buildListOfNotes(context),
            floatingActionButton: FloatingActionButton(
                backgroundColor: const Color(0xFF0A748C),
                child: const Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return GridView.builder(
                          itemCount: popupIcons.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: IconButton(
                                iconSize: 100.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Details()),
                                  ); // Handle button tap
                                },
                                icon: Ink.image(
                                  image: AssetImage(popupIcons[index]),
                                  fit: BoxFit.fill,
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                          ),
                        );
                      });
                }),
          ),
        ]),
      ),
    ); //
  }
}

Widget _buildListOfNotes(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('notes').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return const LinearProgressIndicator();
      return _buildList(context, snapshot.data!.docs);
    },
  );
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final record = Record.fromSnapshot(data);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    key: ValueKey(record.date),
    child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(children: [
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child:
              Text(
                  record.date,
                  style:
                  const TextStyle(
                      fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ))),
          const SizedBox(width: 20.0,),
          Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFECF0F1)
                  ),
                child: Column(
                  children: [
                    Text(
                      record.doctor,
                      style:
                      const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),),
                    Text(
                        record.comment,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ]
                )
              )
            ],
          )
        ])),
  );
}
