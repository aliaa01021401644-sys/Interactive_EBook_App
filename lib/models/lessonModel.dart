class Lesson {
  final String name;
  final List<dynamic> objects;

  Lesson({
    required this.name,
    required this.objects,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      name: json['name'],
      objects: json['aims']['aimObjects'],
    );
  }
}