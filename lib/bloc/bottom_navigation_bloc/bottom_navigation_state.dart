part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  final int selectedIndex;

  BottomNavigationState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
