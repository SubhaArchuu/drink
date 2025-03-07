import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../common/strings.dart';
import '../../widgets/appbar.dart';

class ProfileScreen extends StatelessWidget {

  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.flag, "title": "My Primary Goal", "subtitle": "Save Money"},
    {
      "icon": Icons.track_changes_sharp,
      "title": "My Current Plan",
      "subtitle": "Keep rack of drinks"
    },
    {
      "icon": Icons.wine_bar_sharp,
      "title": "My Usual Drink ",
      "subtitle": "Beer, Medium"
    },
    {
      "icon": Icons.add_business,
      "title": "My Regular Drink Counts",
      "subtitle": "8 drinks"
    },
    {
      "icon": Icons.calendar_month_outlined,
      "title": "My Drinking Pattern",
      "subtitle": "Weekly"
    },
    {
      "icon": Icons.call,
      "title": "My Emergency Contact",
      "subtitle": "George Smith"
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme
        .of(context)
        .brightness == Brightness.dark;
    //backgroundColor: isDarkMode ? Colors.black87 : Colors.white,
    return
      AppbarWidget(
        title: Strings.dashboard_screen,
        search: false,
        profile: false,
        child:
        Column(
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.black54 : Colors.white,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/user_profile.png"),
                    radius: 40,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Johnathan Smith",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade600,
                        ),
                      ),
                      Text(
                        "john1992@domain.com",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.settings, color: Colors.grey.shade600),
                ],
              ),
            ),

            //  Divider(thickness: 1),

            // Animated List Items
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue.shade900, Colors.deepPurple.shade900],
                  ),
                ),
                child: AnimationLimiter(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: Duration(milliseconds: 600),
                        child: ScaleAnimation(
                          scale: 0.9,
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    menuItems[index]["icon"],
                                    color: Colors.blue.shade600,
                                  ),
                                  title: Text(
                                    menuItems[index]["title"],
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                  subtitle: Text(
                                    menuItems[index]["subtitle"],
                                    style: TextStyle(fontSize: 16,
                                        color: Colors.grey.shade600),
                                  ),
                                  trailing: Icon(Icons.edit_sharp, size: 16,
                                      color: Colors.grey.shade600),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
