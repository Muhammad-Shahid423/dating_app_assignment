import 'fruit_details.dart';

class Fruit {
  final String name;
  final FruitDetails fruitDetails;

  Fruit({
    required this.name,
    required this.fruitDetails,
  });

  factory Fruit.fromMap(Map<String, dynamic> map) {
    return Fruit(
      name: map['name'] as String,
      fruitDetails: FruitDetails.fromMap(map.values as Map<String, dynamic>)
    );
  }
}