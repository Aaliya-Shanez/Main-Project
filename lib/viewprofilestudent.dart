// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholarchain/portfolio.dart';
import 'package:scholarchain/portfoliostudent1.dart';

import 'package:shared_preferences/shared_preferences.dart';

// import 'editprofile.dart';
void main() {
  runApp(const ViewProfileStudent());
}

class ViewProfileStudent extends StatelessWidget {
  const ViewProfileStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Profile',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewProfileStudentPage(title: 'View Profile'),
    );
  }
}

class ViewProfileStudentPage extends StatefulWidget {
  const ViewProfileStudentPage({super.key, required this.title});

  final String title;

  @override
  State<ViewProfileStudentPage> createState() => _ViewProfileStudentPageState();
}

class _ViewProfileStudentPageState extends State<ViewProfileStudentPage> {

  _ViewProfileStudentPageState()
  {
    _send_data();
  }
  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton( ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              // CircleAvatar(radius: 50,),
              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: NetworkImage(photo_),height: 200,width: 200,),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(name_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(dob_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(gender_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(email_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(phone_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(address_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(place_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(pincode_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(district_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(state_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(country_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(parentname_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(latestqualification_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(institution_),
                  ),






                ],
              ),
              Container(padding: EdgeInsets.only(left: 110),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PortfolioStudent1(title: "Education Details"),));
                  },
                  child: Text("Next"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


  String name_="";
  String dob_="";
  String gender_="";
  String email_="";
  String phone_="";
  String address_="";
  String place_="";
  String pincode_="";
  String district_="";
  String state_="";
  String country_="";
  String parentname_="";
  String latestqualification_="";
  String institution_="";
  String photo_="";

  void _send_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/Student_viewprofile_POST/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid



      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];

        if (status=='ok') {
          String name=jsonDecode(response.body)['Name'].toString();
          String dob=jsonDecode(response.body)['Dob'].toString();
          String gender=jsonDecode(response.body)['Gender'].toString();
          String email=jsonDecode(response.body)['Email'].toString();
          String phone=jsonDecode(response.body)['Phoneno'].toString();
          String address=jsonDecode(response.body)['Address'].toString();
          String place=jsonDecode(response.body)['Place'].toString();
          String pincode=jsonDecode(response.body)['Pincode'].toString();
          String district=jsonDecode(response.body)['District'].toString();
          String state=jsonDecode(response.body)['State'].toString();
          String country=jsonDecode(response.body)['Country'].toString();
          String parentname =jsonDecode(response.body)['Parent_Name'].toString();
          String latestqualification=jsonDecode(response.body)['Latest_Qualification'].toString();
          String institution=jsonDecode(response.body)['Institution'].toString();


          String photo=sh.getString("img_url").toString()+jsonDecode(response.body)['Image'];

          setState(() {

            name_= name;
            dob_= dob;
            gender_= gender;
            email_= email;
            phone_= phone;
            address_=address;
            place_= place;
            pincode_= pincode;
            district_= district;
            state_= state;
            country_= country;
            parentname_= parentname;
            latestqualification_= latestqualification;
            institution_= institution;

            photo_= photo;
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
