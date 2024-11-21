
import 'package:drift_demo/source/core/local_client.dart';

import '../models/user_model.dart';

abstract class ILocalDataSource{
  final LocalClient localClient;

  ILocalDataSource({required this.localClient});

  Future<List<UserModel>> getAllUsers();
  Future<int> addUser({required UserModel userDetails});

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
}