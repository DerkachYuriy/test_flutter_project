import 'package:calculate_work_hours_app/database/project_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'task_table.dart';
import 'worker_table.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [Workers, Projects, Tasks], daos: [WorkersDao, ProjectsDao, TasksDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
        ));

  @override
  int get schemaVersion => 1;

  Future<List<Worker>> get allWatchingWorkers => select(workers).get();

  Stream<List<Worker>> get watchAllWorkers => select(workers).watch();
}

@UseDao(tables: [Workers])
class WorkersDao extends DatabaseAccessor<AppDatabase> with _$WorkersDaoMixin {
  WorkersDao(AppDatabase db) : super(db);

  Future<List<Worker>> get allWatchingWorkers => select(workers).get();

  Stream<List<Worker>> get watchAllWorkers => select(workers).watch();

  Stream<List<Worker>> getWorkerById(int workerId) {
    return (select(workers)..where((t) => t.id.equals(workerId))).watch();
  }

  void addUser({String name, String specification, String avatar}) {
    final _entry = WorkersCompanion(
        name: Value(name),
        specification: Value(specification),
        avatar: Value(avatar));

    into(workers).insert(_entry);
  }
}

@UseDao(tables: [Projects])
class ProjectsDao extends DatabaseAccessor<AppDatabase> with _$ProjectsDaoMixin{
  ProjectsDao(AppDatabase db) : super(db);

  void addProject({String name}) {
    final _entry = ProjectsCompanion(
        name: Value(name));

    into(projects).insert(_entry);
  }
}

@UseDao(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin{
  TasksDao(AppDatabase db) : super(db);
}
