

import 'package:scholarchain/Screens/homescreen.dart';
import 'package:scholarchain/Sponsor/viewprofstudent.dart';
import 'package:scholarchain/constants.dart';
// import 'package:plantpetcare/homenew.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:scholarchain/src/pages/home_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
      home: const Sponsorviewstudentportfolio(title: 'Scholarships'),
    );
  }
}

class Sponsorviewstudentportfolio extends StatefulWidget {
  const Sponsorviewstudentportfolio({super.key, required this.title});

  final String title;

  @override
  State<Sponsorviewstudentportfolio> createState() => _ViewReplyPageState();
}

class _ViewReplyPageState extends State<Sponsorviewstudentportfolio> {

  _ViewReplyPageState(){
    viewreply();
  }

  List<String> id_ = <String>[];
  List<String> Student_id_ = <String>[];
  List<String> Percentage_= <String>[];
  // List<String> Dob_= <String>[];
  // List<String> Gender_= <String>[];
  // List<String> Address_= <String>[];
  // List<String> Place_= <String>[];
  // List<String> Pincode_= <String>[];
  // List<String> District_= <String>[];
  // List<String> Country_= <String>[];
  List<String> Adhaar_Number_= <String>[];
  List<String> Parent_Occupation_= <String>[];
  List<String> Parent_Phoneno_= <String>[];

  List<String> Bank_Accountno_= <String>[];
  List<String> Ifsc_Code_= <String>[];
  List<String> Branch_Name_= <String>[];
  List<String> Holder_Name_= <String>[];

