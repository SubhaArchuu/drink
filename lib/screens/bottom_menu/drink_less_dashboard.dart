import 'dart:ui';
import 'package:drink_control/common/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../bloc/drink_counter_bloc/drink_counter_bloc.dart';
import '../../widgets/action_grid.dart';
import '../../widgets/appbar.dart';
import '../../widgets/progress_widget.dart';

class DrinkLessDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        AppbarWidget(
          title: Strings.dashboard_screen,
          search: true,
          profile: true,
          child: Stack(
            children: [
          Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade900, Colors.deepPurple.shade900],
          ),
                ),
              ),

              BlocBuilder<DrinkCounterBloc, DrinkCounterState>(
              builder: (context, state) {
                double progress = (state.count / 10).clamp(0.0, 1.0); // dynamic progress
              return
              SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(height: 10),

                // Progress Indicator
                ProgressIndicatorWidget(progress: progress),

              SizedBox(height: 20),

              // Bar Chart
                _barChart(),

              SizedBox(height: 20),

              // Drink Counter with BLoC

              _drinkCounter(),

              SizedBox(height: 20),

              // Action Grid
                _glassContainer(child: ActionGrid()),
              //_actionGrid(),

              SizedBox(height: 20),
              ],
              ),
              );
              }
              )
          ]
          ),
        );


  }


  // Bar Chart
  Widget _barChart() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
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
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 30),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri"];
                  return Text(days[value.toInt()], style: TextStyle(fontSize: 12,color: Colors.white));
                },
              ),
            ),
          ),
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
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.wine_bar_rounded, size: 30, color: Colors.blue),
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

  Widget _glassContainer({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // Blur effect
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1), // Transparent white with opacity
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)), // Subtle border
            ),
            child: child,
          ),
        ),
      ),
    );
  }

}
