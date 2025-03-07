import 'package:flutter/material.dart';
import '../screens/grid_screens/add_goal.dart';
import '../screens/grid_screens/helpline.dart';
import '../screens/grid_screens/progress.dart';
import '../screens/grid_screens/reflect.dart';
import '../screens/grid_screens/sos.dart';
import '../screens/grid_screens/training.dart';

class ActionGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: actions.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return _buildAnimatedItem(context, actions[index]);
        },
      ),
    );
  }

  // List of action items with routes & colors
  final List<Map<String, dynamic>> actions = [
    {"icon": Icons.flag, "label": "Add Goal", "screen": AddGoalScreen()},
    {"icon": Icons.grain, "label": "My Training", "screen": TrainingScreen()},
    {"icon": Icons.lightbulb, "label": "Reflect", "screen": ReflectScreen()},
    {"icon": Icons.bar_chart, "label": "My Progress", "screen": ProgressScreen()},
    {"icon": Icons.phone, "label": "Helpline", "screen": HelplineScreen()},
    {"icon": Icons.sos, "label": "SOS", "color": Colors.redAccent, "screen": SosScreen()},
  ];

  // Animated Grid Item with Click Effect
  Widget _buildAnimatedItem(BuildContext context, Map<String, dynamic> action) {
    return GestureDetector(
      onTap: () {
        if (action["screen"] != null) {
          _navigateWithAnimation(context, action["screen"]); // Navigate with custom transition
        }
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1.0, end: 0.95),
        duration: Duration(milliseconds: 150),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: action["color"] ?? Colors.blue,
                  child: Icon(action["icon"], color: Colors.white, size: 32),
                ),
                SizedBox(height: 6),
                Text(
                  action["label"],
                  style: TextStyle(color: Colors.white, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Custom Page Transition Function
  void _navigateWithAnimation(BuildContext context, Widget page) {
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500), // Animation speed
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0); // Slide from right
        var end = Offset.zero;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var fadeTween = Tween(begin: 0.0, end: 1.0);

        return FadeTransition(
          opacity: animation.drive(fadeTween), // Smooth fade effect
          child: SlideTransition(position: animation.drive(tween), child: child),
        );
      },
    ));
  }
}
