import 'package:moor_flutter/moor_flutter.dart';

class Workers extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get specification => text().withLength(min: 1, max: 100)();
  TextColumn get avatar => text().nullable()();
}