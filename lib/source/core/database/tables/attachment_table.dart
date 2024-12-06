import 'package:drift/drift.dart';

@DataClassName('AttachmentLocal')
class AttachmentLocalModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get attachmentId => integer().nullable()();
  TextColumn get type => text().nullable()();
  RealColumn get size => real().nullable()();
  BlobColumn get attachment => blob().nullable()();
}