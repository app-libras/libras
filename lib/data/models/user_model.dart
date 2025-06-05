import 'package:libras/domain/entities/user.dart';

class UserModel {
  final int? id;
  final String name;
  final String? profilePic;

  UserModel({this.id, required this.name, this.profilePic});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    print(map['id']);

    return UserModel(
      id: map['id'],
      name: map['name'],
      profilePic: map['profile_pic'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'profile_pic': profilePic};
  }

  // convert to domain entity
  User toEntity() => User(id: id!, name: name, profilePic: profilePic);
}
