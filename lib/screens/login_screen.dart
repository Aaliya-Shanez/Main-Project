import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholarchain/signup.dart';
import 'package:scholarchain/src/pages/home_page.dart';
import 'package:scholarchain/utils/animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../data/bg_data.dart';
import '../home.dart';
import '../utils/text_utils.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController unameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int selectedIndex = 0;
  bool showOption = false;
  bool _obscureText = true; // Added

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 49,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: showOption
                    ? ShowUpAnimation(
                  delay: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: bgList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },

                      );
                    },
                  ),
                )
                    : SizedBox(),
              ),
              SizedBox(width: 20),
              showOption
                  ? GestureDetector(
                onTap: () {
                  setState(() {
                    showOption = false;
                  });
                },
              )
                  : GestureDetector(
                onTap: () {
                  setState(() {
                    showOption = true;
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgList[selectedIndex]),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          height: 350,
          width: double.infinity,
          margin:  EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: Padding(
                padding:  EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Center(child: TextUtil(text: "Login", weight: true, size: 50)),
                    Spacer(),
                    TextUtil(text: "Email"),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.white)),
                      ),
                      child: TextFormField(
                        controller: unameController,
                        style:  TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.mail, color: Colors.white),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Spacer(),
                    TextUtil(text: "Password"),
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.white)),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        style:  TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                        obscureText: _obscureText, // Toggle the visibility of the password
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => _send_data,
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: TextUtil(text: "Log In", color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MySignupPage(title: '',)),
                        );
                      },
                      child: TextUtil(text: "Don't have an account? REGISTER", size: 12, weight: true),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _send_data() async {
    String uname = unameController.text;
    String password = passwordController.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/flutterlogin/');
    try {
      final response = await http.post(urls, body: {
        'username': uname,
        'password': password,
      });

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        String types = jsonDecode(response.body)['Type'];
        if (status == 'ok') {
          if (types == "Student") {
            String lid = jsonDecode(response.body)['lid'];
            sh.setString("lid", lid);

            Navigator.push(context, MaterialPageRoute(
              builder: (context) => MyHomePage(title: "Home"),));
          }
          else if (types == "Sponser") {
            String lid = jsonDecode(response.body)['lid'];
            sh.setString("lid", lid);

            Navigator.push(context, MaterialPageRoute(
              builder: (context) => MyHomePage(title: "Home"),));
          }
        }
        else if (status=='No'){
          Fluttertoast.showToast(msg: 'User Not Found');

        }
        else if (status=='None') {
          Fluttertoast.showToast(msg: 'Invalid');
        }

        else {
          Fluttertoast.showToast(msg: 'invalid user');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
