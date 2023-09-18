class FruitDetails {
  final String name;
  final String description;
  final List<String> images;
  final int likeCount;
  final String location;
  final int age;
  final List<String> tags;

  FruitDetails({
    required this.name,
    required this.description,
    required this.images,
    required this.likeCount,
    required this.location,
    required this.age,
    required this.tags,
  });

  factory FruitDetails.fromMap(Map<dynamic, dynamic> map) {
    return FruitDetails(
      name: map['name'] as String,
      description: map['description'] as String,
      images: List<String>.from(map['images'] as List<dynamic>),
      likeCount: map['likeCount'] as int,
      location: map['location'] as String,
      age: map['age'] as int,
      tags: List<String>.from(map['tags'] as List<dynamic>),
    );
  }
}