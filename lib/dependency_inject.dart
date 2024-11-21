import 'dart:io';

import 'package:drift_demo/providers/authentication_provider.dart';
import 'package:drift_demo/source/core/database/local_database.dart';
import 'package:drift_demo/source/data_source/local_data_source.dart';
import 'package:drift_demo/source/repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';

import 'source/core/local_client.dart';

final GetIt sl = GetIt.instance;

Future<void> setup() async {
  final database = LocalDatabase();

  sl.registerLazySingleton<LocalClient>(() => LocalClient(db: database));

  sl.registerLazySingleton<ILocalDataSource>(
          () => LocalDataSource(localClient: sl()));
  sl.registerLazySingleton<IAuthenticationRepository>(() =>
      AuthenticationRepository(iLocalDataSource: sl()));

  sl.registerLazySingleton<AuthProvider>(
          () => AuthProvider(authRepository: sl()));
  print("Dependencies injected!!");
}
