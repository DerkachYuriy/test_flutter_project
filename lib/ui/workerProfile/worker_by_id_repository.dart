import 'package:calculate_work_hours_app/database/moor_database.dart';

class WorkerByIdRepository {

  final Stream<List<Worker>> cachedStream;

  WorkerByIdRepository(this.cachedStream);

  Stream<List<Worker>> getUserById() {
    return cachedStream;
  }
}