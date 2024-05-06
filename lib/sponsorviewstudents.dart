import 'package:scholarchain/Sponsor/checkstudentportfolio.dart';
import 'package:scholarchain/constants.dart';
// import 'package:plantpetcare/homenew.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:scholarchain/src/pages/home_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/homescreen.dart';
import 'Sponsor/viewprofstudent.dart';
import 'constants.dart';
// import 'sendcomplaint.dart';
void main() {
  runApp(const ViewReply());
}

class ViewReply extends StatelessWidget {
  const ViewReply({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scholarships',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const SponsorViewStudents(title: 'Scholarships'),
    );
  }
}

class SponsorViewStudents extends StatefulWidget {
  const SponsorViewStudents({super.key, required this.title});

  final String title;

  @override
  State<SponsorViewStudents> createState() => _ViewReplyPageState();
}

class _ViewReplyPageState extends State<SponsorViewStudents> {

  _ViewReplyPageState(){
    viewreply();
  }

  List<String> id_ = <String>[];
  List<String> Name_= <String>[];
  // List<String> Dob_= <String>[];
  // List<String> Gender_= <String>[];
  // List<String> Address_= <String>[];
  // List<String> Place_= <String>[];
  // List<String> Pincode_= <String>[];
  // List<String> District_= <String>[];
  // List<String> Country_= <String>[];
  List<String> Email_= <String>[];
  List<String> Phoneno_= <String>[];
  List<String> Image_= <String>[];
  // List<String> Parent_name_= <String>[];
  List<String> Latest_Qualification_= <String>[];
  // List<String> Institution_= <String>[];

  Future<void> viewreply() async {
    List<String> id = <String>[];
    List<String> Name = <String>[];
    // List<String> Dob = <String>[];
    // List<String> Gender = <String>[];
    // List<String> Address = <String>[];
    // List<String> Start_Date = <String>[];
    // List<String> Pincode = <String>[];
    // List<String> District = <String>[];
    // List<String> Country = <String>[];
    List<String> Email = <String>[];
    List<String> Phoneno= <String>[];
    List<String> Image= <String>[];
    // List<String> Parent_name= <String>[];
    List<String> Latest_Qualification= <String>[];
    // List<String> Institution= <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/Sponsor_view_Students/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'cat':sh.getString("cat").toString()


      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        Name.add(arr[i]['Name']);
        // Dob.add(arr[i]['Dob'].toString());
        // Gender.add(arr[i]['Gender']);
        // Address.add(arr[i]['Address'].toString());
        // Start_Date.add(arr[i]['Start_Date'].toString());
        // Pincode.add(arr[i]['Pincode'].toString());
        // District.add(arr[i]['District'].toString());
        // Country.add(arr[i]['Country'].toString());
        Email.add(arr[i]['Email'].toString());
        Phoneno.add(arr[i]['Phoneno'].toString());
        Image.add(sh.getString("img_url").toString()+arr[i]['Image'].toString());

        // Parent_name.add(arr[i]['Parent_name'].toString());
        Latest_Qualification.add(arr[i]['Latest_Qualification'].toString());

        // Institution.add(arr[i]['Institution']);

      }

