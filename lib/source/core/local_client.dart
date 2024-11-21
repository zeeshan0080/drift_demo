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

  Future<int> addUser({required UserModel userDetails}) async {
    final response = await db.into(db.userLocalModel).insert(
      mode: InsertMode.insertOrFail,
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
}