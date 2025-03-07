A "Drink Control" app in Flutter should have an engaging yet simple UI that helps users track and reduce their alcohol consumption. 
Dependencies (Add to pubspec.yaml)
flutter_bloc: ^8.1.3 # For State Management(bloc)
percent_indicator: ^4.2.4 # For Circular Progress Bar
fl_chart: ^0.63.0 # For Bar Chart
table_calendar: ^3.0.9 # For Calendar View

// refer pubspec.yaml for remaining dependencies

Screens & Features
1. Home Screen (DrinkLessDashboard.dart)
which includes:
•	Circular Progress Bar showing overall progress - dynamic progress.
•	 Bar Chart to track the last 5 days' drinking history.
•	 Increment & Decrement buttons for drink tracking - using BLOC sate management.
•	 Action Buttons (Add Goal, Training, Reflect, Helpline, SOS) - screen navigation
•	 Bottom Navigation Bar for easy navigation.

Bottom Navigation - using BLoC
To enable screen navigation in your Drink Control app, we will use Navigator with named routes.
it contains 5 screens: Home, Modules, Drink Buddy, Calendar, and Profile.
•	Navigation is managed using BLoC (BottomNavigationBloc)
•	Drink count is managed using BLoC (DrinkCounterBloc)
•	MultiBlocProvider is used to handle multiple states
•	State changes are managed efficiently with BlocBuilder

2. Module Screen (ModuleScreen.dart)
    Gridview $ Listview with animations
3. Drink Buddy Screen (DrinkBuddyScreen.dart)
    Like chatbot
4. Calendar Screen (CalendarScreen.dart)
    TableCalendar with drink log - using bloc
5. Profile screen (ProfileScreen.dart)
    showing profile data