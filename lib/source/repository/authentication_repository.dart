import 'package:drift_demo/source/data_source/local_data_source.dart';

import '../models/user_model.dart';

abstract class IAuthenticationRepository {
  final ILocalDataSource iLocalDataSource;

  IAuthenticationRepository({required this.iLocalDataSource});

  Future<List<UserModel>> getAllUsers();
  Future<int> addUser({required UserModel userDetails});

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

}