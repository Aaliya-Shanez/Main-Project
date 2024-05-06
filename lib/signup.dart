

import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart ';

import 'package:permission_handler/permission_handler.dart';
import 'login.dart';


void main() {
  runApp(const MyMySignup());
}

class MyMySignup extends StatelessWidget {
  const MyMySignup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySignup',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MySignupPage(title: 'MySignup'),
    );
  }
}

class MySignupPage extends StatefulWidget {
  const MySignupPage({super.key, required this.title});

  final String title;

  @override
  State<MySignupPage> createState() => _MySignupPageState();
}

class _MySignupPageState extends State<MySignupPage> {

  String gender = "Male";
  String Rsponsor="No";
  File? uploadimage;
  TextEditingController NameController= new TextEditingController();
  TextEditingController DobController= new TextEditingController();
  TextEditingController AddressController= new TextEditingController();
  TextEditingController placeController= new TextEditingController();
  TextEditingController pincodeController= new TextEditingController();
  TextEditingController districtController= new TextEditingController();
  TextEditingController countryController= new TextEditingController();
  TextEditingController EmailController= new TextEditingController();
  TextEditingController PhonenoController= new TextEditingController();
  TextEditingController parent_nameController= new TextEditingController();
  TextEditingController Latest_QualificationController= new TextEditingController();
  TextEditingController InstitutionController= new TextEditingController();
  TextEditingController stateController= new TextEditingController();
  TextEditingController PasswordController= new TextEditingController();
  TextEditingController conformpasswordController= new TextEditingController();





  // Future<void> chooseImage() async {
  //   // final choosedimage = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   //set source: ImageSource.camera to get image from camera
  //   setState(() {
  //     // uploadimage = File(choosedimage!.path);
  //   });
  // }




  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_selectedImage != null) ...{
                InkWell(
                  child:
                  Image.file(_selectedImage!, height: 400,),
                  radius: 399,
                  onTap: _checkPermissionAndChooseImage,
                  // borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
              } else ...{
                // Image(image: NetworkImage(),height: 100, width: 70,fit: BoxFit.cover,),
                InkWell(
                  onTap: _checkPermissionAndChooseImage,
                  child:Column(
                    children: [
                      Image(image: NetworkImage('https://cdn.pixabay.com/photo/2017/11/10/05/24/select-2935439_1280.png'),height: 200,width: 200,),
                      Text('Select Image',style: TextStyle(color: Colors.cyan))
                    ],
                  ),
                ),
              },
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: NameController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Name")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: DobController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("DoB")),
                ),
              ),
              RadioListTile(value: "Male", groupValue: gender, onChanged: (value) { setState(() {gender="Male";}); },title: Text("Male"),),
              RadioListTile(value: "Female", groupValue: gender, onChanged: (value) { setState(() {gender="Female";}); },title: Text("Female"),),
              RadioListTile(value: "Other", groupValue: gender, onChanged: (value) { setState(() {gender="Other";}); },title: Text("Other"),),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: AddressController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Address")),
                ),
              ),   Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: placeController,


                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Place")),
                ),
              ),   Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: pincodeController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Pincode")),
                ),
              ),   Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: districtController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("District")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: stateController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("State")),
                ),
              ),       Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: countryController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Country")),
                ),
              ),       Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: EmailController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Email")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: PhonenoController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Phoneno")),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: parent_nameController
                  ,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Parent Name")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: Latest_QualificationController
                  ,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Latest Qualification")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: InstitutionController
                  ,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Institution")),
                ),
              ),
              RadioListTile(value: "Yes", groupValue: Rsponsor, onChanged: (value) { setState(() {Rsponsor="Yes";}); },title: Text("Sponsor Required"),),
              RadioListTile(value: "No", groupValue: Rsponsor, onChanged: (value) { setState(() {Rsponsor="No";}); },title: Text("Not Required Sponsor"),),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: PasswordController
                  ,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Password")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: conformpasswordController
                  ,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Confirm Password")),
                ),
              ),





              ElevatedButton(
                onPressed: () {

                  _send_data() ;

                },
                child: Text("Signup"),
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: Text("Login"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
  void _send_data() async{

    String uname=NameController.text;
    String Dob=DobController.text;
    String Address=AddressController.text;
    String Place=placeController.text;
    String Pincode=pincodeController.text;
    String District=districtController.text;
    String State=stateController.text;
    String Country=countryController.text;
    String Email=EmailController.text;
    String Phoneno=PhonenoController.text;
    String Latest_Qualification=Latest_QualificationController.text;
    String Parent_Name=parent_nameController.text;
    String Institution=InstitutionController.text;
    String Password=PasswordController.text;
    String ConformPassword=conformpasswordController.text;





    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/Studentsignup/');
    try {

      final response = await http.post(urls, body: {
        "Image":photo,
        "Name":uname,
        "Dob":Dob,
        "Address":Address,
        "Place":Place,
        "Pincode":Pincode,
        "District":District,
        "Gender":gender,
        "Rsponsor":Rsponsor,
        "State":State,
        "Country":Country,
        "Email":Email,
        "Phoneno":Phoneno,
        "Parent_Name":Parent_Name,
        "Latest_Qualification":Latest_Qualification,
        "Institution":Institution,
        "Password":Password,
        "ConformPassword":ConformPassword,




      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Registration Successfull');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyLoginPage(title: "Login"),));
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
  File? _selectedImage;
  String? _encodedImage;
  Future<void> _chooseAndUploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        _encodedImage = base64Encode(_selectedImage!.readAsBytesSync());
        photo = _encodedImage.toString();
      });
    }
  }

  Future<void> _checkPermissionAndChooseImage() async {
    final PermissionStatus status = await Permission.mediaLibrary.request();
    if (status.isGranted) {
      _chooseAndUploadImage();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permission Denied'),
          content: const Text(
            'Please go to app settings and grant permission to choose an image.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String photo = '';

}
