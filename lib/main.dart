import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project_health_notes/screens/login.dart';
import 'package:my_project_health_notes/screens/mainScreenPage.dart';
import 'package:my_project_health_notes/services/auth.dart';
import 'package:my_project_health_notes/widgets/noteCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'firebase_options.dart';

void main() {
  runApp(MyHealthApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyHealthApp());
// }

class MyHealthApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return AuthScreen();
    return MaterialApp(
      theme: ThemeData.light(),
      home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot){
            if (snapshot.hasError){
              return const Scaffold(body: Center(child: Text("Error"),),);
            }
            if (snapshot.connectionState == ConnectionState.done){
              return Root();
            }
            return const Scaffold(body: Center(child: Text("Loading..."),),);
          },
      ),
    );
  }
}
class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth(auth: _auth).user,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active){
          if(snapshot.data?.uid == null){
            return Login(auth: _auth, firestore: _firestore);
          }else{
            return MainScreenPage(auth: _auth, firestore: _firestore);
          }
        }else {
          return const Scaffold(
            body: Center(
              child: Text("Loading..."),
            ),
          );
        }
      },
    );
  }
}