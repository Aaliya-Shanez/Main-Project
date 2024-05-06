

import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholarchain/newloginnew.dart';
import 'package:scholarchain/values/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart ';

import 'package:permission_handler/permission_handler.dart';
import 'login.dart';

class myRegister extends StatefulWidget {
  const myRegister({Key? key}) : super(key: key);

  @override
  _myRegisterState createState() => _myRegisterState();
}

class _myRegisterState extends State<myRegister> {
  //Password Field obscureText  Handler
  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/login.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
              elevation: null,
              title: Text('REGISTER', style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.transparent,
              leading: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              )),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    children: [
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
                      TextField(
                        controller: NameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          fillColor: Colors.transparent,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              )),
                        ),
                      ),
                      RadioListTile(value: "Male", groupValue: gender, onChanged: (value) { setState(() {gender="Male";}); },title: Text("Male", style: TextStyle(color: Colors.blueGrey),),),
                      RadioListTile(value: "Female", groupValue: gender, onChanged: (value) { setState(() {gender="Female";}); },title: Text("Female", style: TextStyle(color: Colors.blueGrey)),),
                      RadioListTile(value: "Other", groupValue: gender, onChanged: (value) { setState(() {gender="Other";}); },title: Text("Other", style: TextStyle(color: Colors.blueGrey)),),

                      SizedBox(height: 30.0),
                      TextField(
                        onTap: () => _selectDate(context),
                        controller: DobController,
                        decoration: InputDecoration(

                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.calendar_month),
                          filled: true,
                          labelText: 'DOB',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: AddressController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.home_filled),
                          filled: true,
                          labelText: 'Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: placeController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.location_city),
                          filled: true,
                          labelText: 'Place',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: pincodeController,
                        maxLength: 6,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.post_add),
                          filled: true,
                          labelText: 'Pincode',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: districtController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.location_city_rounded),
                          filled: true,
                          labelText: 'District',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: stateController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.place),
                          filled: true,
                          labelText: 'State',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: countryController,
                        decoration: InputDecoration(

                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.place),
                          filled: true,
                          labelText: 'Country',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: EmailController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.email),
                          filled: true,
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        controller: PhonenoController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          return value!.isEmpty
                              ? AppStrings.pleaseEnterPhoneno
                              : value.length > 10
                              ? AppStrings.invalidPhoneno
                              : null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.phone),
                          filled: true,
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: parent_nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.person_2),
                          filled: true,
                          labelText: 'Parent Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: Latest_QualificationController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.book),
                          filled: true,
                          labelText: 'Latest Qualification',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        controller: InstitutionController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.school),
                          filled: true,
                          labelText: 'Institution',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      RadioListTile(value: "Yes", groupValue: Rsponsor, onChanged: (value) { setState(() {Rsponsor="Yes";}); },title: Text("Sponsor Required"),),
                      RadioListTile(value: "No", groupValue: Rsponsor, onChanged: (value) { setState(() {Rsponsor="No";}); },title: Text("Not Required Sponsor"),),

                      SizedBox(height: 30.0),
                      TextField(
                        controller: PasswordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: _toggleVisibility,
                            icon: _isHidden
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          filled: true,
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),SizedBox(height: 30.0),
                      TextField(
                        controller: conformpasswordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: _toggleVisibility,
                            icon: _isHidden
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          filled: true,
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                maximumSize: const Size(170.0, 90.0),
                                minimumSize: const Size(170.0, 60.0),
                                primary: Colors.black,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {

                                if(photo.isNotEmpty){
                                  _send_data();
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('REGISTER'),
                                  Icon(
                                    Icons.content_paste_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // TextButton(
                          //   onPressed: () {
                          //     Navigator.pushNamed(context, 'login');
                          //   },
                          //   child: Text(
                          //     'Login',
                          //     style: TextStyle(color: Colors.black),
                          //   ),
                          // ),
                          // TextButton(
                          //   onPressed: () {
                          //     Navigator.pushNamed(context, 'forgot');
                          //   },
                          //   child: Text(
                          //     'Forgot password?',
                          //     style: TextStyle(color: Colors.black),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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


  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        DobController.text=selectedDate.toString().substring(0,10);
       });
    }
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
        "State":State,
        "Country":Country,
        "Email":Email,
        "Phoneno":Phoneno,
        "Parent_Name":Parent_Name,
        "Latest_Qualification":Latest_Qualification,
        "Institution":Institution,
        "Rsponsor":Rsponsor,

        "Password":Password,
        "ConformPassword":ConformPassword,




      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Registration Successfull');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => LoginScreen(title: 'Login'),));
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
