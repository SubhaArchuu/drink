import 'dart:convert';

class ProfileMenuItem {
  final String title;
  final String icon;

  ProfileMenuItem({required this.title, required this.icon});

  // Convert JSON to ProfileMenuItem object
  factory ProfileMenuItem.fromJson(Map<String, dynamic> json) {
    return ProfileMenuItem(
      title: json['title'],
      icon: json['icon'],
    );
  }

  // Convert List of JSON objects to List<ProfileMenuItem>
  static List<ProfileMenuItem> fromJsonList(String jsonString) {
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((item) => ProfileMenuItem.fromJson(item)).toList();
  }
}
