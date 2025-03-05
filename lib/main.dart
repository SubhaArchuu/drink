import 'package:drink_control/screens/BottomNavScreen.dart';
import 'package:drink_control/screens/bottom_menu/calendar.dart';
import 'package:drink_control/screens/bottom_menu/drink_buddy.dart';
import 'package:drink_control/screens/bottom_menu/modules.dart';
import 'package:drink_control/screens/bottom_menu/profile.dart';
import 'package:drink_control/screens/drink_less_dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

import 'bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'bloc/drink_counter_bloc.dart';
import 'bloc/drink_counter_bloc/drink_counter_bloc.dart';

void main() {
  runApp(const DrinkControlApp());
}

class DrinkControlApp extends StatelessWidget {
  const DrinkControlApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
        BlocProvider(create: (_) => BottomNavigationBloc()),
    BlocProvider(create: (_) => DrinkCounterBloc()),
    ],
    child:
      MaterialApp(
      title: 'Drink Control',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
        debugShowCheckedModeBanner: false,
       /* initialRoute: '/',
        routes: {
          '/': (context) => DrinkLessDashboard(),
          '/modules': (context) => ModulesScreen(),
          '/drinkBuddy': (context) => DrinkBuddyScreen(),
          '/calendar': (context) => CalendarScreen(),
          '/profile': (context) => ProfileScreen(),
        },*/
      home: BottomNavScreen()
      )
    );
  }
}








