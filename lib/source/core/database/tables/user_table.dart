import 'package:drift/drift.dart';

@DataClassName('UserLocal')
class UserLocalModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text().nullable().withLength(min: 0, max: 200)();
  TextColumn get lastName => text().nullable().withLength(min: 0, max: 200)();
  TextColumn get email => text().nullable()();
  IntColumn get age => integer().nullable()();
  BoolColumn get isVerified => boolean().withDefault(const Constant(false))();
}
