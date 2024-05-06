import 'package:scholarchain/constants.dart';
// import 'package:plantpetcare/homenew.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:scholarchain/src/pages/home_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: const ViewSchStatusStudent(title: 'Scholarships'),
    );
  }
}

class ViewSchStatusStudent extends StatefulWidget {
  const ViewSchStatusStudent({super.key, required this.title});

  final String title;

  @override
  State<ViewSchStatusStudent> createState() => _ViewReplyPageState();
}

class _ViewReplyPageState extends State<ViewSchStatusStudent> {

  _ViewReplyPageState(){
    viewreply();
  }

  List<String> id_ = <String>[];
  List<String> ScholarShip_Name_= <String>[];
  List<String> Organization_Name_= <String>[];
  List<String> Date_= <String>[];
  List<String> Status_= <String>[];
  List<String> End_Date_= <String>[];
  List<String> Renewal_Date_= <String>[];
  List<String> Amount_= <String>[];
  List<String> Scholarship_Period_= <String>[];


  Future<void> viewreply() async {
    List<String> id = <String>[];
    List<String> ScholarShip_Name = <String>[];
    List<String> Organization_Name = <String>[];
    List<String> Date = <String>[];
    List<String> Status = <String>[];
    List<String> End_Date = <String>[];
    List<String> Renewal_Date = <String>[];
    List<String> Amount = <String>[];
    List<String> Scholarship_Period = <String>[];




    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/Student_view_Status/';

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
        ScholarShip_Name.add(arr[i]['ScholarShip_Name']);
        Organization_Name.add(arr[i]['Name'].toString());
        Date.add(arr[i]['Date']);
        Status.add(arr[i]['Status'].toString());
        End_Date.add(arr[i]['End_Date'].toString());
        Renewal_Date.add(arr[i]['Renewal_Date'].toString());
        Amount.add(arr[i]['Amount'].toString());
        Scholarship_Period.add(arr[i]['Scholarship_Period'].toString());


      }

      setState(() {
        id_ = id;
        ScholarShip_Name_ = ScholarShip_Name;
        Organization_Name_ = Organization_Name;
        Date_ = Date;
        Status_ = Status;
        End_Date_ = End_Date;
        Renewal_Date_ = Renewal_Date;
        Amount_ = Amount;
        Scholarship_Period_ = Scholarship_Period;
      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }
  Future<void> viewreply2() async {
    List<String> id = <String>[];
    List<String> ScholarShip_Name = <String>[];
    List<String> Organization_Name = <String>[];
    List<String> Date = <String>[];
    List<String> Status = <String>[];;
    List<String> End_Date = <String>[];
    List<String> Renewal_Date = <String>[];
    List<String> Amount = <String>[];
    List<String> Scholarship_Period = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/Student_view_Status/';

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
        ScholarShip_Name.add(arr[i]['ScholarShip_Name']);
        Organization_Name.add(arr[i]['Organization_Name'].toString());
        Date.add(arr[i]['Date']);
        Status.add(arr[i]['Status']);

        End_Date.add(arr[i]['End_Date'].toString());
        Renewal_Date.add(arr[i]['Renewal_Date'].toString());
        Amount.add(arr[i]['Amount'].toString());
        Scholarship_Period.add(arr[i]['Scholarship_Period'].toString());


      }

      setState(() {
        id_ = id;
        ScholarShip_Name_ = ScholarShip_Name;
        Organization_Name_ =Organization_Name;
        Date_ = Date;
        Status_ = Status;
        End_Date_ = End_Date;
        Renewal_Date_ = Renewal_Date;
        Amount_ = Amount;
        Scholarship_Period_ = Scholarship_Period;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }
  String dropdownvalue = 'Items';

  // List of items in our dropdown menu
  // var items = [
  //   'Items',
  //   'Arts',
  //   'Sports',
  //   'Education',
  //   'Clubs',
  //   'Others',
  // ];




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
                                      Text(
                                        "ScholarShip_Name: " + ScholarShip_Name_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Organization_Name: " + Organization_Name_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Date: " + Date_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Status: " + Status_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),

                                      SizedBox(height: 8),
                                      Text(
                                        "End_Date: " + End_Date_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Renewal_Date: " + Renewal_Date_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Amount: " + Amount_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Scholarship_Period: " + Scholarship_Period_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      //
                                      // ElevatedButton(
                                      //   onPressed: () async {
                                      //
                                      //     SharedPreferences sh = await SharedPreferences.getInstance();
                                      //     String url = sh.getString('url').toString();
                                      //     String lid = sh.getString('lid').toString();
                                      //
                                      //     final urls = Uri.parse('$url/Student_apply_sch/');
                                      //     try {
                                      //       final response = await http.post(urls, body: {
                                      //         'lid':lid,
                                      //         'sid':id_[index],
                                      //
                                      //
                                      //
                                      //       });
                                      //       if (response.statusCode == 200) {
                                      //         String status = jsonDecode(response.body)['status'];
                                      //         // String types=jsonDecode(response.body)['Type'];
                                      //         if (status=='ok') {
                                      //
                                      //           Fluttertoast.showToast(msg: 'Application Submitted');
                                      //
                                      //           // if (types == "Student"){
                                      //           //   String lid=jsonDecode(response.body)['lid'];
                                      //           //   sh.setString("lid", lid);
                                      //           //
                                      //           Navigator.push(context, MaterialPageRoute(
                                      //             builder: (context) => HomePage(),));
                                      //           // }
                                      //           // else if (types == "Sponser"){
                                      //           //   String lid=jsonDecode(response.body)['lid'];
                                      //           //   sh.setString("lid", lid);
                                      //           //   //
                                      //           //   // Navigator.push(context, MaterialPageRoute(
                                      //           //   //   builder: (context) => MyHomePage(title: "Home"),));
                                      //           // }
                                      //         }else {
                                      //           Fluttertoast.showToast(msg: 'invalid user');
                                      //         }
                                      //       }
                                      //       else {
                                      //         Fluttertoast.showToast(msg: 'Network Error');
                                      //       }
                                      //     }
                                      //     catch (e){
                                      //       Fluttertoast.showToast(msg: e.toString());
                                      //     }
                                      //
                                      //
                                      //   },
                                      //   child: Text("Apply"),
                                      // ),
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
