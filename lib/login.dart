

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:scholarchain/signup.dart';
import 'package:scholarchain/src/pages/home_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';



void main() {
  runApp(const MyLogin());
}

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyLoginPage(title: 'Login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {


  TextEditingController unameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),


        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: unameController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Username")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Password")),
                ),
              ),

              ElevatedButton(
                onPressed: () {

                  _send_data();


                },
                child: Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MySignupPage(title: '',)),
                  );
                },
                child: Text("Student Signup"),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _send_data() async{


    String uname=unameController.text;
    String password=passwordController.text;



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/flutterlogin/');
    try {
      final response = await http.post(urls, body: {
        'username':uname,
        'password':password,


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        String types=jsonDecode(response.body)['Type'];
        if (status=='ok') {

          if (types == "Student"){
            String lid=jsonDecode(response.body)['lid'];
            sh.setString("lid", lid);

            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomePage(),));
          }
          else if (types == "Sponser"){
            String lid=jsonDecode(response.body)['lid'];
            sh.setString("lid", lid);

            Navigator.push(context, MaterialPageRoute(
              builder: (context) => MyHomePage(title: "Home"),));
          }
        }else {
          Fluttertoast.showToast(msg: 'invalid user');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e){
     // Fluttertoast.showToast(msg: e.toString());
    }
  }

}
