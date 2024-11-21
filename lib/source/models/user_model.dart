import 'package:drift_demo/source/core/database/local_database.dart';

class UserModel{
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  int? age;
  bool? isVerified;

  UserModel({this.id, this.firstName, this.email, this.age, this.lastName,
    this.isVerified});

  UserModel.fromJson(Map<String, dynamic> json){
    try{
      id = json['id'];
      firstName = json['first_name'];
      lastName = json['last_name'];
      email = json['email'];
      age = json['age'];
      isVerified = json['isVerified'];
    }catch(e){
      print("UserModel.fromJson: $e");
    }
  }

  UserModel.fromLocal(UserLocal data){
    try{
      id = data.id;
      firstName = data.firstName;
      lastName = data.lastName;
      email = data.email;
      age = data.age;
      isVerified = data.isVerified;
    }catch(e){
      print("UserModel.fromLocal: $e");
    }
  }
}