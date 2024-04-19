class Student {
  final int id;
  final String name;
  final int age;
  final String contact;
  final String rollNumber;
  final String? imagePath; // Make imagePath nullable if the image is optional

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.contact,
    required this.rollNumber,
    this.imagePath,
  });
}
