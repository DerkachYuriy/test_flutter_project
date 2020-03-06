import 'package:moor_flutter/moor_flutter.dart';

class Tasks extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get desc => text().withLength(min: 1, max: 1000)();
  @override
  IntColumn get project_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES projects(id)')();
}