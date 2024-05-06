
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController ipcontroller=new TextEditingController();



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(
          color: Colors.white,
          icon: const Icon(Icons.logout),

          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) => LoginPage(title: ""),));
          },
        ),],
        backgroundColor: Color.fromARGB(250, 30, 90, 105),

        title: Text(widget.title),
      ),
      body:
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/cat.jpg'), fit: BoxFit.cover),),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 210,
            childAspectRatio: 10/10,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,

          ),
          padding: const EdgeInsets.all(8.0),
          children: [


          ],

        ),
      ),




      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color:  Color.fromARGB(195, 29, 155, 187),


              ),
              child:
              Column(children: [

                Text(
                  '',
                  style: TextStyle(fontSize: 20,color: Colors.grey[200]),
                ),
                // CircleAvatar(radius: 50,backgroundImage: AssetImage('assets/images/nss.jpeg')),




              ])


              ,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: const Text(' Profile '),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => StudentViewEvents(),));
              },
            ),

          ],
        ),
      ),





    );

  }

}
