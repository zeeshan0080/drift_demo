
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
    final response = await localClient.getAllUsers();
    return response;
  }

  @override
  Future<int> addUser({required UserModel userDetails}) async {
    final response = await localClient.addUser(userDetails: userDetails);
    return response;
  }

  @override
  Future<UserModel?> getUserByID({required int id}) async {
    final response = await localClient.getUserByID(id: id);
    return response;
  }

  @override
  Future<void> updateUserDetails({required UserModel userDetails}) async {
    final response = await localClient.updateUserDetails(userDetails: userDetails);
    return response;
  }

  @override
  Future<void> deleteUserByID({required int id}) async {
    final response = await localClient.deleteUserByID(id: id);
    return response;
  }

  @override
  Future<void> deleteAllUsers() async {
    final response = await localClient.deleteAllUsers();
    return response;
  }
}