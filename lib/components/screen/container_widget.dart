import 'package:employee_registration_example/components/screen/login_screen.dart';
import 'package:employee_registration_example/components/screen/registration_screen.dart';
import 'package:employee_registration_example/components/utills/painter/round_circle_background.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  final pageController = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();
  }

  final loginFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Stack(
            children: [
              RoundCircleBackground(),
            ],
          ),
          PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            allowImplicitScrolling: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              RegistrationScreen(
                navigateToRegistration: () {
                  pageController.animateToPage(1,
                      curve: Curves.linear,
                      duration: Duration(milliseconds: 200));
                },
                formKey: signUpFormKey,
              ),
              LoginScreen(
                navigateToRegistration: () {
                  pageController.animateToPage(
                    0,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 200),
                  );
                },
                formKey: loginFormKey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
