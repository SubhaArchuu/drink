import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../bloc/calendar_bloc/calendar_bloc.dart';
import '../../common/strings.dart';
import '../../widgets/appbar.dart';


class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return
          AppbarWidget(
          title: Strings.calendar_screen,
            search: false,
            profile: false,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade900, Colors.deepPurple.shade900],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white],
                      ),
                    ),
                    child: TableCalendar(
                      // Calendar Header
                      headerStyle: HeaderStyle(
                        headerMargin: EdgeInsets.only(bottom: 16),
                        titleCentered: true,
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue.shade700, Colors.blue.shade400],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                         // borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        ),
                        leftChevronIcon: Flexible(child: Icon(Icons.chevron_left, size: 20, color: Colors.white)),
                        rightChevronIcon: Flexible(child: Icon(Icons.chevron_right, size: 20, color: Colors.white)),
                      ),

                      // Weekday and Weekend Text Styles
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.green.shade700, fontWeight: FontWeight.w600),
                        weekendStyle: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.w600),
                      ),

                      availableGestures: AvailableGestures.all,

                      focusedDay: state.selectedDay,
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),

                      selectedDayPredicate: (day) => isSameDay(state.selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        context.read<CalendarBloc>().add(DaySelected(selectedDay));
                      },

                      calendarBuilders: CalendarBuilders(
                        // Drink Count Marker on Top-Left
                        markerBuilder: (context, date, events) {
                          int? drinkCount = state.drinkLog[date];

                          if (drinkCount != null) {
                            return Align(
                              alignment: Alignment.topLeft, // Ensure correct positioning
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '$drinkCount',
                                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          }
                          return null;
                        },

                        defaultBuilder: (context, date, _) {
                          bool isToday = isSameDay(date, DateTime.now());
                          bool hasDrink = state.drinkLog.containsKey(date);

                          return Container(
                            margin: hasDrink ? EdgeInsets.all(4) : EdgeInsets.zero,
                            decoration: BoxDecoration(
                              color: hasDrink ? Colors.orange.shade200 : (isToday ? Colors.blue.shade300 : null),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: hasDrink || isToday ? Colors.black : Colors.grey.shade800,
                                  fontWeight: hasDrink || isToday ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      // Calendar Style & Theming
                      calendarStyle: CalendarStyle(
                        tablePadding: EdgeInsets.symmetric(vertical: 8),
                        // Normal Days
                        defaultTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        weekendTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),

                        // Today’s Date
                        todayTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        /*todayDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blueAccent, Colors.lightBlue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                        ),*/
                        todayDecoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),

                        defaultDecoration: BoxDecoration(
                          shape: BoxShape.circle,  // Ensures all dates remain circular
                          color: Colors.transparent, // No extra background margin
                        ),

                        // Selected Day with Smooth Highlight
                        selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        selectedDecoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        //  boxShadow: [BoxShadow(color: Colors.green.shade200, blurRadius: 6)],
                        ),

                        // Default Day Decorations
                        outsideDaysVisible: false, // Hide days outside current month
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  /*Text(
                    "Drinks logged on ${state.selectedDay.toLocal().toString().split(' ')[0]}: ${state.drinkLog[state.selectedDay] ?? 0}",
                    style: TextStyle(fontSize: 18),
                  ),*/
                  ElevatedButton(
                    onPressed: () {
                      DateTime today = DateTime.now();
                      DateTime selectedDate = DateTime(state.selectedDay.year, state.selectedDay.month, state.selectedDay.day);
                      DateTime currentDate = DateTime(today.year, today.month, today.day);

                      if (selectedDate.isBefore(currentDate)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Cannot log drinks for past dates!"), backgroundColor: Colors.red),
                        );
                        return;
                      }
                      context.read<CalendarBloc>().add(LogDrink(state.selectedDay, 1));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button color
                      foregroundColor: Colors.white, // Text/Icon color
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Button size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                      ),
                      elevation: 6, // Shadow effect
                      shadowColor: Colors.black.withOpacity(0.3), // Shadow color
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, size: 20, color: Colors.white), // Icon on button
                        SizedBox(width: 8), // Space between icon and text
                        Text(
                          "Drink Log",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
      },
    );
  }
}