  Future<void> viewreply() async {
    List<String> id = <String>[];
    List<String> Student_id = <String>[];
    List<String> Percentage = <String>[];
    // List<String> Dob = <String>[];
    // List<String> Gender = <String>[];
    // List<String> Address = <String>[];
    // List<String> Start_Date = <String>[];
    // List<String> Pincode = <String>[];
    // List<String> District = <String>[];
    // List<String> Country = <String>[];
    List<String> Adhaar_Number = <String>[];
    List<String> Parent_Occupation= <String>[];
    List<String> Parent_Phoneno= <String>[];
    List<String> Bank_Accountno= <String>[];
    List<String> Ifsc_Code= <String>[];
    List<String> Branch_Name= <String>[];
    List<String> Holder_Name= <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String sid = sh.getString('sid').toString();
      String url = '$urls/Sponsor_viewstudentportfolio_POST/';

      var data = await http.post(Uri.parse(url), body: {

        'sid':sid,
        'cat':sh.getString("cat").toString()


      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        Student_id.add(arr[i]['Student_id'].toString());
        Percentage.add(arr[i]['Percentage']);
        // Dob.add(arr[i]['Dob'].toString());
        // Gender.add(arr[i]['Gender']);
        // Address.add(arr[i]['Address'].toString());
        // Start_Date.add(arr[i]['Start_Date'].toString());
        // Pincode.add(arr[i]['Pincode'].toString());
        // District.add(arr[i]['District'].toString());
        // Country.add(arr[i]['Country'].toString());
        Adhaar_Number.add(arr[i]['Adhaar_Number'].toString());
        Parent_Occupation.add(arr[i]['Parent_Occupation'].toString());
        Parent_Phoneno.add(arr[i]['Parent_Phoneno'].toString());

        Bank_Accountno.add(arr[i]['Bank_Accountno'].toString());
        Ifsc_Code.add(arr[i]['Ifsc_Code'].toString());
        Branch_Name.add(arr[i]['Branch_Name'].toString());
        // Parent_Percentage.add(arr[i]['Parent_Percentage'].toString());
        Holder_Name.add(arr[i]['Holder_Name'].toString());

        // Institution.add(arr[i]['Institution']);

      }

      setState(() {
        id_ = id;
        Student_id_ = Student_id;
        Percentage_ = Percentage;
        // Dob_ = Dob;
        // Gender_ = Gender;
        // Address_ = Address;
        // Place_ = Start_Date;
        // Pincode_ = Pincode;
        // District_ = District;
        // Country_ = Country;
        Adhaar_Number_ = Adhaar_Number;
        Parent_Occupation_=Parent_Occupation;
        Parent_Phoneno_=Parent_Phoneno;

        Bank_Accountno_=Bank_Accountno;
        Ifsc_Code_=Ifsc_Code;
        Branch_Name_=Branch_Name;

        // Parent_Percentage_=Parent_Percentage;
        Holder_Name_=Holder_Name;

        // Institution_=Institution;
      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file Parent_Phoneno to base64 encoding.
    }
  }
  Future<void> viewreply2() async {
    List<String> id = <String>[];
    List<String> Student_id = <String>[];
    List<String> Percentage = <String>[];
    // List<String> Dob = <String>[];
    // List<String> Gender = <String>[];
    // List<String> Start_Date = <String>[];
    // List<String> Pincode = <String>[];
    // List<String> District = <String>[];
    // List<String> Country = <String>[];
    List<String> Adhaar_Number = <String>[];
    List<String> Parent_Occupation= <String>[];
    List<String> Parent_Phoneno= <String>[];
    List<String> Bank_Accountno= <String>[];
    List<String> Ifsc_Code= <String>[];
    List<String> Branch_Name= <String>[];
    List<String> Holder_Name= <String>[];




    // List<String> Parent_Percentage= <String>[];
    // List<String> Latest_Qualification= <String>[];
    // List<String> Institution= <String>[];


    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String img_url = sh.getString('img_url').toString();
      String sid = sh.getString('sid').toString();
      String url = '$urls/Sponsor_viewstudentportfolio_POST/';

      var data = await http.post(Uri.parse(url), body: {

        'sid':sid,
        // 'search':dropdownvalue

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        Student_id.add(arr[i]['Student_id'].toString());
        Percentage.add(arr[i]['Percentage']);
        // Dob.add(arr[i]['Dob'].toString());
        // Gender.add(arr[i]['Gender']);
        // Start_Date.add(arr[i]['Start_Date'].toString());
        // Pincode.add(arr[i]['Pincode'].toString());
        // District.add(arr[i]['District'].toString());
        // Country.add(arr[i]['Country'].toString());
        Adhaar_Number.add(arr[i]['Adhaar_Number'].toString());
        Parent_Occupation.add(arr[i]['Parent_Occupation'].toString());
        // Parent_Phoneno.add(arr[i]['Parent_Phoneno'].toString());
        Parent_Phoneno.add(arr[i]['Parent_Phoneno'].toString());
        Bank_Accountno.add(arr[i]['Bank_Accountno'].toString());
        Ifsc_Code.add(arr[i]['Ifsc_Code'].toString());
        Branch_Name.add(arr[i]['Branch_Name'].toString());

        // Parent_Percentage.add(arr[i]['Parent_Percentage'].toString());
        Holder_Name.add(arr[i]['Holder_Name'].toString());

        // Institution.add(arr[i]['Institution']);
      }

      setState(() {
        id_ = id;
        Student_id_ = Student_id;
        Percentage_ = Percentage;
        // Dob_ = Dob;
        // Gender_ = Gender;
        // Place_ = Start_Date;
        // Pincode_ = Pincode;
        // District_ = District;
        // Country_ = Country;
        Adhaar_Number_ = Adhaar_Number;
        Parent_Occupation_=Parent_Occupation;
        Parent_Phoneno_=Parent_Phoneno;
        Bank_Accountno_=Bank_Accountno;
        Ifsc_Code_=Ifsc_Code;
        Branch_Name_=Branch_Name;
        Holder_Name_=Holder_Name;
        // Parent_Percentage_=Parent_Percentage;

        // Institution_=Institution;
      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file Parent_Phoneno to base64 encoding.
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
                    Navigator.pop(context);
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
                                      // CircleAvatar(radius: 50,backgroundParent_Phoneno: NetworkParent_Phoneno(Parent_Phoneno_[index]),),

                                      Text(
                                        "Percentage: " + Percentage_[index],
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
                                        "Adhaar_Number: " + Adhaar_Number_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Parent_Occupation: " + Parent_Occupation_[index],
                                        style: TextStyle(
                                            fontSize: 16),
                                      ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Parent_Percentage: " + Parent_Percentage_[index],
                                      //   style: TextStyle(fontSize: 16),
                                      // ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Latest_Qualification: " + Latest_Qualification_[index],
                                      //   style: TextStyle(
                                      //       fontSize: 16),
                                      // ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Parent_Phoneno: " + Parent_Phoneno_[index],
                                        style: TextStyle(
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Bank_Accountno: " + Bank_Accountno_[index],
                                        style: TextStyle(
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Ifsc_Code: " + Ifsc_Code_[index],
                                        style: TextStyle(
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Branch_Name: " + Branch_Name_[index],
                                        style: TextStyle(
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Holder_Name: " +Holder_Name_[index],
                                        style: TextStyle(
                                            fontSize: 16),
                                      ),
                                      // SizedBox(height: 8),
                                      // Text(
                                      //   "Institution: " + Institution_[index],
                                      //   style: TextStyle(
                                      //       fontSize: 16),
                                      // ),
                                      Row(
                                        children: [
                                          // ElevatedButton(
                                          //   onPressed: () async {
                                          //
                                          //     SharedPreferences sh = await SharedPreferences.getInstance();
                                          //     sh.setString("sid", id_[index]);
                                          //     Navigator.push(context, MaterialPageRoute(
                                          //       builder: (context) => Sponsorviewstudentprofile(title: '',),));
                                          //
                                          //
                                          //
                                          //   },
                                          //   child: Text("View more"),
                                          //
                                          // ),
                                          SizedBox(width: 10,),
                                          ElevatedButton(
                                            onPressed: () async {

                                             _send_data(Student_id_[index]);


                                            },
                                            child: Text("Ready To Sponsor"),
                                          ),
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
  void _send_data(id) async{






    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/spon_sending_required_student/');
    try {
      final response = await http.post(urls, body: {
        'lid':sh.getString('lid').toString(),
        'sid':id




      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        // String types=jsonDecode(response.body)['Type'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Sponsorship Submitted');


          Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeScreen(),));

        }else {
          Fluttertoast.showToast(msg: 'Sponsorship Already Send');
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


