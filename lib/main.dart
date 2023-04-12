import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project_health_notes/screens/mainScreenPage.dart';
import 'package:my_project_health_notes/widgets/noteCard.dart';

// import 'firebase_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AuthScreen();
    // return FutureBuilder(
    //     // future: _initialization,
    //     builder: (context, snapshot){
    //       // if (snapshot.hasError){
    //       //   return const Scaffold(body: Center(child: Text("Error"),),);
    //       // }
    //       if (snapshot.connectionState == ConnectionState.done){
    //         return AuthScreen();
    //       }
    //       // return const Scaffold(body: Center(child: Text("Loading..."),),);
    //     },
    // );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen>{
  final _formKey = GlobalKey<FormState>();

  //Declare two varaibles to hold the form input data
  String _name = '';
  String _email = '';

//Define a function to handle form submission
  void _submitForm() {
    //validate the form input
    if (_formKey.currentState!.validate()) {
      //save the form input to variables
      _formKey.currentState!.save();

      //print the form input data to the console
      print('Name: $_name');
      print('Email: $_email');
    }
  }

//Building the widget tree by defining the widget hierarchy and layout
  @override
  Widget build(BuildContext context) {
    //Create a material app which sets up the DEFAULT material design visual elements
    return MaterialApp(
      //set the apps title
      title: 'Flutter Input Form',
      //Create a scaffold for the app which provides a basic app structure and layout
      home: Scaffold(
        //creates app bar sets title for the page
        appBar: AppBar(
          //sets the text for the app bar
          title: Text('Input Form'),
        ),

        //Create a container to hold the form and add padding around it
        body: Container(
          padding: EdgeInsets.all(20),
          //Create a form with a GLOBAL key and a column of form fields
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Create a text form field for the name input
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),

                  //validate the input and return an error message if its invalid
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  //save the input to the name variable
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                //add some space between the form fields
                SizedBox(height: 20),

                //create a submit button to submit the form
                ElevatedButton(
                  onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreenPage(),
                      ),
                    );
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

