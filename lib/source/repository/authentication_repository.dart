import 'package:drift_demo/source/data_source/local_data_source.dart';

import '../models/user_model.dart';

abstract class IAuthenticationRepository {
  final ILocalDataSource iLocalDataSource;

  IAuthenticationRepository({required this.iLocalDataSource});

  Future<List<UserModel>> getAllUsers();
  Future<int> addUser({required UserModel userDetails});
  Future<UserModel?> getUserByID({required int id});
  Future<void> updateUserDetails({required UserModel userDetails});
  Future<void> deleteUserByID({required int id});
  Future<void> deleteAllUsers();

}

class AuthenticationRepository extends IAuthenticationRepository {
  AuthenticationRepository({required super.iLocalDataSource});

  @override
  Future<List<UserModel>> getAllUsers() async {
    final response = await iLocalDataSource.getAllUsers();
    return response;
  }

  @override
  Future<int> addUser({required UserModel userDetails}) async {
    final response = await iLocalDataSource.addUser(userDetails: userDetails);
    return response;
  }

  @override
  Future<UserModel?> getUserByID({required int id}) async {
    final response = await iLocalDataSource.getUserByID(id: id);
    return response;
  }

  @override
  Future<void> updateUserDetails({required UserModel userDetails}) async {
    final response = await iLocalDataSource.updateUserDetails(userDetails: userDetails);
    return response;
  }

  @override
  Future<void> deleteUserByID({required int id}) async {
    final response = await iLocalDataSource.deleteUserByID(id: id);
    return response;
  }

  @override
  Future<void> deleteAllUsers() async {
    final response = await iLocalDataSource.deleteAllUsers();
    return response;
  }

}