      setState(() {
        id_ = id;
        Name_ = Name;
        // Dob_ = Dob;
        // Gender_ = Gender;
        // Address_ = Address;
        // Place_ = Start_Date;
        // Pincode_ = Pincode;
        // District_ = District;
        // Country_ = Country;
        Email_ = Email;
        Phoneno_=Phoneno;
        Image_=Image;
        // Parent_name_=Parent_name;
        Latest_Qualification_=Latest_Qualification;

        // Institution_=Institution;
      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }
  Future<void> viewreply2() async {
    List<String> id = <String>[];
    List<String> Name = <String>[];
    // List<String> Dob = <String>[];
    // List<String> Gender = <String>[];
    // List<String> Start_Date = <String>[];
    // List<String> Pincode = <String>[];
    // List<String> District = <String>[];
    // List<String> Country = <String>[];
    List<String> Email = <String>[];
    List<String> Phoneno= <String>[];
    List<String> Image= <String>[];
    // List<String> Parent_name= <String>[];
    List<String> Latest_Qualification= <String>[];
    // List<String> Institution= <String>[];


    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String img_url = sh.getString('img_url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/Sponsor_view_Students/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'search':dropdownvalue

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        Name.add(arr[i]['Name']);
        // Dob.add(arr[i]['Dob'].toString());
        // Gender.add(arr[i]['Gender']);
        // Start_Date.add(arr[i]['Start_Date'].toString());
        // Pincode.add(arr[i]['Pincode'].toString());
        // District.add(arr[i]['District'].toString());
        // Country.add(arr[i]['Country'].toString());
        Email.add(arr[i]['Email'].toString());
        Phoneno.add(arr[i]['Phoneno'].toString());
        // Image.add(arr[i]['Image'].toString());
        Image.add(sh.getString('img_url').toString()+arr[i]['Image']);

        // Parent_name.add(arr[i]['Parent_name'].toString());
        Latest_Qualification.add(arr[i]['Latest_Qualification'].toString());

        // Institution.add(arr[i]['Institution']);
      }

      setState(() {
        id_ = id;
        Name_ = Name;
        // Dob_ = Dob;
        // Gender_ = Gender;
        // Place_ = Start_Date;
        // Pincode_ = Pincode;
        // District_ = District;
        // Country_ = Country;
        Email_ = Email;
        Phoneno_=Phoneno;
        Image_=Image;
        // Parent_name_=Parent_name;
        Latest_Qualification_=Latest_Qualification;

        // Institution_=Institution;
      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }
  String dropdownvalue = 'Items';

  // List of items in our dropdown menu
  var items = [
    'Items',
    'Arts',
    'Sports',
    'Education',
    'Clubs',
    'Others',
  ];




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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 20.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => HomeScreen(),));
                  },
                  splashRadius: 1.0,
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: kDarkGreenColor,
                    size: 24.0,
                  ),
                ),
              ),
              Text(
                'SCHOLARSHIPS',
                style: GoogleFonts.poppins(
                  color: kDarkGreenColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 40.0,
                child: IconButton(
                  onPressed: () {},
                  splashRadius: 1.0,
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 34.0,
                  ),
                ),
              ),
            ],
          ),
        ),


        body: Column(
          children: [
            // DropdownButton(
            //
            //   // Initial Value
            //   value: dropdownvalue,
            //
            //   // Down Arrow Icon
            //   icon: const Icon(Icons.keyboard_arrow_down),
            //
            //   // Array list of items
            //   items: items.map((String items) {
            //     return DropdownMenuItem(
            //       value: items,
            //       child: Text(items),
            //     );
            //   }).toList(),
            //   // After selecting the desired option,it will
            //   // change button value to selected value
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownvalue = newValue!;
            //       viewreply2();
            //     });
            //   },
            // ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                // padding: EdgeInsets.all(5.0),
                // shrinkWrap: true,
                itemCount: id_.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onLongPress: () {
                      print("long press" + index.toString());
                    },
                    title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            Container(
                              width: 400,
                              child: Card(
                                elevation: 6,
                                margin: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Container(
                                  color: kGinColor,
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(radius: 50,backgroundImage: NetworkImage(Image_[index]),),

                                      Text(
                                        "Name: " + Name_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Dob: " + Dob_[index],
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Gender: " + Gender_[index],
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Address: " + Address_[index],
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Start_Date: " + Place_[index],
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Pincode: " + Pincode_[index],
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "District: " + District_[index],
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Country: " + Country_[index],
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Email: " + Email_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Phoneno: " + Phoneno_[index],
                                        style: TextStyle(
                                            fontSize: 16),
                                      ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Parent_name: " + Parent_name_[index],
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Latest_Qualification: " + Latest_Qualification_[index],
                                        style: TextStyle(
                                            fontSize: 16),
                                      ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Image: " + Image_[index],
                                      //   style: TextStyle(
                                      //       fontSize: 16),
                                      // ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Institution: " + Institution_[index],
                                      //   style: TextStyle(
                                      //       fontSize: 16),
                                      // ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () async {

                                              SharedPreferences sh = await SharedPreferences.getInstance();
                                              sh.setString("sid", id_[index]);
                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => Sponsorviewstudentprofile(title: '',),));



                                            },
                                            child: Text("View more"),

                                          ),
                                          SizedBox(width: 10,),
                                          ElevatedButton(
                                            onPressed: () async {

                                              SharedPreferences sh = await SharedPreferences.getInstance();
                                              String url = sh.getString('url').toString();
                                              sh.setString("sid", id_[index]);

                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => Sponsorviewstudentportfolio(title: '',),));



                                            },
                                            child: Text("Portfolio"),
                                          ),
                                          // SizedBox(width: 10,),
                                          //  ElevatedButton(
                                          //  onPressed: () async {
                                          //    SharedPreferences sh = await SharedPreferences
                                          //        .getInstance();
                                          //    String url = sh.getString('url')
                                          //        .toString();
                                          //  },
                                          //    child: Text("Portfolio"),
                                          //  ),
                                           ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),



                            // Card(
                            //   child:
                            //   Row(
                            //       children: [
                            //         Column(
                            //           children: [
                            //             Padding(
                            //               padding: EdgeInsets.all(5),
                            //               child: Text("Date: "+date_[index]),
                            //             ),
                            //             Padding(
                            //               padding: EdgeInsets.all(5),
                            //               child: Text("Complaint: "+complaint_[index]),
                            //             ),    Padding(
                            //               padding: EdgeInsets.all(5),
                            //               child: Text("Reply: "+reply_[index]),
                            //             ),  Padding(
                            //               padding: EdgeInsets.all(5),
                            //               child: Text("Status: "+status_[index]),
                            //             ),
                            //           ],
                            //         ),
                            //
                            //       ]
                            //   ),
                            //
                            //   elevation: 6,
                            // ),
                          ],
                        )),
                  );
                },
              ),
            ),
          ],
        ),




      ),
    );
  }
}
