import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   final Path path = Path();
   path.lineTo(0.0, size.height);

   var firstEndPoint = Offset(size.width * .6, size.height - 35.0); //จุด2
   var firstControlPoint = Offset(size.width * .3, size.height - 65.0); //จุด1

   path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

   var secondEndPoint = Offset(size.width +30,size.height - 90.0);
   var secondControlPoint = Offset(size.width *.9, size.height - 20);
   path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
//
//   var thirdEndPoint = Offset(size.width,size.height -50.0);
//   var thirdControlPoint = Offset(size.width * .40, size.height - 150);
//   path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);
   path.lineTo(size.width, 0.0);
   path.close();
   return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    
    return true;
  }

}