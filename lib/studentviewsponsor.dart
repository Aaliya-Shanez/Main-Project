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
      home: const StudentviewSponsor(title: 'Scholarships'),
    );
  }
}

class StudentviewSponsor extends StatefulWidget {
  const StudentviewSponsor({super.key, required this.title});

  final String title;

  @override
  State<StudentviewSponsor> createState() => _ViewReplyPageState();
}

class _ViewReplyPageState extends State<StudentviewSponsor> {

  _ViewReplyPageState(){
    viewreply();
  }

  List<String> id_ = <String>[];
  List<String> Name_= <String>[];
  List<String> Email_= <String>[];
  List<String> Phoneno_= <String>[];
  List<String> Address_= <String>[];
  List<String> Place_= <String>[];
  List<String> District_= <String>[];
  List<String> Pincode_= <String>[];
  List<String> Image_= <String>[];


  Future<void> viewreply() async {
    List<String> id = <String>[];
    List<String> Name = <String>[];
    List<String> Email = <String>[];
    List<String> Phoneno = <String>[];
    List<String> Address = <String>[];
    List<String> Place = <String>[];
    List<String> District = <String>[];
    List<String> Pincode = <String>[];
    List<String> Image = <String>[];




    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/Student_view_Sponsor/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'cat':sh.getString("cat").toString()


      });
      var jsondata = json.decode(data.body);

      var arr = jsondata["data"];

      print(arr);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        Name.add(arr[i]['Name'].toString());
        Email.add(arr[i]['Email'].toString());
        Phoneno.add(arr[i]['Phoneno'].toString());
        Address.add(arr[i]['Address'].toString());
        Place.add(arr[i]['Place'].toString());
        District.add(arr[i]['District'].toString());
        Pincode.add(arr[i]['Pincode'].toString());
        Image.add(sh.getString("img_url").toString()+arr[i]['Image'].toString());


      }

      setState(() {
        id_ = id;
        Name_ = Name;
        Email_ = Email;
        Phoneno_ = Phoneno;
        Address_ = Address;
        Place_ = Place;
        District_ = District;
        Pincode_ = Pincode;
        Image_ = Image;
      });

    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
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
                                      CircleAvatar(radius: 50,backgroundImage: NetworkImage(Image_[index]),),
                                      Text(
                                        "Name: " + Name_[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Email: " + Email_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Phoneno: " + Phoneno_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Address: " + Address_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),

                                      SizedBox(height: 8),
                                      Text(
                                        "Place: " + Place_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "District: " + District_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Pincode: " + Pincode_[index],
                                        style: TextStyle(fontSize: 16),
                                      ),

                                      // SizedBox(height: 8),

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
                                      //       if (response.AddressCode == 200) {
                                      //         String Address = jsonDecode(response.body)['Address'];
                                      //         // String types=jsonDecode(response.body)['Type'];
                                      //         if (Address=='ok') {
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
                            //               child: Text("Phoneno: "+Phoneno_[index]),
                            //             ),
                            //             Padding(
                            //               padding: EdgeInsets.all(5),
                            //               child: Text("Complaint: "+complaint_[index]),
                            //             ),    Padding(
                            //               padding: EdgeInsets.all(5),
                            //               child: Text("Reply: "+reply_[index]),
                            //             ),  Padding(
                            //               padding: EdgeInsets.all(5),
                            //               child: Text("Address: "+Address_[index]),
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
