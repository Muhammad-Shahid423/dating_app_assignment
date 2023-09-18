import 'package:firebase_database/firebase_database.dart';

import '../../common/models/fruit_details.dart';

class DbService {
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  Future<List<FruitDetails>> retrieveData() async {
    List<FruitDetails> list = [];
    DatabaseEvent event = await _db.ref("data").once();
    Map<dynamic, dynamic> values = event.snapshot.value as Map<dynamic,dynamic>;
    values.forEach((key, values) {
      list.add(FruitDetails.fromMap(values));
    });
    return list;
  }
}