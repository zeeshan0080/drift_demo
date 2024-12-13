
import 'package:drift_demo/source/models/attachment_model.dart';
import 'package:drift_demo/source/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart';
import 'dart:io' as io;


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

  ///export implementation start
  final iosTypes = {
    ".pdf": "application/pdf",
    ".png": "public.png",
    ".xlsx": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    ".xls": "com.microsoft.excel.xls",
  };
  final androidTypes = {
    ".pdf": "application/pdf",
    ".png": "image/png",
    ".xlsx": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    ".xls": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  };

  Future<void> downloadFile(String url, String fileName) async {
    print("downloading...");
    ///request should be made through repository with return type of Uint8List
    final http.Response response = await http.get(Uri.parse(url));

    if (kIsWeb) {
      // Web download
      final blob = Blob([response.bodyBytes], 'application/octet-stream');
      print("type: ${blob.type}");
      final urlBlob = Url.createObjectUrlFromBlob(blob);
      final anchor = AnchorElement(href: urlBlob)
        ..target = 'blank'
        ..download = fileName
        ..click();
      Url.revokeObjectUrl(urlBlob);
    }else{
      final dir = await getApplicationCacheDirectory();
      io.File file = io.File("${dir.path}/$fileName");
      await file.writeAsBytes(response.bodyBytes);
      print("File: ${file.path}");
      final extension = path.extension(file.path);
      await OpenFile.open(file.path, type: io.Platform.isAndroid ? androidTypes[extension] : iosTypes[extension]);
    }
  }

  ///export implementation end

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