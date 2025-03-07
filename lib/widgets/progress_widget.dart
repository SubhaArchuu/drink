import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double progress;

  const ProgressIndicatorWidget({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: progress),
                    duration: Duration(seconds: 1),
                    builder: (context, value, child) {
                      return CircularProgressIndicator(
                        value: value,
                        strokeWidth: 10,
                        backgroundColor: Colors.white24,
                        color: Colors.greenAccent,
                      );
                    },
                  ),
                ),
                Text(
                  "${(progress * 100).toInt()}%",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),


            const SizedBox(width: 16), // Space between progress bar and text

            // Text in the Center
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Plan Progress",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Drink less, Save Money",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(width: 16), // Space between text and icon

            // Icon on the Right
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                progress >= 1.0 ? Icons.check_circle : Icons.arrow_forward_ios_rounded,
                color: progress >= 1.0 ? Colors.greenAccent : Colors.white70,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
