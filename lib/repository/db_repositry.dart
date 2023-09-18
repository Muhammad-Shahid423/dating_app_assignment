import '../common/models/fruit_details.dart';
import 'services/db_service.dart';

class DbRepositoryImpl implements DbRepository {
  DbService service = DbService();

  @override
  Future<List<FruitDetails>> retrieveData() {
    return service.retrieveData();
  }
}

abstract class DbRepository {
  Future<List<FruitDetails>> retrieveData();
}