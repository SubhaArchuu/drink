import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import '../bloc/drink_counter_bloc/drink_counter_bloc.dart';


class DrinkLessDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: Text("Drink Less"),
          backgroundColor: Colors.blue.shade900,
          elevation: 0,
        ),
        body:
            BlocBuilder<DrinkCounterBloc, DrinkCounterState>(
            builder: (context, state) {
    return
    SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    SizedBox(height: 10),

    // Progress Indicator
    _progressIndicator(),

    SizedBox(height: 20),

    // Bar Chart
    _barChart(),

    SizedBox(height: 20),

    // Drink Counter with BLoC
    _drinkCounter(),

    SizedBox(height: 20),

    // Action Grid
    _actionGrid(),

    SizedBox(height: 20),
    ],
    ),
    );
    }
    )


        // Bottom Navigation Bar
      //  bottomNavigationBar: _bottomNavigation(),

    );
  }

  // Progress Indicator
  Widget _progressIndicator() {
    return Column(
      children: [
        Text("Plan Progress",
            style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
        Text("Drink less, Save Money", style: TextStyle(color: Colors.white70)),
        SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: CircularProgressIndicator(
                value: 0.87, // 87% progress
                strokeWidth: 10,
                backgroundColor: Colors.white24,
                color: Colors.greenAccent,
              ),
            ),
            Text("87%", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ],
    );
  }

  // Bar Chart
  Widget _barChart() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: BarChart(
        BarChartData(
          barGroups: [
            _barData(0, 10),
            _barData(1, 7),
            _barData(2, 9),
            _barData(3, 5),
            _barData(4, 6),
          ],
         /* titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true, reservedSize: 30),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (value) {
                List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri"];
                return days[value.toInt()];
              },
            ),
          ),*/
        ),
      ),
    );
  }

  BarChartGroupData _barData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y, color: Colors.blue, width: 20),
      ],
    );
  }

  // Increment/Decrement Drink Counter using BLoC
  Widget _drinkCounter() {
    return  BlocBuilder<DrinkCounterBloc, DrinkCounterState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.local_drink, size: 30, color: Colors.blue),
              IconButton(
                icon: Icon(Icons.remove_circle, size: 30, color: Colors.redAccent),
                onPressed: () {
                  context.read<DrinkCounterBloc>().add(DecrementDrink());
                },
              ),
              Text("${state.count}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.add_circle, size: 30, color: Colors.greenAccent),
                onPressed: () {
                  context.read<DrinkCounterBloc>().add(IncrementDrink());
                },
              ),
              Icon(Icons.settings, size: 30, color: Colors.grey),
            ],
          ),
        );
      },
    );
  }

  // Action Grid
  Widget _actionGrid() {
    List<Map<String, dynamic>> actions = [
      {"icon": Icons.flag, "label": "Add Goal"},
      {"icon": Icons.grain, "label": "My Training"},
      {"icon": Icons.lightbulb, "label": "Reflect"},
      {"icon": Icons.bar_chart, "label": "My Progress"},
      {"icon": Icons.phone, "label": "Helpline"},
      {"icon": Icons.sos, "label": "SOS", "color": Colors.redAccent},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: actions.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: actions[index]["color"] ?? Colors.blue,
                child: Icon(actions[index]["icon"], color: Colors.white, size: 30),
              ),
              SizedBox(height: 5),
              Text(actions[index]["label"], style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          );
        },
      ),
    );
  }

  /*// Bottom Navigation Bar
  Widget _bottomNavigation() {
    return BottomNavigationBar(
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentIndex,
      onTap: (index) {
        context.read<BottomNavigationBloc>().add(ChangeTabEvent(index));
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Modules"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "Drink Buddy"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Calendar"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }*/
}
