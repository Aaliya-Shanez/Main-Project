

// import 'package:theafdete/changepassword.dart';
// import 'package:theafdete/components/authentication_button.dart';
// import 'package:theafdete/components/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarchain/constants.dart';
// import 'package:theafdete/indexviewprofile.dart';
// import 'package:google_fonts/google_fonts.dart';


import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholarchain/src/pages/send_enquiry.dart';
import 'package:scholarchain/viewpubschlrship.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart ';

import 'package:permission_handler/permission_handler.dart';

import '../../newloginnew.dart';
import '../../viewsch.dart';
// import 'package:theafdete/login_screen.dart';
// import 'package:theafdete/viewcriminals.dart';
// import 'package:theafdete/viewdetectedcriminals.dart';
// import 'package:theafdete/viewreply.dart';

// import 'editprofile.dart';


void main() {
  runApp(const NewHome());
}

class NewHome extends StatelessWidget {
  const NewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NewHomePage(title: 'Home'),
    );
  }
}

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key, required this.title});

  final String title;

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {

  _NewHomePageState()
  {
    _send_data();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leadingWidth: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SCHOLARCHAIN',
                style: GoogleFonts.poppins(
                  color: kDarkGreenColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),

            ],
          ),
        ),

        body:
        Container(decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bck.jpg"), // Replace "background_image.jpg" with your image file name
            fit: BoxFit.cover, // Adjust the fit as per your requirement
          ),
        ),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 20,
              ),

              Container(
                child: Expanded(
                    child: ListView(
                      children: [
                        Card(
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child:  ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewScholarshipPagess(title: "Scholarships")));
                            },
                            leading: Icon(
                              Icons.privacy_tip_sharp,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'View Scholarship',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SendEnquiryPage(title: 'Enquiry',)));
                            },
                            leading: Icon(
                              Icons.history,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Enquiry',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),

                            trailing: Icon(

                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white70,
                          margin:
                          const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child:  ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(title: "")));
                            },
                            leading:
                            Icon(Icons.help_outline, color: Colors.black54),
                            title: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  String name_ = "";
  String dob_ = "";
  String gender_ = "";
  String email_ = "";
  String phone_ = "";
  String place_ = "";
  String pin_ = "";
  String district_ = "";
  String photo_ = "";

  void _send_data() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/public_view/');
    try {
      final response = await http.post(urls, body: {'lid': lid});
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          String name = jsonDecode(response.body)['name'];
          String dob = jsonDecode(response.body)['dob'];
          String gender = jsonDecode(response.body)['gender'];
          String email = jsonDecode(response.body)['email'];
          String phone = jsonDecode(response.body)['phone'];
          String place = jsonDecode(response.body)['place'];
          String pin = jsonDecode(response.body)['pin'];
          String district = jsonDecode(response.body)['district'];
          String photo = url + jsonDecode(response.body)['photo'];

          setState(() {
            name_ = name;
            dob_ = dob;
            gender_ = gender;
            email_ = email;
            phone_ = phone;
            place_ = place;
            pin_ = pin;
            district_ = district;
            photo_ = photo;
          });
        } else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      } else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
    }
  }

}
