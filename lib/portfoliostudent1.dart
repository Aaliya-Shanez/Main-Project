

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:scholarchain/portfoliostudent2.dart';
import 'package:scholarchain/signup.dart';
import 'package:scholarchain/src/pages/public_home_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';




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
      home: const PortfolioStudent1(title: 'Login'),
    );
  }
}

class PortfolioStudent1 extends StatefulWidget {
  const PortfolioStudent1({super.key, required this.title});

  final String title;

  @override
  State<PortfolioStudent1> createState() => _PortfolioStudent1State();
}

class _PortfolioStudent1State extends State<PortfolioStudent1> {
  final _formKey = GlobalKey<FormState>();



  TextEditingController institutionsController = new TextEditingController();
  TextEditingController percentageController = new TextEditingController();
  TextEditingController cgpaController = new TextEditingController();
  TextEditingController certificatesController = new TextEditingController();
  String selectedValue = 'Sslc';

  File? _selectedFile;
  String? _validationError;




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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(children: [Text('Type : '),DropdownButton<String>(
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: <String>['Sslc', '+2', 'Diploma', 'Degree','Masters','Cultural','Sports']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
        ),],),



                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: institutionsController,

                    decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Institution")),
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? "Please Enter Name"
                          : value.length < 4
                          ? "invalid Name"
                          : null;
                    },

                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: TextField(
                //     controller: gradeController,
                //
                //     decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Grade")),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: TextField(
                //     controller: highersecondaryController,
                //
                //     decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Highersecnodary school")),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: TextField(
                //     maxLines: 5,
                //     controller: courseController,
                //
                //     decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Course")),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    // keyboardType: TextInputType.number,


                    controller: percentageController,

                    decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Percentage/Cgpa/Grade")),
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? "Please Enter "
                          : value.length < 1
                          ? "invalid Name"
                          : null;
                    },

                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: TextField(
                //     maxLines: 5,
                //     controller: sslcController,
                //
                //     decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Sslc School")),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: TextFormField(
                //     keyboardType: TextInputType.number,
                //
                //
                //     controller: cgpaController,
                //
                //     decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Cgpa")),
                //     onChanged: (value) => _formKey.currentState?.validate(),
                //     validator: (value) {
                //       return value!.isEmpty
                //           ? "Please Enter Name"
                //           : value.length < 1
                //           ? "invalid Name"
                //           : null;
                //     },
                //
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: TextField(
                //     maxLines: 5,
                //     controller: certificatesController,
                //
                //     decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Certificates")),
                //   ),
                // ),

                ElevatedButton(
                  onPressed: _pickFile,
                  child: Text('Select File'),
                ),
                SizedBox(height: 20),
                _selectedFile != null
                    ? Text('Selected file: ${_selectedFile!.path}')
                    : Container(),
                SizedBox(height: 10),
                _validationError != null
                    ? Text(
                  _validationError!,
                  style: TextStyle(color: Colors.red),
                )
                    : Container(),




                ElevatedButton(
                  onPressed: () {

                    if (_selectedFile != null) {
                      _send_data();
                    }


                  },
                  child: Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () {

                    Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PortfolioStudent2(title: '',)),
                            );


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
      ),
    );
  }


  void _send_data() async{


    String institutions=institutionsController.text;
    String percentage=percentageController.text;
    // String cgpa=cgpaController.text;
    // String certificates=certificatesController.text;


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/Student_Portfolio/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid,
        'Institutions':institutions,
        'Percentage':percentage,
        // 'Cgpa':cgpa,
        'certi':_selectedFile.toString(),
        'Type':selectedValue,



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
          // Navigator.push(context, MaterialPageRoute(
            // builder: (context) => PortfolioStudent2(title: "Home"),));
          // }
          // else if (types == "Sponser"){
          //   String lid=jsonDecode(response.body)['lid'];
          //   sh.setString("lid", lid);
          //   //
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => PortfolioStudent1(title: "Education Details"),));
        }
            else if (status=='no'){
              Fluttertoast.showToast(msg: 'Already registered Portfolio');

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

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        // Perform validation here, for example:
        if (!_isValidFileType(_selectedFile!.path)) {
          _validationError = 'Invalid file type';
        } else {
          _validationError = null;
        }
      });
    }
  }

  bool _isValidFileType(String path) {
    // Example validation logic: allow only PDF files
    return path.toLowerCase().endsWith('.pdf');
  }

}
