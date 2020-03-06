import 'package:calculate_work_hours_app/database/moor_database.dart';

class WorkersListRepository {

  Stream<List<Worker>> cachedStream;

  WorkersListRepository(this.cachedStream);

  Stream<List<Worker>> getWorkersList() {
    return cachedStream;
  }
}