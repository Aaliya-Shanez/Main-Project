import 'package:scholarchain/constants.dart';
// import 'package:plantpetcare/homenew.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// import 'sendcomplaint.dart';
void main() {
  runApp( Viewintereststatus(title: '',));
}


class Viewintereststatus extends StatefulWidget {
  const Viewintereststatus({super.key, required this.title});

  final String title;

  @override
  State<Viewintereststatus> createState() => _ViewintereststatusPageState();
}

class _ViewintereststatusPageState extends State<Viewintereststatus> {

  _ViewintereststatusPageState(){
    Viewintereststatus();
  }

  List<String> id_ = <String>[];
  List<String> ScholarShip_Name_= <String>[];
  List<String> Scholarship_Number_= <String>[];
  List<String> Eligibility_= <String>[];
  List<String> Amount_= <String>[];
  List<String> Scholarship_Period_= <String>[];
  

  Future<void> Viewintereststatus() async {
    List<String> id = <String>[];
    List<String> ScholarShip_Name = <String>[];
    List<String> Scholarship_Number = <String>[];
    List<String> Eligibility = <String>[];
    List<String> Amount = <String>[];
    List<String> Scholarship_Period = <String>[];
   



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/sponsor_view_interested_status/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'Scholarship_Type':widget.title,

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        ScholarShip_Name.add(arr[i]['ScholarShip_Name']);
        Scholarship_Number.add(arr[i]['Scholarship_Number'].toString());
        Eligibility.add(arr[i]['Eligibility']);
        Amount.add(arr[i]['Amount'].toString());
        Scholarship_Period.add(arr[i]['Scholarship_Period'].toString());

      }

      setState(() {
        id_ = id;
        ScholarShip_Name_ = ScholarShip_Name;
        Scholarship_Number_ = Scholarship_Number;
        Eligibility_ = Eligibility;
        Amount_ = Amount;
        Scholarship_Period_ = Scholarship_Period;
      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }
  Future<void> Viewintereststatus2() async {
    List<String> id = <String>[];
    List<String> ScholarShip_Name = <String>[];
    List<String> Scholarship_Number = <String>[];
    List<String> Eligibility = <String>[];
    List<String> Amount = <String>[];
    List<String> Scholarship_Period = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/public_view_search/';

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
        Scholarship_Number.add(arr[i]['Scholarship_Number'].toString());
        Eligibility.add(arr[i]['Eligibility']);
        Amount.add(arr[i]['Amount'].toString());
        Scholarship_Period.add(arr[i]['Scholarship_Period'].toString());

      }

      setState(() {
        id_ = id;
        ScholarShip_Name_ = ScholarShip_Name;
        Scholarship_Number_ = Scholarship_Number;
        Eligibility_ = Eligibility;
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
                                        "Scholarship_Number: " + Scholarship_Number_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Eligibility: " + Eligibility_[index],
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

    final urls = Uri.parse('$url/sponsor_view_interested_status/');
    try {
      final response = await http.post(urls, body: {
        'Scholarship_Id':id,
        'lid':sh.getString('lid').toString(),

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        // String types=jsonDecode(response.body)['Type'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Interested');


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
