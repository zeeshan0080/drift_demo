import 'package:drift_demo/source/data_source/local_data_source.dart';

import '../models/attachment_model.dart';
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

  Future<List<AttachmentModel>> getAllAttachments();
  Future<AttachmentModel?> getAttachmentById({required int attachmentId});
  Future<int> addAttachment({required AttachmentModel attachmentDetails});
  Future<void> deleteAttachmentByID({required int id});
  Future<void> deleteAllAttachments();

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

  @override
  Future<List<AttachmentModel>> getAllAttachments() async {
    final response = await iLocalDataSource.getAllAttachments();
    return response;
  }

  @override
  Future<AttachmentModel?> getAttachmentById({required int attachmentId}) async {
    final response = await iLocalDataSource.getAttachmentById(attachmentId: attachmentId);
    return response;
  }

  @override
  Future<int> addAttachment({required AttachmentModel attachmentDetails}) async {
    final response = await iLocalDataSource.addAttachment(attachmentDetails: attachmentDetails);
    return response;
  }

  @override
  Future<void> deleteAttachmentByID({required int id}) async {
    await iLocalDataSource.deleteAttachmentByID(id: id);
    return;
  }

  @override
  Future<void> deleteAllAttachments() async {
    await iLocalDataSource.deleteAllAttachments();
    return;
  }

}