
import 'package:drift_demo/source/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';

import '../source/models/user_model.dart';

enum Status { initial, error, loading, loaded }

class AuthProvider with ChangeNotifier {
  final IAuthenticationRepository authRepository;

  AuthProvider({required this.authRepository});

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  Status getAllStatus = Status.initial;
  Status addStatus = Status.initial;

  Future getAllUsers(BuildContext context) async {
    getAllStatus = Status.loading;
    notifyListeners();
    try {
      _users = await authRepository.getAllUsers();
      getAllStatus = Status.loaded;
    } on Exception catch (e) {
      getAllStatus = Status.error;
    }
    notifyListeners();
    return;
  }

  Future adduser(BuildContext context, {required UserModel userDetails}) async {
    addStatus = Status.loading;
    notifyListeners();
    try {
      final id  = await authRepository.addUser(userDetails: userDetails);
      print("Inserted ID: $id");
      addStatus = Status.loaded;
    } on Exception catch (e) {
      addStatus = Status.error;
      print("adduser: $e");
    }
    notifyListeners();
    return;
  }


}