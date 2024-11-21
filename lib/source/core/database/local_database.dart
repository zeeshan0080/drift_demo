import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/user_table.dart';

part 'local_database.g.dart';

@DriftDatabase(tables: [UserLocalModel])
class LocalDatabase extends _$LocalDatabase{

  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      web: DriftWebOptions(
          sqlite3Wasm: Uri.parse('sqlite3.wasm'),
          driftWorker: Uri.parse('drift_worker.js'),
          onResult: (result) {
            if (result.missingFeatures.isNotEmpty) {
              print(
                  'Using ${result.chosenImplementation} due to unsupported '
                      'browser features: ${result.missingFeatures}');
            }
          })
    );
  }
}