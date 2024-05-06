import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scholarchain/utils/helpers/snackbar_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:login_register_app/utils/helpers/snackbar_helper.dart';
import 'package:http/http.dart' as http;

import '../components/app_text_form_field.dart';
import '../utils/common_widgets/gradient_background.dart';
import '../utils/helpers/navigation_helper.dart';
import '../values/app_constants.dart';
import '../values/app_regex.dart';
import '../values/app_routes.dart';
import '../values/app_strings.dart';
import '../values/app_theme.dart';
import 'newloginnew.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController NameController;
  late final TextEditingController EmailController;
  late final TextEditingController PhonenoController;
  late final TextEditingController AddressController;
  late final TextEditingController PlaceController;
  late final TextEditingController PincodeController;
  late final TextEditingController DistrictController;
  late final TextEditingController StateController;
  late final TextEditingController CountryController;
  late final TextEditingController ProofController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  String gender='Male';

  final ValueNotifier<bool> passwordNotifier = ValueNotifier(true);
  final ValueNotifier<bool> confirmPasswordNotifier = ValueNotifier(true);
  final ValueNotifier<bool> fieldValidNotifier = ValueNotifier(false);

  void initializeControllers() {
    NameController = TextEditingController()..addListener(controllerListener);
    EmailController = TextEditingController()..addListener(controllerListener);
    PhonenoController = TextEditingController()..addListener(controllerListener);
    AddressController = TextEditingController()..addListener(controllerListener);
    PlaceController = TextEditingController()..addListener(controllerListener);
    PincodeController = TextEditingController()..addListener(controllerListener);
    DistrictController = TextEditingController()..addListener(controllerListener);
    StateController = TextEditingController()..addListener(controllerListener);
    CountryController = TextEditingController()..addListener(controllerListener);
    ProofController = TextEditingController()..addListener(controllerListener);
    passwordController = TextEditingController()
      ..addListener(controllerListener);
    confirmPasswordController = TextEditingController()
      ..addListener(controllerListener);
  }

  void disposeControllers() {
    String gender = "Male";

    NameController.dispose();
    EmailController.dispose();
    PhonenoController.dispose();
    AddressController.dispose();
    PlaceController.dispose();
    PincodeController.dispose();
    DistrictController.dispose();
    StateController.dispose();
    CountryController.dispose();
    ProofController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void controllerListener() {
    String gender = "Male";

    final name = NameController.text;
    final email = EmailController.text;
    final phoneno = PhonenoController.text;
    final address = AddressController.text;
    final place = PlaceController.text;
    final pincode = PincodeController.text;
    final district = DistrictController.text;
    final state = StateController.text;
    final country = CountryController.text;
    // final proof =ProofController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty &&
        email.isEmpty &&
        phoneno.isEmpty &&
        address.isEmpty &&
        place.isEmpty &&
        pincode.isEmpty &&
        district.isEmpty &&
        state.isEmpty &&
        country.isEmpty &&
        // proof.isEmpty &&
        password.isEmpty &&
        confirmPassword.isEmpty) return;

    if (AppRegex.emailRegex.hasMatch(email) &&
        AppRegex.passwordRegex.hasMatch(password) &&
        AppRegex.passwordRegex.hasMatch(confirmPassword)) {
      fieldValidNotifier.value = true;
    } else {
      fieldValidNotifier.value = false;
    }
  }

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const GradientBackground(
            children: [
              Text(AppStrings.register, style: AppTheme.titleLarge),
              SizedBox(height: 6),
              Text(AppStrings.createYourAccount, style: AppTheme.bodySmall),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          Center(child: Image(image: AssetImage('assets/bg1.jpeg'),height: 100,width: 100,)),
                          Text('Select Image',style: TextStyle(color: Colors.cyan))
                        ],
                      ),
                    ),
                  },
                  AppTextFormField(
                    autofocus: true,
                    labelText: AppStrings.name,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterName
                          : value.length < 4
                          ? AppStrings.invalidName
                          : null;
                    },
                    controller: NameController,
                  ),
                  AppTextFormField(
                    autofocus: true,
                    labelText: AppStrings.phoneno,
                    keyboardType: TextInputType.phone,                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterPhoneno
                          : value.length > 10
                          ? AppStrings.invalidPhoneno
                          : null;
                    },
                    controller: PhonenoController,
                  ),

                  AppTextFormField(
                    autofocus: true,
                    labelText: AppStrings.address,
                    keyboardType: TextInputType.addressAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterAddress

                          : value.length < 4
                          ? AppStrings.invalidAddress
                          : null;
                    },
                    controller: AddressController,
                  ),
                  RadioListTile(value: "Male", groupValue: gender, onChanged: (value) { setState(() {gender="Male";}); },title: Text("Male", style: TextStyle(color: Colors.blueGrey),),),
                  RadioListTile(value: "Female", groupValue: gender, onChanged: (value) { setState(() {gender="Female";}); },title: Text("Female", style: TextStyle(color: Colors.blueGrey)),),
                  RadioListTile(value: "Other", groupValue: gender, onChanged: (value) { setState(() {gender="Other";}); },title: Text("Other", style: TextStyle(color: Colors.blueGrey)),),

                  AppTextFormField(
                    autofocus: true,
                    labelText: AppStrings.place,
                    keyboardType: TextInputType.placeAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterAddress

                          : value.length < 4
                          ? AppStrings.invalidAddress
                          : null;
                    },
                    controller: PlaceController,
                  ),


                  AppTextFormField(
                    autofocus: true,
                    labelText: AppStrings.pincode,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterPincode

                          : value.length > 6
                          ? AppStrings.invalidPincode
                          : null;
                    },
                    controller: PincodeController,

                  ),

                  AppTextFormField(
                    autofocus: true,
                    labelText: AppStrings.district,
                    keyboardType: TextInputType.districtAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterDistrict

                          : value.length < 4
                          ? AppStrings.invalidDistrict
                          : null;
                    },
                    controller:DistrictController,
                  ),

                  AppTextFormField(
                    autofocus: true,
                    labelText: AppStrings.state,
                    keyboardType: TextInputType.stateAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterState

                          : value.length < 4
                          ? AppStrings.invalidState
                          : null;
                    },
                    controller: StateController,
                  ),

                  AppTextFormField(
                    autofocus: true,
                    labelText: AppStrings.country,
                    keyboardType: TextInputType.countryAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterCountry

                          : value.length < 4
                          ? AppStrings.invalidCountry
                          : null;
                    },
                    controller: CountryController,
                  ),


                 Text(
                   'Proof',
                  ),




                  if (_selectedImage1 != null) ...{
                    InkWell(
                      child:
                      Image.file(_selectedImage1!, height: 400,),
                      radius: 399,
                      onTap: _checkPermissionAndChooseImage2,
                      // borderRadius: BorderRadius.all(Radius.circular(200)),
                    ),
                  } else ...{

                    InkWell(
                      onTap: _chooseFile,
                      child: Column(
                        children: [
                          Center(
                            child: Icon(Icons.file_upload),
                          ),
                          Text('Choose File', style: TextStyle(
                              color: Colors.cyan))
                        ],
                      ),
                    ),
                  },

                  AppTextFormField(
                    labelText: AppStrings.email,
                    controller: EmailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? AppStrings.pleaseEnterEmailAddress
                          : AppConstants.emailRegex.hasMatch(value)
                          ? null
                          : AppStrings.invalidEmailAddress;
                    },
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: passwordNotifier,
                    builder: (_, passwordObscure, __) {
                      return AppTextFormField(
                        obscureText: passwordObscure,
                        controller: passwordController,
                        labelText: AppStrings.password,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (_) => _formKey.currentState?.validate(),
                        validator: (value) {
                          return value!.isEmpty
                              ? AppStrings.pleaseEnterPassword
                              : AppConstants.passwordRegex.hasMatch(value)
                              ? null
                              : AppStrings.invalidPassword;
                        },
                        suffixIcon: Focus(
                          /// If false,
                          ///
                          /// disable focus for all of this node's descendants
                          descendantsAreFocusable: false,

                          /// If false,
                          ///
                          /// make this widget's descendants un-traversable.
                          // descendantsAreTraversable: false,
                          child: IconButton(
                            onPressed: () =>
                            passwordNotifier.value = !passwordObscure,
                            style: IconButton.styleFrom(
                              minimumSize: const Size.square(48),
                            ),
                            icon: Icon(
                              passwordObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: confirmPasswordNotifier,
                    builder: (_, confirmPasswordObscure, __) {
                      return AppTextFormField(
                        labelText: AppStrings.confirmPassword,
                        controller: confirmPasswordController,
                        obscureText: confirmPasswordObscure,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (_) => _formKey.currentState?.validate(),
                        validator: (value) {
                          return value!.isEmpty
                              ? AppStrings.pleaseReEnterPassword
                              : AppConstants.passwordRegex.hasMatch(value)
                              ? passwordController.text ==
                              confirmPasswordController.text
                              ? null
                              : AppStrings.passwordNotMatched
                              : AppStrings.invalidPassword;
                        },
                        suffixIcon: Focus(
                          /// If false,
                          ///
                          /// disable focus for all of this node's descendants.
                          descendantsAreFocusable: false,

                          /// If false,
                          ///
                          /// make this widget's descendants un-traversable.
                          // descendantsAreTraversable: false,
                          child: IconButton(
                            onPressed: () => confirmPasswordNotifier.value =
                            !confirmPasswordObscure,
                            style: IconButton.styleFrom(
                              minimumSize: const Size.square(48),
                            ),
                            icon: Icon(
                              confirmPasswordObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: fieldValidNotifier,
                    builder: (_, isValid, __) {
                      return FilledButton(
                        onPressed: isValid
                            ? () {
                          if(photo.length== 0){
                            Fluttertoast.showToast(msg: 'Please upload profile picture');
                          }
                          else if(proof.length==0){
                            Fluttertoast.showToast(msg: 'Please upload proof ');

                          }
                         else{
                            _send_data();
                          }
                          SnackbarHelper.showSnackBar(
                            AppStrings.registrationComplete,

                          );
                          NameController.clear();
                          EmailController.clear();
                          passwordController.clear();
                          confirmPasswordController.clear();


                        }
                            : null,
                        child: const Text(AppStrings.register),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.iHaveAnAccount,
                style: AppTheme.bodySmall.copyWith(color: Colors.black),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LoginScreen(title: "Login"),));

    }

                ,
                child: const Text(AppStrings.login),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _send_data() async{

    String uname=NameController.text;
    String Email=EmailController.text;
    String Phoneno=PhonenoController.text;
    String Address=AddressController.text;
    String Place=PlaceController.text;
    String Pincode=PincodeController.text;
    String District=DistrictController.text;
    String State=StateController.text;
    String Country=CountryController.text;
    // String Proof=ProofController.text;
    String Password=passwordController.text;
    String ConformPassword=confirmPasswordController.text;





    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/SponsorSignup/');
    try {

      final response = await http.post(urls, body: {
        "Name":uname,
        "Email":Email,
        "Phoneno":Phoneno,
        "Address":Address,
        "Place":Place,
        "Pincode":Pincode,
        "District":District,
        "Image":photo,
        "Gender":gender,

        "State":State,
        "Country":Country,
        "Proof":proof,
        "Password":Password,
        "ConformPassword":ConformPassword,




      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {


          Fluttertoast.showToast(msg: 'Registration Successfull');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => LoginScreen(title: '',),));
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

  String photo = '';
  String proof = '';

  File? _selectedImage;
  String? _encodedImage;
  File? _selectedImage1;
  String? _encodedImage1;


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

  Future<void> _chooseFile() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage1 = File(pickedImage.path);
        _encodedImage1 = base64Encode(_selectedImage1!.readAsBytesSync());
        proof = _encodedImage1.toString();
      });
    }
  }

  Future<void> _checkPermissionAndChooseImage2() async {
    final PermissionStatus status = await Permission.mediaLibrary.request();
    if (status.isGranted) {
      _chooseFile();
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


}
