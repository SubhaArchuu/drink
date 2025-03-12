import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class MyProfileApp extends StatefulWidget {
  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp>{
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: Colors.white ,
       /*appBar: AppBar(title: Text("Profile", style: TextStyle(color: Colors.white),),
         backgroundColor: Color(0xFF5B3D91) ,
       actions: [
     
         IconButton(
           icon: CircleAvatar(
             child: SvgPicture.asset('assets/images/svg/Asset_1.svg' ,
               ),
           ), onPressed: () {  },
         )
       ],
         leading:  IconButton(
           color: Colors.white,
               icon: Icon(Icons.menu),
               onPressed: () {  },
             ),
       ),*/
       body: SingleChildScrollView(
         child: Column(
           //crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Stack(
               clipBehavior: Clip.none,
               children: [
                 SizedBox(
                   height: 150,
                   width: double.infinity,
                   child: CustomPaint(
                     painter: CurvedPainter(),
                     child: Padding(
                       padding: const EdgeInsets.only( left: 20, right: 20),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Icon(Icons.menu, color: Colors.white, size: 28),
                           CircleAvatar(
                             radius: 20,
                             child: SvgPicture.asset("assets/images/svg/Asset_1.svg"),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                 // for wavy background
                 /*ClipPath(
                   clipper: WaveClipperTwo(flip: true),
                   child: Container(
                     height: 100,
                     decoration: const BoxDecoration(
                       color: Colors.deepPurple,
                     ),
                   ),
                 ),*/
                 Positioned(
                   top: 60,
                   left: 0,
                   right: 0,
                   child: CircleAvatar(
                     radius: 70,
                     backgroundColor: Colors.white,
                     child:
                       CircleAvatar(radius: 65,
                           child: SvgPicture.asset('assets/images/svg/Asset_1.svg'))
                   ),
                 ),
     
               ],
             ),
     
             SizedBox(height: 70),
             Row(
               spacing: 5,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Column(
                   children: [
                     IconButton(
                         onPressed: () {},
                         icon: SvgPicture.asset('assets/images/svg/Icon_1.svg',)),
                      SizedBox(height: 5),
                     Text(
                       "Profile Verified",
                       style:  GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black),
                     ),
                   ],
                 ),
                  SizedBox(width: 20),
                 Column(
                   children: [
                     IconButton(
                         onPressed: () {},
                         icon: SvgPicture.asset('assets/images/svg/Icon_2.svg',)),
                     const SizedBox(height: 5),
                     Text(
                       "Profile Completed",
                       style:  GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black),
                     ),
                   ],
                 ),
                  SizedBox(width: 20),
                 Column(
                   children: [
                     IconButton(
                         onPressed: () {},
                         icon: SvgPicture.asset('assets/images/svg/Icon_3.svg' ,)),
                     const SizedBox(height: 5),
                     Text(
                       "Speciality",
                       style:  GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black),
                     ),
                   ],
                 )
               ],
             ),
             SizedBox(height: 20,),
             Align(
               alignment: Alignment.centerLeft,
                 child: Padding(
                   padding: EdgeInsets.only(left: 20),
                     child: Text("QUICK ACCESS",style: GoogleFonts.lato(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w500,),))),
             SizedBox(height: 10,),
             GestureDetector(
               onTap: ()
               {},
               child: Padding(
                 padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10,bottom: 10),
                 child: DottedBorder(
                   color: Colors.deepPurple.shade200,
                   strokeWidth: 1.5,
                   dashPattern: [6, 4], // [6, 3, 2, 3]
                   borderType: BorderType.RRect,
                   radius: const Radius.circular(20),
                   child: Container(
                    // width: 350,
                     padding: const EdgeInsets.symmetric(vertical: 12),
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.transparent),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(Icons.share,color: Colors.deepPurple.shade500, size: 18, ),
                         const SizedBox(width: 8),
                         Text(
                           "Share your Profile",
                           style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.deepPurple.shade500),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
             GestureDetector(
               onTap: ()
               {},
               child: Padding(
                 padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10,bottom: 10),
                 child: DottedBorder(
                   color: Colors.deepPurple.shade200,
                   strokeWidth: 1.5,
                   dashPattern: [6, 4], // [6, 3, 2, 3]
                   borderType: BorderType.RRect,
                   radius: const Radius.circular(20),
                   child: Container(
                     // width: 350,
                     padding: const EdgeInsets.symmetric(vertical: 12),
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.transparent),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(Icons.copy,color: Colors.deepPurple.shade500, size: 18, ),
                         const SizedBox(width: 8),
                         Text(
                           "Copy Profile Url",
                           style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.deepPurple.shade500),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
             SvgPicture.asset('assets/images/svg/Asset_1.svg'),
             GestureDetector(
               onTap: ()
               {},
               child: Padding(
                 padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10,bottom: 10),
                 child: DottedBorder(
                   color: Colors.deepPurple.shade200,
                   strokeWidth: 1.5,
                   dashPattern: [6, 4], // [6, 3, 2, 3]
                   borderType: BorderType.RRect,
                   radius: const Radius.circular(20),
                   child: Container(
                     // width: 350,
                     padding: const EdgeInsets.symmetric(vertical: 12),
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.transparent),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(Icons.visibility,color: Colors.deepPurple.shade500, size: 18, ),
                         const SizedBox(width: 8),
                         Text(
                           "Profile View",
                           style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.deepPurple.shade500),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
     
             SizedBox(height: 10,),
     
           ],
         ),
       )
     ),
   );
  }
}
class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFF5B3D91); // Purple shade

    Path path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
      size.width * 0.2, size.height * 1.5,
      size.width * 0.5, size.height * 0.9,
    );
    path.quadraticBezierTo(
      size.width * 0.7, size.height * 0.5,
      size.width, size.height * 0.85,
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



