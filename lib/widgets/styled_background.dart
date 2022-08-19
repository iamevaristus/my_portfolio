import 'package:flutter/material.dart';
import 'package:website/config/colors.dart';

class StyledBackground extends StatelessWidget {
  const StyledBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 700,
      color: whiteColor,
      child: ClipPath(
        clipper: WavyBg(),
        child: Container(
          height: 500,
          width: 500,
          color: mainColor,
        ),
      ),
    );
  }
}

class Wavy extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();

    //Point One = 0
    path.lineTo(0, height); //Point 2
    path.quadraticBezierTo(
      width * 0.5,
      height - 100,
      width,
      height
    );
    path.lineTo(width, height); //Point 4
    path.lineTo(width, 0); //Point 5
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}

class WavyBg extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path_0 = Path();

    //Point One = 0
    path_0.moveTo(0,size.height*0.2000000);
    path_0.lineTo(size.width*0.03333333,size.height*0.3165625);
    path_0.cubicTo(size.width*0.06666667,size.height*0.4343750,size.width*0.1333333,size.height*0.6656250,size.width*0.2000000,size.height*0.7665625);
    path_0.cubicTo(size.width*0.2666667,size.height*0.8656250,size.width*0.3333333,size.height*0.8343750,size.width*0.4000000,size.height*0.7665625);
    path_0.cubicTo(size.width*0.4666667,size.height*0.7000000,size.width*0.5333333,size.height*0.6000000,size.width*0.6000000,size.height*0.6165625);
    path_0.cubicTo(size.width*0.6666667,size.height*0.6343750,size.width*0.7333333,size.height*0.7656250,size.width*0.8000000,size.height*0.7165625);
    path_0.cubicTo(size.width*0.8666667,size.height*0.6656250,size.width*0.9333333,size.height*0.4343750,size.width*0.9666667,size.height*0.3165625);
    path_0.lineTo(size.width,size.height*0.2000000);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width*0.9666667,size.height);
    path_0.cubicTo(size.width*0.9333333,size.height,size.width*0.8666667,size.height,size.width*0.8000000,size.height);
    path_0.cubicTo(size.width*0.7333333,size.height,size.width*0.6666667,size.height,size.width*0.6000000,size.height);
    path_0.cubicTo(size.width*0.5333333,size.height,size.width*0.4666667,size.height,size.width*0.4000000,size.height);
    path_0.cubicTo(size.width*0.3333333,size.height,size.width*0.2666667,size.height,size.width*0.2000000,size.height);
    path_0.cubicTo(size.width*0.1333333,size.height,size.width*0.06666667,size.height,size.width*0.03333333,size.height);
    path_0.lineTo(0,size.height);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}

class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.2750000,size.height*0.0400000);
    path0.cubicTo(size.width*0.1375000,size.height*0.0895000,size.width*0.1475000,size.height*0.1060000,size.width*0.0875000,size.height*0.2620000);
    path0.cubicTo(size.width*0.0643750,size.height*0.4625000,size.width*0.1531250,size.height*0.3755000,size.width*0.1875000,size.height*0.5940000);
    path0.cubicTo(size.width*0.1965625,size.height*0.7555000,size.width*0.2934375,size.height*0.6325000,size.width*0.3262500,size.height*0.7360000);
    path0.cubicTo(size.width*0.3706250,size.height*0.8945000,size.width*0.3975000,size.height*0.7975000,size.width*0.4987500,size.height*0.8800000);
    path0.cubicTo(size.width*0.5296875,size.height*0.9605000,size.width*0.6253125,size.height*0.9720000,size.width*0.7000000,size.height*0.9980000);
    path0.cubicTo(size.width*0.8325000,size.height*0.9980000,size.width*0.8812500,size.height*0.9280000,size.width*0.9275000,size.height*0.9000000);
    path0.cubicTo(size.width*1.0100000,size.height*0.8585000,size.width*0.9237500,size.height*0.4515000,size.width*0.9437500,size.height*0.3020000);
    path0.cubicTo(size.width*0.9259375,size.height*0.0275000,size.width*0.8362500,size.height*0.0245000,size.width*0.7262500,size.height*0.0180000);
    path0.cubicTo(size.width*0.5340625,size.height*0.0700000,size.width*0.5696875,size.height*0.0940000,size.width*0.4612500,size.height*0.1120000);
    path0.cubicTo(size.width*0.3275000,size.height*0.1370000,size.width*0.4187500,size.height*0.0165000,size.width*0.2750000,size.height*0.0400000);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
