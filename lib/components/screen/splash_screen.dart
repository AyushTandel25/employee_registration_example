import 'package:employee_registration_example/components/screen/container_widget.dart';
import 'package:employee_registration_example/components/screen/dashboard_screen.dart';
import 'package:employee_registration_example/components/utills/painter/round_circle_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/constants/image_constants.dart';
import '../../app/services/shared_preference_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    navigation();
    super.initState();
  }

  navigation() async{
    await Future.delayed(Duration(seconds: 1),() async {
      var sharedPref = SharedPreferenceService.instance;
      var isLogin = await sharedPref.isLoggedIn();
      if(isLogin){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()), (route) => false);
      }
      else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ContainerWidget()), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RoundCircleBackground(),
          Center(
            child: SvgPicture.asset(
              googlePlusLogo,
              width: 150,
              height: 150,
            ),
          )
        ],
      ),
    );
  }
}
