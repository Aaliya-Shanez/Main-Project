

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:scholarchain/signup.dart';
import 'package:scholarchain/src/pages/home_page.dart';
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
      home: const PortfolioStudent3(title: 'Login'),
    );
  }
}

class PortfolioStudent3 extends StatefulWidget {
  const PortfolioStudent3({super.key, required this.title});

  final String title;

  @override
  State<PortfolioStudent3> createState() => _PortfolioStudent3State();
}

class _PortfolioStudent3State extends State<PortfolioStudent3> {


  TextEditingController bankaccountnoController = new TextEditingController();
  TextEditingController ifsccodeController = new TextEditingController();
  TextEditingController branchnameController = new TextEditingController();
  TextEditingController holdernameController = new TextEditingController();


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
                  controller: bankaccountnoController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Income Cetificate")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: ifsccodeController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Birth Certificate")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: branchnameController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Adhaar Number")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  maxLines: 5,
                  controller: holdernameController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Family Income")),
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


    String bankaccountno=bankaccountnoController.text;
    String ifsccode=ifsccodeController.text;
    String branchname=branchnameController.text;
    String holdername=holdernameController.text;





    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/Public_Enquiry_POST/');
    try {
      final response = await http.post(urls, body: {
        'Bank Accountno':bankaccountno,
        'Ifsc code':ifsccode,
        'Branch Name':branchname,
        'Holder Name':holdername,



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

}
