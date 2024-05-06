

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:scholarchain/signup.dart';
import 'package:scholarchain/src/pages/home_page.dart';
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
      home: const PortfolioStudent2(title: 'Login'),
    );
  }
}

class PortfolioStudent2 extends StatefulWidget {
  const PortfolioStudent2({super.key, required this.title});

  final String title;

  @override
  State<PortfolioStudent2> createState() => _PortfolioStudent2State();
}

class _PortfolioStudent2State extends State<PortfolioStudent2> {


  TextEditingController casteController = new TextEditingController();
  TextEditingController religionController = new TextEditingController();
  TextEditingController categoryController = new TextEditingController();
  TextEditingController parentoccupationController = new TextEditingController();
  TextEditingController parentphonenoController = new TextEditingController();
  TextEditingController incomecertificateController = new TextEditingController();
  TextEditingController birthcertificateController = new TextEditingController();
  TextEditingController adhaarNumberController = new TextEditingController();
  TextEditingController familyincomeController = new TextEditingController();
  TextEditingController bankaccountnoController = new TextEditingController();
  TextEditingController ifsccodeController = new TextEditingController();
  TextEditingController branchnameController = new TextEditingController();
  TextEditingController holdernameController = new TextEditingController();

  File? _selectedFile;
  File? _selectedFile1;
  File? _selectedFile2;
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
              ElevatedButton(
                onPressed: _pickFile,
                child: Text('Select Caste File'),
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
                  keyboardType: TextInputType.number,
                  // maxLines: 5,
                  controller: parentphonenoController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Parent Phoneno")),
                ),
              ),



              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: TextField(
              //     controller: incomecertificateController,
              //
              //     decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Income Cetificate")),
              //   ),
              // ),
              ElevatedButton(
                onPressed: _pickFile1,
                child: Text('Select Birth certificate File'),
              ),
              SizedBox(height: 20),
              _selectedFile1 != null
                  ? Text('Selected file: ${_selectedFile1!.path}')
                  : Container(),
              SizedBox(height: 10),
              _validationError != null
                  ? Text(
                _validationError!,
                style: TextStyle(color: Colors.red),
              )
                  : Container(),

              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: TextField(
              //     controller: birthcertificateController,
              //
              //     decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Birth Certificate")),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: adhaarNumberController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Adhaar Number")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: familyincomeController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Family Income")),
                ),
              ),
              ElevatedButton(
                onPressed: _pickFile2,
                child: Text('Select Income certificate File'),
              ),
              SizedBox(height: 20),
              _selectedFile2 != null
                  ? Text('Selected file: ${_selectedFile2!.path}')
                  : Container(),
              SizedBox(height: 10),
              _validationError != null
                  ? Text(
                _validationError!,
                style: TextStyle(color: Colors.red),
              )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: bankaccountnoController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text(" BankAccount Number")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: ifsccodeController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("IFSCCODE")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: branchnameController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Branch Name")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: holdernameController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Holder Name")),
                ),
              ),






              // ElevatedButton(
              //   onPressed: () {
              //
              //     _send_data();
              //
              //
              //   },
              //   child: Text("Save"),
              // ),
              ElevatedButton(
                onPressed: () {

                  _send_data();


                },
                child: Text("Submit"),
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
    // String incomecertificate=incomecertificateController.text;
    // String birthcertificate=birthcertificateController.text;
    String adhaarnumber=adhaarNumberController.text;
    String familyincome=familyincomeController.text;
    String bankaccountno=bankaccountnoController.text;
    String ifsccode=ifsccodeController.text;
    String branchname=branchnameController.text;
    String holdername=holdernameController.text;





    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/Student_Portfolio3/');
    try {
      final response = await http.post(urls, body: {
        'Caste':caste,
        'Religion':religion,
        'Category':category,
        'Parent_Occupation':parentoccupation,
        'Parent_Phoneno':parentphoneno,
        'Caste_Certificate':_selectedFile.toString(),
        'Income_Certificate':_selectedFile1.toString(),
        'Birth_Certificate':_selectedFile1.toString(),
        'Adhaar_Number':adhaarnumber,
        'Family_Income':familyincome,
        'Bank_Accountno':bankaccountno,
        'Ifsc_Code':ifsccode,
        'Branch_Name':branchname,
        'Holder_Name':holdername,
        'lid':sh.getString('lid').toString(),



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
            builder: (context) => HomePage(),));
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
 void _pickFile1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile1 = File(result.files.single.path!);
        // Perform validation here, for example:
        if (!_isValidFileType(_selectedFile1!.path)) {
          _validationError = 'Invalid file type';
        } else {
          _validationError = null;
        }
      });
    }
  }
 void _pickFile2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile2 = File(result.files.single.path!);
        // Perform validation here, for example:
        if (!_isValidFileType(_selectedFile2!.path)) {
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
