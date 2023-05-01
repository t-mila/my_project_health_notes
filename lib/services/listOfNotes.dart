import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// Widget _buildListOfNotes(BuildContext context){
//   return StreamBuilder<QuerySnapshot>(
//     stream: FirebaseFirestore.instance.collection('notes').snapshots(),
//     builder: (context, snapshot){
//       if(!snapshot.hasData) return LinearProgressIndicator();
//       return _buildList(context, snapshot.data!.docs);
//     },
//   );
// }

// Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot){
//   return ListView(
//     padding: const EdgeInsets.only(top: 20.0),
//     children: snapshot.map((data)=>_buildListItem(context, data)).toList(),
//
//   );
// }
// Widget _buildListItem(BuildContext context, DocumentSnapshot data){
//   final record = Record.fromSnapshot(data);
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//     key: ValueKey(record.date),
//     child: Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(5.0),
//       ),
//       child: Row(
//         children: [
//           Text(record.date),
//           Column(
//             children: [
//               Text(record.doctor),
//               Text(record.comment),
//             ],
//           )
//         ]
//       )
//       // ListTile(
//       //   title: Text(record.date),
//       //   subtitle: Text(record.doctor),
//       //   isThreeLine: true,
//       // ),
//     ),
//   );
// }
class Record{
  final String date;
  final String doctor;
  final String comment;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {required this.reference})
      :assert(map['date']!= null),
        assert(map['doctor']!= null),
        assert(map['comment']!= null),
        date = map['date'],
        doctor = map['doctor'],
        comment = map['comment'];
  Record.fromSnapshot(DocumentSnapshot snapshot)
      :this.fromMap(snapshot.data()! as Map<String, dynamic>, reference: snapshot.reference);
  @override
  String toString() => "Record<$date:$doctor:$comment>";
}