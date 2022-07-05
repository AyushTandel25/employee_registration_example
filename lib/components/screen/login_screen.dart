import 'package:employee_registration_example/app/constants/image_constants.dart';
import 'package:employee_registration_example/app/services/db_services/employee_database.dart';
import 'package:employee_registration_example/app/services/shared_preference_services.dart';
import 'package:employee_registration_example/components/screen/dashboard_screen.dart';
import 'package:employee_registration_example/components/utills/painter/round_circle_background.dart';
import 'package:employee_registration_example/components/utills/widgets/custom_tetxfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../app/utills/size_utills.dart';

class LoginScreen extends StatefulWidget {
  final Function navigateToRegistration;
  final GlobalKey<FormState> formKey;

  const LoginScreen(
      {Key? key, required this.navigateToRegistration, required this.formKey})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var sizeUtils = SizeUtils.initialise();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var emailFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              Container(
                height: sizeUtils.getScreenHeight(context) * 0.8,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepOrangeAccent),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_upward_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                emailController.text="";
                                passwordController.text="";
                                FocusScope.of(context).unfocus();
                                widget.navigateToRegistration();
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.black38,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    controller: emailController,
                                    focusNode: emailFocusNode,
                                    hintText: "Email",
                                    suffixIcon: Icons.email,
                                    validator: MultiValidator([
                                      EmailValidator(
                                          errorText:
                                              "Please enter valid email"),
                                      MinLengthValidator(1,
                                          errorText: "Please enter email")
                                    ]),
                                  ),
                                  CustomTextField(
                                    controller: passwordController,
                                    focusNode: passwordFocusNode,
                                    hintText: "Password",
                                    suffixIcon: Icons.settings,
                                    validator: MultiValidator([
                                      MinLengthValidator(1,
                                          errorText: "Please enter password")
                                    ]),
                                  ),
                                  SizedBox(
                                    height: sizeUtils.getScreenHeight(context) *
                                        0.02,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Forgot password ?",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      if (widget.formKey.currentState!
                                          .validate()) {
                                        login();
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          isLoading
                                              ? Row(
                                                  children: [
                                                    SizedBox(
                                                      width: sizeUtils
                                                              .getScreenHeight(
                                                                  context) *
                                                          0.015,
                                                    ),
                                                    SizedBox(
                                                      height: sizeUtils
                                                              .getScreenHeight(
                                                                  context) *
                                                          0.015,
                                                      width: sizeUtils
                                                              .getScreenHeight(
                                                                  context) *
                                                          0.015,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    color: Colors.deepOrangeAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
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
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: SvgPicture.asset(
                          googlePlusLogo,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SvgPicture.asset(
                        facebookPlusLogo,
                        width: 50,
                        height: 50,
                      ),
                      SvgPicture.asset(
                        twitterLogo,
                        width: 50,
                        height: 50,
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

  login() async {
    showLoader();
    var db = EmployeeDatabase.instance;
    var data = await db.loginEmployee(emailController.text.trim().toLowerCase(),
        passwordController.text.trim()).catchError((onError){
      if(onError is! Exception){
        Fluttertoast.showToast(
          msg: onError,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          toastLength: Toast.LENGTH_LONG,
        );
      }
      hideLoader();
    });
    if(data!=null){
      Fluttertoast.showToast(
        msg: "Welcome",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_LONG,
      );
      var instance = SharedPreferenceService.instance;
      await instance.setEmployeeId(data);
      await instance.setLoggedIn();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()), (route) => false);
    }
    hideLoader();
  }

  showLoader() {
    setState(() {
      isLoading = true;
    });
  }

  hideLoader() {
    setState(() {
      isLoading = false;
    });
  }
}
