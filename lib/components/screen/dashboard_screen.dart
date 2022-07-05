import 'package:employee_registration_example/app/constants/image_constants.dart';
import 'package:employee_registration_example/app/services/db_services/employee_database.dart';
import 'package:employee_registration_example/app/services/shared_preference_services.dart';
import 'package:employee_registration_example/components/screen/container_widget.dart';
import 'package:employee_registration_example/components/utills/painter/round_circle_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../app/utills/size_utills.dart';
import '../utills/widgets/custom_tetxfield.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

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

  bool isLoading = true;

  @override
  void initState() {
    getEmployee();
    super.initState();
  }

  getEmployee() async{
    var db = EmployeeDatabase.instance;
    var sharedPref = SharedPreferenceService.instance;
    var id = await sharedPref.getEmployeeId();
    if(id!=null){
      await db.getEmployee(id).then((value){
        if(value!=null){
          nameController.text = value.name.toString();
          ageController.text = value.age.toString();
          emailController.text = value.email.toString();
          addressController.text = value.address.toString();
          stateController.text = value.state.toString();
          countryController.text = value.country.toString();
          pincodeController.text = value.pincode.toString();
          mobNoController.text = value.mobileNumber.toString();
        }
      }).catchError((onError){

      });
    }
    hideLoader();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(color: Colors.deepOrangeAccent,),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Stack(
              children: [
                RoundCircleBackground(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
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
                                    Icons.logout_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    showLoader();
                                    var sharedPref = SharedPreferenceService.instance;
                                    await sharedPref.clearReferences().then((value){
                                      hideLoader();
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ContainerWidget()), (route) => false);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.black38,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: sizeUtils.getScreenHeight(context) * 0.020,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                      isRoundBordered: true,
                                      isEnable: false,
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
                                      isRoundBordered: true,
                                      isEnable: false,
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
                                      isRoundBordered: true,
                                      isEnable: false,
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
                                      isRoundBordered: true,
                                      isEnable: false,
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
                                      isRoundBordered: true,
                                      isEnable: false,
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
                                      isRoundBordered: true,
                                      isEnable: false,
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
                                      isRoundBordered: true,
                                      isEnable: false,
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
                                      isRoundBordered: true,
                                      isEnable: false,
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
                                  ],
                                ),
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
          ],
        ),
      ),
    );
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
