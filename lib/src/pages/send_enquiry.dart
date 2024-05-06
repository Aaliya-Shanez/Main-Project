

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
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
      home: const SendEnquiryPage(title: 'Login'),
    );
  }
}

class SendEnquiryPage extends StatefulWidget {
  const SendEnquiryPage({super.key, required this.title});

  final String title;

  @override
  State<SendEnquiryPage> createState() => _SendEnquiryPageState();
}

class _SendEnquiryPageState extends State<SendEnquiryPage> {

  final formkry = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController phonenoController = new TextEditingController();
  TextEditingController EmailController = new TextEditingController();
  TextEditingController EnquiryController = new TextEditingController();


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
            key: formkry,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "PLease fill";
                      }
                      return null;
                    },
                    controller: nameController,

                    decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Name")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      RegExp regex =
                      RegExp(r'^.{10,}$');
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      }
                    },
                    controller: phonenoController,

                    decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Phoneno")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "PLease fill";
                      }
                      return null;
                    },
                    controller: EmailController,

                    decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Email")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "PLease fill";
                      }
                      return null;
                    },
                    maxLines: 5,
                    controller: EnquiryController,

                    decoration: InputDecoration(border: OutlineInputBorder(),label: Text("type here...")),
                  ),
                ),


                ElevatedButton(
                  onPressed: () {
                    if(formkry.currentState!.validate()){
                    _send_data();}


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
      ),
    );
  }


  void _send_data() async{


    String name=nameController.text;
    String phoneno=phonenoController.text;
    String Email=EmailController.text;
    String Enquiry=EnquiryController.text;




    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/Public_Enquiry_POST/');
    try {
      final response = await http.post(urls, body: {
        'Name':name,
        'Phoneno':phoneno,
        'Email':Email,
        'Enquiry':Enquiry,


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        // String types=jsonDecode(response.body)['Type'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Enquiry Submitted');

          // if (types == "Student"){
          //   String lid=jsonDecode(response.body)['lid'];
          //   sh.setString("lid", lid);
          //
            Navigator.push(context, MaterialPageRoute(
             builder: (context) => NewHomePage(title: "Home"),));
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
