import 'package:drink_control/screens/BottomNavScreen.dart';
import 'package:drink_control/screens/bottom_menu/calendar.dart';
import 'package:drink_control/screens/bottom_menu/drink_buddy.dart';
import 'package:drink_control/screens/bottom_menu/modules.dart';
import 'package:drink_control/screens/bottom_menu/profile.dart';
import 'package:drink_control/screens/bottom_menu/drink_less_dashboard.dart';
import 'package:drink_control/screens/grid_screens/add_goal.dart';
import 'package:drink_control/screens/grid_screens/helpline.dart';
import 'package:drink_control/screens/grid_screens/progress.dart';
import 'package:drink_control/screens/grid_screens/reflect.dart';
import 'package:drink_control/screens/grid_screens/sos.dart';
import 'package:drink_control/screens/grid_screens/training.dart';
import 'package:drink_control/screens/splash_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

import 'bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'bloc/calendar_bloc/calendar_bloc.dart';
import 'bloc/chat_bloc/chat_bloc.dart';
import 'bloc/drink_counter_bloc.dart';
import 'bloc/drink_counter_bloc/drink_counter_bloc.dart';
import 'bloc/module_bloc/module_bloc.dart';

void main() {
  runApp(const DrinkControlApp());
}

class DrinkControlApp extends StatelessWidget {
  const DrinkControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
    return
    MultiBlocProvider(
    providers: [
    BlocProvider(create: (_) => BottomNavigationBloc()),
    BlocProvider(create: (_) => DrinkCounterBloc()),
    BlocProvider(create: (_) => CalendarBloc()),
    BlocProvider(create: (_) => ChatBloc()),
    BlocProvider(create: (_) => ModuleBloc()),
    ],
    child:
    MaterialApp(
    title: 'Drink Control',
    theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
    '/': (context) => SplashScreen(),
    '/home': (context) => BottomNavScreen(),
    "/addGoal": (context) => AddGoalScreen(),
    "/training": (context) => TrainingScreen(),
    "/reflect": (context) => ReflectScreen(),
    "/progress": (context) => ProgressScreen(),
    "/helpline": (context) => HelplineScreen(),
    "/sos": (context) => SosScreen(),
    },
    )
    );
    });
  }
}








