import 'package:flutter/cupertino.dart';

class SizeUtils{

  double screenHeight = 0.0;
  double screenWidth = 0.0;

  SizeUtils._init();

  factory SizeUtils.initialise(){
    return SizeUtils._init()
      ..screenHeight=0.0
      ..screenWidth=0.0;
  }

  double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

}