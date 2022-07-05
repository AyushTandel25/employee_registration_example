import 'package:employee_registration_example/app/utills/size_utills.dart';
import 'package:flutter/material.dart';

class TopHalfCirclePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Colors.deepOrangeAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(0.0,0.0);
    path0.quadraticBezierTo(0.0,size.height*0.6666667,0.0,size.height*0.8333333);
    path0.quadraticBezierTo(size.width*0.6402500,size.height*1.15,size.width,size.height*0.6);
    path0.lineTo(size.width,0.0);
    path0.lineTo(0.0,0.0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class BottomHalfCirclePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Colors.deepOrangeAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width,0.0);
    path0.quadraticBezierTo(size.width*0.1653333,size.height*0.2518333,size.width*0.1666667,size.height*0.5000000);
    path0.quadraticBezierTo(size.width*0.1716667,size.height*0.7455000,size.width*0.6666667,size.height);
    path0.lineTo(size.width,size.height);
    path0.lineTo(size.width,0.0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class RoundCircleBackground extends StatefulWidget {
  const RoundCircleBackground({Key? key}) : super(key: key);

  @override
  State<RoundCircleBackground> createState() => _RoundCircleBackgroundState();
}

class _RoundCircleBackgroundState extends State<RoundCircleBackground> {

  var sizeUtil = SizeUtils.initialise();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.0,
          child: CustomPaint(
            size: Size(sizeUtil.getScreenWidth(context),sizeUtil.getScreenHeight(context) * 0.4),
            painter: TopHalfCirclePainter(),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: CustomPaint(
            size: Size(sizeUtil.getScreenWidth(context) * 0.35,sizeUtil.getScreenHeight(context) * 0.5),
            painter: BottomHalfCirclePainter(),
          ),
        )
      ],
    );
  }
}
