

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:scholarchain/portfoliostudent1.dart';
import 'package:scholarchain/signup.dart';
import 'package:scholarchain/src/pages/public_home_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';




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
      home: const PortfolioStudent(title: 'Login'),
    );
  }
}

class PortfolioStudent extends StatefulWidget {
  const PortfolioStudent({super.key, required this.title});

  final String title;

  @override
  State<PortfolioStudent> createState() => _PortfolioStudentState();
}

class _PortfolioStudentState extends State<PortfolioStudent> {
  _PortfolioStudentState(){
    _get_data();
  }

  TextEditingController casteController = new TextEditingController();
  TextEditingController religionController = new TextEditingController();
  TextEditingController categoryController = new TextEditingController();
  TextEditingController parentoccupationController = new TextEditingController();
  TextEditingController parentphonenoController = new TextEditingController();


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
                  controller: casteController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Caste")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: religionController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Religion")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: categoryController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Category")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  // maxLines: 5,
                  controller: parentoccupationController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Parent Occupation")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  // maxLines: 5,
                  controller: parentphonenoController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Parent Phoneno")),
                ),
              ),


              ElevatedButton(
                onPressed: () {

                  _send_data();


                },
                child: Text("Save"),
              ),
              ElevatedButton(
                onPressed: () {

                  _send_data();


                },
                child: Text("Next"),
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => MySignupPage(title: '',)),
              //     );
              //   },
              //   child: Text("Student Signup"),
              // ),
            ],
          ),
        ),
      ),
    );
  }


  void _send_data() async{


    String caste=casteController.text;
    String religion=religionController.text;
    String category=categoryController.text;
    String parentoccupation=parentoccupationController.text;
    String parentphoneno=parentphonenoController.text;




    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String pid = sh.setString('pid',id_).toString();

    final urls = Uri.parse('$url/Student_Portfolio/');
    try {
      final response = await http.post(urls, body: {
        'Caste':caste,
        'Religion':religion,
        'Category':category,
        'Parent_Occupation':parentoccupation,
        'Parent_Phoneno':parentphoneno,
        'lid':lid,

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        // String types=jsonDecode(response.body)['Type'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Saved');

          // if (types == "Student"){
          //   String lid=jsonDecode(response.body)['lid'];
          //   sh.setString("lid", lid);
          //
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => PortfolioStudent1(title: "Home"),));
          // }
          // else if (types == "Sponser"){
          //   String lid=jsonDecode(response.body)['lid'];
          //   sh.setString("lid", lid);
          //   //
          //   // Navigator.push(context, MaterialPageRoute(
          //   //   builder: (context) => MyHomePage(title: "Home"),));
          // }
        }else {
          Fluttertoast.showToast(msg: 'invalid user');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  String id_="";

  void _get_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/view_port/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid



      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];

        if (status=='ok') {
          String id=jsonDecode(response.body)['id'].toString();

          setState(() {

            id_=id;
          });





        }else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }

}
