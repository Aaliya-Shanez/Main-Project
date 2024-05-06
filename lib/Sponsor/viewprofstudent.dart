

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholarchain/sponsorviewstudents.dart';
import 'package:scholarchain/src/pages/home_page.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:  (title: 'Sent Complaint'),
    );
  }
}


class Sponsorviewstudentprofile extends StatefulWidget {
  const Sponsorviewstudentprofile({super.key, required this.title});


  final String title;

  @override
  State<Sponsorviewstudentprofile> createState() => _SponsorviewstudentprofileState();
}
class _SponsorviewstudentprofileState extends State<Sponsorviewstudentprofile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    senddata();
  }



  String name='name';
  String email='email';
  String phoneno='';
  String dob='';
  String gender='';

  String place='';
  String pincode='';
  String district='';
  String state='';
  String address='';

  String country='';
  String parentname='';
  String latestqualification='';
  String institution='';
  String image='image';







  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context) =>SponsorViewStudents (title: '',),));

        return false;

      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body:

        SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 240.0, 16.0, 16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.only(top: 16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 110.0),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            ' $name',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          // Text(
                                          //   '$email',
                                          //   style: Theme.of(context)
                                          //       .textTheme
                                          //       .bodyText1,
                                          // ),
                                          SizedBox(
                                            height: 40,
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      // CircleAvatar(
                                      //   backgroundColor: Colors.blueAccent,
                                      //   child: IconButton(
                                      //       onPressed: () {
                                      //         // Navigator.push(context, MaterialPageRoute(builder: (context) => edit_userfull(),));
                                      //       },
                                      //       icon: Icon(
                                      //         Icons.edit_outlined,
                                      //         color: Colors.black,
                                      //         size: 18,
                                      //       )
                                      //   ),
                                      // )
                                    ],
                                  )),
                              SizedBox(height: 10.0),
                              Row(
                                children: [

                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image:  DecorationImage(
                                  image: NetworkImage(
                                      image),
                                  fit: BoxFit.cover)),
                          margin: EdgeInsets.only(left: 20.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children:  [


                          ListTile(
                            title: Text('Email'),
                            subtitle: Text(email),
                            leading: Icon(Icons.mail_outline),
                          ),
                          ListTile(
                            title: Text("Phoneno"),
                            subtitle: Text(phoneno),
                            leading: Icon(Icons.phone),
                          ),
                          ListTile(
                            title: Text('Adress'),
                            subtitle: Text( '${address}\n ${place}  \n ${pincode}\n ${district} \n${state}  \n${country}'),
                            leading: Icon(Icons.location_city),
                          ),
                          ListTile(
                            title: Text("Gender"),
                            subtitle: Text(gender),
                            leading: Icon(Icons.person),
                          ),
                          ListTile(
                            title: Text("Dob"),
                            subtitle: Text(dob),
                            leading: Icon(Icons.data_object),
                          ),
                          ListTile(
                            title: Text("Parent_Name"),
                            subtitle: Text(parentname),
                            leading: Icon(Icons.person_2),
                          ),
                          ListTile(
                            title: Text("Latest_Qualification"),
                            subtitle: Text(latestqualification),
                            leading: Icon(Icons.history_edu),
                          ),
                          ListTile(
                            title: Text("Institution"),
                            subtitle: Text(institution),
                            leading: Icon(Icons.school),
                          ),

                          // ListTile(
                          //   title: Text(''),
                          //   subtitle: Text( '${place}  \n ${pincode} '),
                          //   leading: Icon(Icons.location_city),
                          // ),





                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: MaterialButton(
                  minWidth: 0.2,
                  elevation: 0.2,
                  color: Colors.white,
                  child: const Icon(Icons.arrow_back_ios_outlined,
                      color: Colors.indigo),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) =>SponsorViewStudents (title: '',),));



                  },
                ),
              ),

            ],

          ),

        ),

      ),
    );
  }


  void senddata()async{



    SharedPreferences sh=await SharedPreferences.getInstance();
    String url=sh.getString('url').toString();
    String lid=sh.getString('sid').toString();
    final urls=Uri.parse(url+"/Sponsor_viewstudentprofile_POST/");
    try{
      final response=await http.post(urls,body:{
        'sid':lid,
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {


          setState(() {
            email=jsonDecode(response.body)['Email'].toString();
            name=jsonDecode(response.body)['Name'].toString();
            phoneno=jsonDecode(response.body)['Phoneno'].toString();
            gender=jsonDecode(response.body)['Gender'].toString();
            dob=jsonDecode(response.body)['Dob'].toString();
            address=jsonDecode(response.body)['Address'].toString();
            place=jsonDecode(response.body)['Place'].toString();
            pincode=jsonDecode(response.body)['Pincode'].toString();
            district=jsonDecode(response.body)['District'].toString();
           state=jsonDecode(response.body)['State'].toString();
            country=jsonDecode(response.body)['Country'].toString();
            parentname=jsonDecode(response.body)['Parent_Name'].toString();
            latestqualification=jsonDecode(response.body)['Latest_Qualification'].toString();
            institution=jsonDecode(response.body)['Institution'].toString();
            image=sh.getString('img_url').toString()+jsonDecode(response.body)['Image'].toString();







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