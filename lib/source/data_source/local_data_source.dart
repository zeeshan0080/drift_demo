
import 'package:drift/drift.dart';
import 'package:drift_demo/source/core/database/local_database.dart';
import 'package:drift_demo/source/core/local_client.dart';
import 'package:drift_demo/source/models/attachment_model.dart';

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

  Future<List<AttachmentModel>> getAllAttachments();
  Future<AttachmentModel?> getAttachmentById({required int attachmentId});
  Future<int> addAttachment({required AttachmentModel attachmentDetails});
  Future<void> deleteAttachmentByID({required int id});
  Future<void> deleteAllAttachments();

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
    return await localClient.addRecord<UserModel>(
      table: localClient.db.userLocalModel,
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
  Future<UserModel?> getUserByID({required int id}) async {
    return await localClient.getRecordByCondition<UserModel>(
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


  @override
  Future<List<AttachmentModel>> getAllAttachments() async {
    final response = await localClient.getAllRecords<AttachmentLocal>(table: localClient.db.attachmentLocalModel);
    return response.map((item) => AttachmentModel.fromLocal(item)).toList();
  }

  @override
  Future<AttachmentModel?> getAttachmentById({required int attachmentId}) async {
    return await localClient.getRecordByCondition<AttachmentModel>(
      table: localClient.db.attachmentLocalModel,
      condition: (tbl) => tbl.attachmentId.equals(attachmentId),
      fromRow: (row) => AttachmentModel.fromLocal(row),
    );
  }

  @override
  Future<int> addAttachment({required AttachmentModel attachmentDetails}) async {
    return await localClient.addRecord<AttachmentModel>(
      table: localClient.db.attachmentLocalModel,
      dataMapper: (details) => AttachmentLocalModelCompanion(
        attachmentId: Value(attachmentDetails.attachmentId),
        type: Value(attachmentDetails.type),
        size: Value(attachmentDetails.size),
        attachment: Value(details.attachment),
      ),
      details: attachmentDetails,
    );
  }

  @override
  Future<void> deleteAttachmentByID({required int id}) async {
    return await localClient.deleteRecord<AttachmentModel>(
      table: localClient.db.attachmentLocalModel,
      condition: (tbl) => tbl.id.equals(id),
    );
  }

  @override
  Future<void> deleteAllAttachments() async {
    return await localClient.deleteAllRecords(table: localClient.db.attachmentLocalModel);
  }
}