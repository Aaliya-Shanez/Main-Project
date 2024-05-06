import 'package:flutter/material.dart';
import 'package:scholarchain/Models/bigcontainermodel.dart';
import 'package:scholarchain/Models/smallcontainermodel.dart';
import 'package:scholarchain/Screens/detailscreen.dart';
import 'package:scholarchain/Sponsor/viewintereststatus.dart';
import 'package:scholarchain/Sponsor/viewsch.dart';
import 'package:scholarchain/Utilities/colors.dart';
import 'package:scholarchain/Utilities/constant.dart';
import 'package:scholarchain/sponsorviewstudents.dart';

import '../newloginnew.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: backgroundclr,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   height: screenSize.height * 0.065,
                    //   width: screenSize.width * 0.115,
                    //   decoration: BoxDecoration(
                    //       color: lbackgroundclr,
                    //       borderRadius: BorderRadius.circular(15)),
                    //   child: const Icon(
                    //     Icons.sort_rounded,
                    //     color: whiteclr,
                    //   ),
                    // ),
                    Column(
                      children: [
                        const Text(
                          "SCHOLARCHAIN",
                          style: TextStyle(
                              color: whiteclr,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.002,
                        ),
                        const Text(
                          "Welcoming you",
                          style: TextStyle(
                            color: primaryclr,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   height: screenSize.height * 0.065,
                    //   width: screenSize.width * 0.115,
                    //   decoration: BoxDecoration(
                    //       image: const DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: NetworkImage(
                    //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz-LJaTp0HFRT2GHznf3n7iSAzu-z7och7Vc0GsJkTHWEk67OjQ0t0o6piSTpTv9sr7UI&usqp=CAU")),
                    //       color: lbackgroundclr,
                    //       borderRadius: BorderRadius.circular(15)),
                    // ),
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => LoginScreen(title: "Login"),));
                    }, icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 30,
                    ))
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                const Text(
                  "What would you like\nto do",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: whiteclr,
                    fontSize: 21,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.027,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.065,
                      width: screenSize.width * 0.785,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Choose Students...",
                          hintStyle: const TextStyle(color: Colors.grey),
                          fillColor: lbackgroundclr,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: screenSize.height * 0.065,
                    //   width: screenSize.width * 0.115,
                    //   decoration: BoxDecoration(
                    //     color: lbackgroundclr,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: const Icon(
                    //     Icons.tune,
                    //     color: whiteclr,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.027,
                ),
                SizedBox(
                  height: screenSize.height * 0.185,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: smallcon.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (() {
                            if(index==0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      ViewSponsorScholarshipPage(title:'')
                                  )
                                ),
                              );
                            }
                            if(index==1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        SponsorViewStudents(title:'')
                                    )
                                ),
                              );
                            }
                            if(index==3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        Viewintereststatus(title: BigCon[index].name)
                                    ),
                                ),
                              );
                            }
                          }),
                          child: Container(
                            width: screenSize.width * 0.22,
                            decoration: BoxDecoration(
                              color: lbackgroundclr,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenSize.height * 0.1,
                                    width: screenSize.width * 0.2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                smallcon[index].image)),
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  Text(
                                    smallcon[index].name,
                                    style: const TextStyle(color: whiteclr,fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.015,
                ),
                const Text(
                  "Scholarships",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: whiteclr,
                    fontSize: 21,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.020,
                ),
                SizedBox(
                  height: screenSize.height * 0.357,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    //here goes Schols
                    itemCount: BigCon.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: (() {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            ViewSponsorScholarshipPage(title: BigCon[index].name)
                                        )
                                    ),
                                  );
                              }),
                              child: Container(
                                width: screenSize.width * 0.65,
                                decoration: BoxDecoration(
                                  color: lbackgroundclr,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: screenSize.height * 0.19,
                                      width: screenSize.width * 0.65,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              NetworkImage(BigCon[index].image),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                BigCon[index].name,
                                                style: const TextStyle(
                                                    color: whiteclr,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.alarm,
                                                    size: 16,
                                                    color: Color(
                                                      0xff513330,
                                                    ),
                                                  ),
                                                  Text(
                                                    BigCon[index].time,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: whiteclr),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.005,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Color(0xffFCD506),
                                                size: 16,
                                              ),
                                              Text(
                                                BigCon[index].ratting,
                                                style: const TextStyle(
                                                    fontSize: 14.5,
                                                    color: whiteclr),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.009,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: const Color(
                                                        0xff40404B)),
                                                height:
                                                    screenSize.height * 0.045,
                                                width: screenSize.width * 0.2,
                                                child: const Center(
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: whiteclr),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width * 0.025,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: const Color(
                                                        0xff40404B)),
                                                height:
                                                    screenSize.height * 0.045,
                                                width: screenSize.width * 0.2,
                                                child: const Center(
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: whiteclr),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width * 0.025,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: const Color(
                                                        0xff40404B)),
                                                height:
                                                    screenSize.height * 0.045,
                                                width: screenSize.width * 0.12,
                                                child: const Center(
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: whiteclr),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 0,
                              child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    size: 25,
                                    color: whiteclr,
                                  )),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class DispInfo2 {
  String name;
  String image;
  String time;
  String ratting;
  DispInfo2(
      {required this.name,
        required this.ratting,
        required this.time,
        required this.image});
}

List BigCon = [
  DispInfo2(
      name: "Arts",
      ratting: " 9.1 Perfect (125)",
      time: " ",
      image:
      "https://npr.brightspotcdn.com/dims4/default/a0a7b1d/2147483647/strip/true/crop/1112x805+0+0/resize/880x637!/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2Fd3%2Fab%2F53eb70d14d73be1952998986a097%2Farpan.jpg"),
DispInfo2(
      name: "Sports",
      ratting: " 8.1 Good (122)",
      time: " ",
      image:
      "https://img.freepik.com/free-photo/sports-abstract-collage_23-2151203866.jpg?size=626&ext=jpg&ga=GA1.1.1036414488.1707213560&semt=sph"),
  DispInfo2(
      name: "Education",
      ratting: " 8.3 Good (123)",
      time: " ",
      image:
"https://www.shutterstock.com/shutterstock/photos/767491552/display_1500/stock-vector-education-tree-of-knowledge-and-open-book-effective-modern-education-template-design-back-to-767491552.jpg"),
 DispInfo2(
      name: "Clubs",
      ratting: " 8.4 Very Good (124)",
      time: " ",
      image:
      "https://swanson.apsva.us/wp-content/uploads/sites/33/2020/09/Clubs.jpg"),
  DispInfo2(
      name: "Others",
      ratting: " 8.4 Very Good (124)",
      time: " ",
      image:
"https://m.media-amazon.com/images/M/MV5BZTI2YmI0ZTItOTBlZi00YTAzLTk2NmYtOGE3M2IxOGY0YmMzXkEyXkFqcGdeQXVyMzgyMTk4OTY@._V1_.jpg"),

];