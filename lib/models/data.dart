import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<String> popupIcons = [
  'assets/consultation.png',
  'assets/health-insurance.png',
  'assets/medicine (1).png',
  'assets/scale.png',
  'assets/stethoscope.png',
  'assets/thermometer.png',
];

// class NoteModel {
//   String noteId;
//   String date;
//   String doctor;
//   String comment;
//
//   NoteModel(this.noteId, this.date, this.doctor, this.comment);
//
//   NoteModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
//     noteId = documentSnapshot.id;
//     date = documentSnapshot.data()!['content'] as String;
//     doctor = documentSnapshot.data()!['content'] as String;
//     comment = documentSnapshot.data()!['content'] as String;
//   }
// }

// class Detail{
//   final String date;
//   final String doctor;
//   final String comment;
// }
// class Details extends StatefulWidget {
//   final String date;
//   final String doctor;
//   final String comment;
//
//   const Details({Key? key}) : super(key: key);
//
//   @override
//   State<Details> createState() => _DetailsState();
// }
//
// class _DetailsState extends State<Details> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

