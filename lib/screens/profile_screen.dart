import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MyProfileApp extends StatefulWidget {
  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white ,
     appBar: AppBar(title: Text("Profile", style: TextStyle(color: Colors.white),),
       backgroundColor: Colors.deepPurple ,
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
     ),
     body: SingleChildScrollView(
       child: Column(
         //crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Stack(
             clipBehavior: Clip.none,
             children: [
               Container(
                 height: 100,
                 decoration: const BoxDecoration(
                   color: Colors.deepPurple,
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(50),
                     bottomRight: Radius.circular(50),
                   ),
                 ),
               ),
               Positioned(
                 top: 40,
                 left: 0,
                 right: 0,
                 child: CircleAvatar(
                   radius: 60,
                   backgroundColor: Colors.white,
                   child:
                     CircleAvatar(radius: 55,
                         child: SvgPicture.asset('assets/images/svg/Asset_1.svg'))
                 ),
               ),

             ],
           ),


           SizedBox(height: 60),
           Row(
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
                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),
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
                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),
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
                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),
                   ),
                 ],
               )
             ],
           ),
           SizedBox(height: 10,),
           Align(
             alignment: Alignment.centerLeft,
               child: Padding(
                 padding: EdgeInsets.all(10),
                   child: Text("QUICK ACCESS",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w200,),))),
           SizedBox(height: 10,),
           Padding(
             padding: EdgeInsets.only(left: 25.0,right: 25.0,),
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40),
                   padding: EdgeInsets.only(left: 20.0,right: 20.0),
                 backgroundColor: Colors.deepPurple
               ),
                 onPressed: ()
                 {},
               child: ListTile(leading: Icon(Icons.share,color: Colors.grey),
                 title: Text("Share your Profile",style: TextStyle(color: Colors.grey,))
               )),
           ),
           SizedBox(height: 10,),
           Padding(
             padding: EdgeInsets.only(left: 25.0,right: 25.0,),
             child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                     minimumSize: Size(100, 40),
                     padding: EdgeInsets.only(left: 20.0,right: 20.0),
                     backgroundColor: Colors.deepPurple
                 ),
                 onPressed: ()
             {},

                 child: Center(
                   child: ListTile(leading: Icon(Icons.copy,color: Colors.grey),
                       title: Text("Copy Profile Url",style: TextStyle(color: Colors.grey,))
                   ),
                 )),
           ),

           SvgPicture.asset('assets/images/svg/Asset_1.svg'),
           SizedBox(height: 10,),
         Padding(
             padding: EdgeInsets.only(left: 25.0,right: 25.0,),
             child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                     minimumSize: Size(100, 40),
                     padding: EdgeInsets.only(left: 20.0,right: 20.0),
                     backgroundColor: Colors.deepPurple
                 ),
                 onPressed: (){},
                 child: ListTile(leading: Icon(Icons.View,color: Colors.grey),
                     title: Text("Profile View",style: TextStyle(color: Colors.grey,))
                 )),
           ),
         ],
       ),
     )
   );
  }
}



