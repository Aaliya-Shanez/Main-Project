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
      home: const ViewSponsorScholarshipPage(title: 'Scholarships'),
    );
  }
}

class ViewSponsorScholarshipPage extends StatefulWidget {
  const ViewSponsorScholarshipPage({super.key, required this.title});

  final String title;

  @override
  State<ViewSponsorScholarshipPage> createState() => _ViewReplyPageState();
}

class _ViewReplyPageState extends State<ViewSponsorScholarshipPage> {

  _ViewReplyPageState(){
    viewreply();
  }

  List<String> id_ = <String>[];
  List<String> ScholarShip_Name_= <String>[];
  List<String> Scholarship_Number_= <String>[];
  List<String> Eligibility_= <String>[];
  List<String> Score_= <String>[];
  List<String> Start_Date_= <String>[];
  List<String> End_Date_= <String>[];
  List<String> Renewal_Date_= <String>[];
  List<String> Amount_= <String>[];
  List<String> Scholarship_Period_= <String>[];
  List<String> More_= <String>[];

  Future<void> viewreply() async {
    List<String> id = <String>[];
    List<String> ScholarShip_Name = <String>[];
    List<String> Scholarship_Number = <String>[];
    List<String> Eligibility = <String>[];
    List<String> Score = <String>[];
    List<String> Start_Date = <String>[];
    List<String> End_Date = <String>[];
    List<String> Renewal_Date = <String>[];
    List<String> Amount = <String>[];
    List<String> Scholarship_Period = <String>[];
    List<String> More = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/sponsor_view_sch/';

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
        Score.add(arr[i]['Score'].toString());
        Start_Date.add(arr[i]['Start_Date'].toString());
        End_Date.add(arr[i]['End_Date'].toString());
        Renewal_Date.add(arr[i]['Renewal_Date'].toString());
        Amount.add(arr[i]['Amount'].toString());
        Scholarship_Period.add(arr[i]['Scholarship_Period'].toString());
        More.add(arr[i]['More']);

      }

      setState(() {
        id_ = id;
        ScholarShip_Name_ = ScholarShip_Name;
        Scholarship_Number_ = Scholarship_Number;
        Eligibility_ = Eligibility;
        Score_ = Score;
        Start_Date_ = Start_Date;
        End_Date_ = End_Date;
        Renewal_Date_ = Renewal_Date;
        Amount_ = Amount;
        Scholarship_Period_ = Scholarship_Period;
        More_ = More;
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
    List<String> Scholarship_Number = <String>[];
    List<String> Eligibility = <String>[];
    List<String> Score = <String>[];
    List<String> Start_Date = <String>[];
    List<String> End_Date = <String>[];
    List<String> Renewal_Date = <String>[];
    List<String> Amount = <String>[];
    List<String> Scholarship_Period = <String>[];
    List<String> More = <String>[];



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
        Score.add(arr[i]['Score']);
        Start_Date.add(arr[i]['Start_Date'].toString());
        End_Date.add(arr[i]['End_Date'].toString());
        Renewal_Date.add(arr[i]['Renewal_Date'].toString());
        Amount.add(arr[i]['Amount'].toString());
        Scholarship_Period.add(arr[i]['Scholarship_Period'].toString());
        More.add(arr[i]['More']);

      }

      setState(() {
        id_ = id;
        ScholarShip_Name_ = ScholarShip_Name;
        Scholarship_Number_ = Scholarship_Number;
        Eligibility_ = Eligibility;
        Score_ = Score;
        Start_Date_ = Start_Date;
        End_Date_ = End_Date;
        Renewal_Date_ = Renewal_Date;
        Amount_ = Amount;
        Scholarship_Period_ = Scholarship_Period;
        More_ = More;
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
                                        "Score: " + Score_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Start_Date: " + Start_Date_[index],
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
                                      SizedBox(height: 8),
                                      Text(
                                        "More: " + More_[index],
                                        style: TextStyle(
                                            fontSize: 16),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {

                                          _send_data(id_[index]);


                                        },
                                        child: Text("Interested"),
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

    final urls = Uri.parse('$url/send_Sponsor_Interest/');
    try {
      final response = await http.post(urls, body: {
        'Scholarship_Id':id,
        'SPONSOR_ID':sh.getString('lid').toString(),

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        // String types=jsonDecode(response.body)['Type'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Interested');


        }
        else if(status =='no'){
          Fluttertoast.showToast(msg: 'Already Interested');

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
      Fluttertoast.showToast(msg: e.toString());
    }
  }

}
