import 'package:employee_registration_example/app/constants/image_constants.dart';
import 'package:employee_registration_example/app/models/employee_data_models.dart';
import 'package:employee_registration_example/app/services/db_services/employee_database.dart';
import 'package:employee_registration_example/app/services/shared_preference_services.dart';
import 'package:employee_registration_example/components/screen/dashboard_screen.dart';
import 'package:employee_registration_example/components/utills/painter/round_circle_background.dart';
import 'package:employee_registration_example/components/utills/widgets/custom_tetxfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../app/utills/size_utills.dart';

class RegistrationScreen extends StatefulWidget {
  final Function navigateToRegistration;
  final GlobalKey<FormState> formKey;

  const RegistrationScreen(
      {Key? key, required this.navigateToRegistration, required this.formKey})
      : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var sizeUtils = SizeUtils.initialise();

  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var mobNoController = TextEditingController();
  var addressController = TextEditingController();
  var stateController = TextEditingController();
  var countryController = TextEditingController();
  var pincodeController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cPasswordController = TextEditingController();

  var nameFocusNode = FocusNode();
  var ageFocusNode = FocusNode();
  var mobNoFocusNode = FocusNode();
  var addressFocusNode = FocusNode();
  var stateFocusNode = FocusNode();
  var countryFocusNode = FocusNode();
  var pincodeFocusNode = FocusNode();
  var emailFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();
  var cPasswordFocusNode = FocusNode();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: widget.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.black38,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height:
                                    sizeUtils.getScreenHeight(context) * 0.4,
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomTextField(
                                          controller: nameController,
                                          focusNode: nameFocusNode,
                                          hintText: "Name",
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText:
                                                    "Please enter password")
                                          ]),
                                          suffixIcon: Icons.person,
                                          inputAction: TextInputAction.next,
                                          inputType: TextInputType.name,
                                        ),
                                        CustomTextField(
                                          controller: ageController,
                                          focusNode: ageFocusNode,
                                          hintText: "Age",
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText: "Please enter name")
                                          ]),
                                          suffixIcon:
                                              Icons.calendar_month_outlined,
                                          inputAction: TextInputAction.next,
                                          inputType: TextInputType.number,
                                        ),
                                        CustomTextField(
                                          controller: mobNoController,
                                          focusNode: mobNoFocusNode,
                                          hintText: "Mobile number",
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText: "Please enter phone"),
                                            MaxLengthValidator(10,
                                                errorText:
                                                    "Please enter valid pincode")
                                          ]),
                                          maxLength: 10,
                                          suffixIcon:
                                              Icons.phone_android_outlined,
                                          inputAction: TextInputAction.next,
                                          inputType: TextInputType.phone,
                                        ),
                                        CustomTextField(
                                          controller: emailController,
                                          focusNode: emailFocusNode,
                                          hintText: "Email",
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText: "Please enter email"),
                                            EmailValidator(
                                                errorText:
                                                    "Please enter valid email")
                                          ]),
                                          suffixIcon: Icons.email,
                                          inputAction: TextInputAction.next,
                                          inputType: TextInputType.emailAddress,
                                        ),
                                        CustomTextField(
                                          controller: addressController,
                                          focusNode: addressFocusNode,
                                          hintText: "Address Line 1",
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText: "Please enter address")
                                          ]),
                                          suffixIcon: Icons.place_rounded,
                                          inputAction: TextInputAction.next,
                                          maxLines: 3,
                                          inputType: TextInputType.streetAddress,
                                        ),
                                        CustomTextField(
                                          controller: stateController,
                                          focusNode: stateFocusNode,
                                          hintText: "State",
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText: "Please enter state")
                                          ]),
                                          suffixIcon: Icons.place_rounded,
                                          inputAction: TextInputAction.next,
                                          inputType: TextInputType.text,
                                        ),
                                        CustomTextField(
                                          controller: countryController,
                                          focusNode: countryFocusNode,
                                          hintText: "Country",
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText: "Please enter country")
                                          ]),
                                          suffixIcon: Icons.place_rounded,
                                          inputAction: TextInputAction.next,
                                          inputType: TextInputType.text,
                                        ),
                                        CustomTextField(
                                          controller: pincodeController,
                                          focusNode: pincodeFocusNode,
                                          hintText: "Pincode",
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText:
                                                    "Please enter pincode"),
                                            MaxLengthValidator(6,
                                                errorText:
                                                    "Please enter valid pincode")
                                          ]),
                                          maxLength: 6,
                                          suffixIcon: Icons.place_rounded,
                                          inputAction: TextInputAction.next,
                                          inputType: TextInputType.number,
                                        ),
                                        CustomTextField(
                                          controller: passwordController,
                                          focusNode: passwordFocusNode,
                                          hintText: "Password",
                                          validator: MultiValidator([
                                            MinLengthValidator(1,
                                                errorText:
                                                    "Please enter password")
                                          ]),
                                          suffixIcon: Icons.settings,
                                          inputAction: TextInputAction.next,
                                          inputType:
                                              TextInputType.visiblePassword,
                                        ),
                                        CustomTextField(
                                          controller: cPasswordController,
                                          focusNode: cPasswordFocusNode,
                                          hintText: "Confirm Password",
                                          validator: MultiValidator([
                                            PatternValidator(
                                                passwordController.text,
                                                errorText:
                                                    "Please same as password",
                                                caseSensitive: true)
                                          ]),
                                          suffixIcon: Icons.settings,
                                          inputAction: TextInputAction.done,
                                          inputType:
                                              TextInputType.visiblePassword,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      if (widget.formKey.currentState!
                                          .validate()) {
                                        register();
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Sign up",
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepOrangeAccent),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_downward_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                clearForm();
                                FocusScope.of(context).unfocus();
                                widget.navigateToRegistration();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  clearForm() {
    nameController.text = "";
    ageController.text = "";
    mobNoController.text = "";
    emailController.text = "";
    addressController.text = "";
    countryController.text = "";
    stateController.text = "";
    passwordController.text = "";
    pincodeController.text = "";
  }

  register() async {
    EmployeeData employeeData = EmployeeData(
      name: nameController.text.trim().toString(),
      age: int.parse(ageController.text.trim().toString()),
      mobileNumber: mobNoController.text.trim().toString(),
      email: emailController.text.trim().toString(),
      address: addressController.text.trim().toString(),
      country: countryController.text.trim().toString(),
      state: stateController.text.trim().toString(),
      password: passwordController.text.trim().toString(),
      pincode: pincodeController.text.trim().toString(),
      createdDate: DateTime.now().toIso8601String(),
    );

    final db = EmployeeDatabase.instance;
    var data = await db.registerEmployee(employeeData).catchError((onError) {
      if (onError is! Exception) {
        Fluttertoast.showToast(
          msg: onError,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          toastLength: Toast.LENGTH_LONG,
        );
      }
      hideLoader();
    });
    if (data != null) {
      Fluttertoast.showToast(
        msg: "Registered",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_LONG,
      );
      var instance = SharedPreferenceService.instance;
      await instance.setEmployeeId(data.id!);
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
