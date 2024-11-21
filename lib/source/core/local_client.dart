import 'package:drift/drift.dart';

import '../models/user_model.dart';
import 'database/local_database.dart';

class LocalClient{
  final LocalDatabase db;

  LocalClient({required this.db});
  
  Future<List<UserModel>> getAllUsers() async {
    final users = await db.select(db.userLocalModel).get();
    return users.map((item) => UserModel.fromLocal(item)).toList();
  }

  Future<UserModel?> getUserByID({required int id}) async {
    final response = await (db.select(db.userLocalModel)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if(response == null) return null;
    return UserModel.fromLocal(response);
  }

  Future<int> addUser({required UserModel userDetails}) async {
    final response = await db.into(db.userLocalModel).insert(
      mode: InsertMode.insertOrReplace,
        UserLocalModelCompanion.insert(
          firstName: Value(userDetails.firstName),
          lastName: Value(userDetails.lastName),
          email: Value(userDetails.email),
          age: Value(userDetails.age),
          isVerified: Value(userDetails.isVerified!),
      )
    );
    return response;
  }

  Future<void> updateUserDetails({required UserModel userDetails}) async {
    final data = UserLocalModelCompanion(
      firstName: Value(userDetails.firstName),
      lastName: Value(userDetails.lastName),
      email: Value(userDetails.email),
      age: Value(userDetails.age),
      isVerified: Value(userDetails.isVerified??false),
    );
    final response = await (db.update(db.userLocalModel)..where((tbl) => tbl.id.equals(userDetails.id!))).write(data);
    print("User record updated: $response");
    return;
  }

  Future<void> deleteUserByID({required int id}) async {
    final count = await (db.delete(db.userLocalModel)..where((tbl) => tbl.id.equals(id))).go();
    print("User records deleted: $count");
    return;
  }

  Future<void> deleteAllUsers() async {
    final count = await db.delete(db.userLocalModel).go();
    print("All Users deleted: $count");
    return;
  }
}