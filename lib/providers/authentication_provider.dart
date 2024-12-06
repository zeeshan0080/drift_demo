
import 'package:drift_demo/source/models/attachment_model.dart';
import 'package:drift_demo/source/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../source/models/user_model.dart';

enum Status { initial, error, loading, loaded }

class AuthProvider with ChangeNotifier {
  final IAuthenticationRepository authRepository;

  AuthProvider({required this.authRepository});

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  List<AttachmentModel> _localAttachments = [];
  List<AttachmentModel> get localAttachments => _localAttachments;

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

  Future getAllAttachments() async {
    getAllStatus = Status.loading;
    notifyListeners();
    try {
      _localAttachments = await authRepository.getAllAttachments();
      getAllStatus = Status.loaded;
    } on Exception catch (e) {
      getAllStatus = Status.error;
    }
    notifyListeners();
    return;
  }

  Future addAttachments() async {
    await deleteAllAttachments();
    addStatus = Status.loading;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse("https://dummyjson.com/image/4000x4000?type=png&text=I+am+a+png+image"));
      for(int i=1; i <= 80; i++){
        if(response.statusCode == 200){
          print("res: $i -> ${response.statusCode}");
          final attachmentDetails = AttachmentModel(
            attachmentId: i,
            type: 'image',
            size: response.bodyBytes.length/1024,
            attachment: response.bodyBytes
          );
          final id  = await authRepository.addAttachment(attachmentDetails: attachmentDetails);
          print("Inserted ID: $id");
        }else{
          print("$i -> image failed to download");
        }
      }
      print("All attachments added!!!");
      addStatus = Status.loaded;
    } on Exception catch (e) {
      addStatus = Status.error;
      print("addAttachments: $e");
    }
    notifyListeners();
    getAllAttachments();
    return;
  }

  deleteAllAttachments() async {
    await authRepository.deleteAllAttachments();
    _localAttachments.clear();
    notifyListeners();
  }


}