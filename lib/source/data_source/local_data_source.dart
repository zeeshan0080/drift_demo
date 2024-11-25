
import 'package:drift/drift.dart';
import 'package:drift_demo/source/core/database/local_database.dart';
import 'package:drift_demo/source/core/local_client.dart';

import '../models/user_model.dart';

abstract class ILocalDataSource{
  final LocalClient localClient;

  ILocalDataSource({required this.localClient});

  Future<List<UserModel>> getAllUsers();
  Future<int> addUser({required UserModel userDetails});
  Future<UserModel?> getUserByID({required int id});
  Future<void> updateUserDetails({required UserModel userDetails});
  Future<void> deleteUserByID({required int id});
  Future<void> deleteAllUsers();

}

class LocalDataSource extends ILocalDataSource{
  LocalDataSource({required super.localClient});

  @override
  Future<List<UserModel>> getAllUsers() async {
    final response = await localClient.getAllRecords<UserLocal>(table: localClient.db.userLocalModel);
    return response.map((item) => UserModel.fromLocal(item)).toList();
  }

  @override
  Future<int> addUser({required UserModel userDetails}) async {
    final data = UserLocalModelCompanion.insert(
      firstName: Value(userDetails.firstName),
      lastName: Value(userDetails.lastName),
      email: Value(userDetails.email),
      age: Value(userDetails.age),
      isVerified: Value(userDetails.isVerified!),
    );
    final response = await localClient.addRecord(table: localClient.db.userLocalModel, userDetails: data);
    return response;
  }

  @override
  Future<UserModel?> getUserByID({required int id}) async {
    return await localClient.getRecordByID<UserModel>(
      table: localClient.db.userLocalModel,
      condition: (tbl) => tbl.id.equals(id),
      fromRow: (row) => UserModel.fromLocal(row),
    );
  }

  @override
  Future<void> updateUserDetails({required UserModel userDetails}) async {
    return await localClient.updateRecord<UserModel>(
      table: localClient.db.userLocalModel,
      condition: (tbl) => tbl.id.equals(userDetails.id!),
      dataMapper: (details) => UserLocalModelCompanion(
        firstName: Value(details.firstName),
        lastName: Value(details.lastName),
        email: Value(details.email),
        age: Value(details.age),
        isVerified: Value(details.isVerified ?? false),
      ),
      details: userDetails,
    );
  }

  @override
  Future<void> deleteUserByID({required int id}) async {
    return await localClient.deleteRecord<UserModel>(
      table: localClient.db.userLocalModel,
      condition: (tbl) => tbl.id.equals(id),
    );
  }

  @override
  Future<void> deleteAllUsers() async {
    return await localClient.deleteAllRecords(table: localClient.db.userLocalModel);
  }
}