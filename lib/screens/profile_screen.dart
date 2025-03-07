import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/asset_image_path.dart';

class MyProfileApp extends StatefulWidget {
  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.deepPurple ,
     appBar: AppBar(title: Text("Profile"),
       backgroundColor: Colors.deepPurple ,
     actions: [

       IconButton(
         icon: SvgPicture.asset('assets/images/svg/Icon_1.svg',color: Colors.black ,
           ), onPressed: () {  },
       )
     ],
       leading: IconButton(
           onPressed: ()
           {

           },
           icon: SvgPicture.asset('assets/images/svg/Icon_1.svg',color: Colors.black ,)),
     ),
     body: SingleChildScrollView(
       child: Column(
         //crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Stack(
             clipBehavior: Clip.none,
             children: [
               Container(
                 height: 200,
                 decoration: const BoxDecoration(
                   color: Color(0xFF4A377C),
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(50),
                     bottomRight: Radius.circular(50),
                   ),
                 ),
               ),
               Positioned(
                 top: 140,
                 left: 0,
                 right: 0,
                 child: CircleAvatar(
                   radius: 60,
                   backgroundColor: Colors.white,
                   child: CircleAvatar(
                     radius: 55,
                     backgroundImage: AssetImage("assets/images/user_profile.png")
                     ),
                   ),
                 ),

               Positioned(
                 top: 40,
                 right: 20,
                 child: CircleAvatar(
                   radius: 20,
                   backgroundImage: AssetImage("assets/images/user_profile.png")
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
                       icon: SvgPicture.asset('assets/images/svg/Icon_1.svg',color: Colors.black ,)),
                    SizedBox(height: 5),
                   Text(
                     "Profile Verified",
                     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                   ),
                 ],
               ),
                SizedBox(width: 20),
               Column(
                 children: [
                   IconButton(
                       onPressed: () {},
                       icon: SvgPicture.asset('assets/images/svg/Icon_2.svg',color: Colors.black ,)),
                   const SizedBox(height: 5),
                   Text(
                     "Profile Completed",
                     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                   ),
                 ],
               ),
                SizedBox(width: 20),
               Column(
                 children: [
                   IconButton(
                       onPressed: () {},
                       icon: SvgPicture.asset('assets/images/svg/Icon_3.svg',color: Colors.black ,)),
                   const SizedBox(height: 5),
                   Text(
                     "Speciality",
                     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                   ),
                 ],
               )
             ],
           ),
           SizedBox(height: 10,),
           Text("QUICK ACCESS"),
           SizedBox(height: 10,),
           ElevatedButton(onPressed: ()
               {},
             child: ListTile(leading: Icon(Icons.share,color: Colors.grey),
               title: Text("Share your Profile",style: TextStyle(color: Colors.grey,))
             )),
           SizedBox(height: 10,),
           ElevatedButton(onPressed: ()
           {},
               child: ListTile(leading: Icon(Icons.copy,color: Colors.grey),
                   title: Text("Copy Profile Url",style: TextStyle(color: Colors.grey,))
               )),

           SizedBox(
             height: 120,
             child: SvgPicture.asset('assets/images/svg/Icon_1.svg',color: Colors.black ,
             ),
           ),
           SizedBox(height: 10,),
           ElevatedButton(onPressed: ()
           {},
               child: ListTile(leading: Icon(Icons.copy,color: Colors.grey),
                   title: Text("Copy Profile Url",style: TextStyle(color: Colors.grey,))
               )),
         ],
       ),
     ),
   );
  }
}



