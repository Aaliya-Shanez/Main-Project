
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholarchain/home.dart';
import 'package:scholarchain/newhome.dart';
import 'package:scholarchain/screens/homescreen.dart';
import 'package:scholarchain/signup.dart';
import 'package:scholarchain/signupnew.dart';
import 'package:scholarchain/sponsorsignup.dart';
import 'package:scholarchain/src/pages/home_page.dart';
import '../Models/auth.dart';
// import 'successful_screen.dart';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  TextEditingController unameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget login(IconData icon) {
    return Container(
      height: 50,
      width: 115,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          TextButton(onPressed: () {}, child: Text('Login')),
        ],
      ),
    );
  }

  Widget userInput(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: Colors.blueGrey.shade200, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,
          decoration: InputDecoration.collapsed(
            hintText: hintTitle,
            hintStyle: TextStyle(fontSize: 18, color: Colors.white70, fontStyle: FontStyle.italic),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topRight,
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              'https://wp-media.petersons.com/blog/wp-content/uploads/2020/04/23101331/iStock-157478585.jpg',
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 35),
                    userInput(unameController, 'Email', TextInputType.emailAddress),
                    userInput(passwordController, 'Password', TextInputType.visiblePassword),
                    Container(
                      height: 55,
                      // for an exact replicate, remove the padding.
                      // pour une réplique exact, enlever le padding.
                      padding:  EdgeInsets.only(top: 5, left: 70, right: 70),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          // color: Colors.indigo.shade800,
                        ),

                        onPressed: () {
                          print(passwordController);
                          _send_data();
                        },
                        child: Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black,),),
                      ),
                    ),
                    // SizedBox(height: 20),
                    // Center(child: Text('Forgot password ?'),),
                    // SizedBox(height: 20),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 25.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       login(Icons.add),
                    //       login(Icons.book_online),
                    //     ],
                    //   ),
                    // ),
                    Divider(thickness: 0, color: Colors.white),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => myRegister()),
                            );
                          },
                          child: Text(
                            'If you are a Student? Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text(
                            'If you are a Sponsor? Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),
            ),
          ],
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
        String types = jsonDecode(response.body)['Type'];
        if (status=='ok') {

          if (types == "Student"){
            String lid=jsonDecode(response.body)['lid'].toString();
            sh.setString("lid", lid);

            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomePage(),));

          }
          else if (types == "Sponsor"){
            String lid=jsonDecode(response.body)['lid'].toString();
            sh.setString("lid", lid);

            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomeScreen(),));
          }

        }
        else if (status == "None"){
          Fluttertoast.showToast(msg: 'User Not Found');

        }
        else {
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
