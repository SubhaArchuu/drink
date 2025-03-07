class Module {
  final String title;
    bool isLocked;

  Module({required this.title, required this.isLocked});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      title: json['title'],
      isLocked: json['isLocked'],
    );
  }

  Module copyWith({String? title, bool? isLocked}) {
    return Module(
      title: title ?? this.title,
      isLocked: isLocked ?? this.isLocked,
    );
  }
}
