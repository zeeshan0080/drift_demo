
import 'package:flutter/services.dart';

import '../core/database/local_database.dart';

class AttachmentModel{
  int? id;
  int? attachmentId;
  String? type;
  double? size;
  Uint8List? attachment;

  AttachmentModel({this.id, this.attachmentId, this.type, this.size, this.attachment});

  AttachmentModel.fromLocal(AttachmentLocal data){
    try{
      id = data.id;
      attachmentId = data.attachmentId;
      type = data.type;
      size = data.size;
      attachment = data.attachment;
    }catch(e){
      print("AttachmentModel.fromLocal: $e");
    }
  }
}