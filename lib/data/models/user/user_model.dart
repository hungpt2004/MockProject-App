import 'package:vdiary_internship/domain/entities/user/user_entity.dart';

class UserModel {
  String? id;
  String? email;
  String? name;
  String? avatarUrl;
  int? numberFriends;
  String? coverImageUrl;

  UserModel(
    this.id,
    this.email,
    this.name,
    this.avatarUrl,
    this.numberFriends,
    this.coverImageUrl,
  );

  // Convert from JSON to Object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['id'],
      json['name'],
      json['email'],
      json['avatarUrl'],
      json['numberFriends'],
      json['coverImageUrl'],
    );
  }


  // Convert from Object to JSON
  Map<String, dynamic> toJson() => {
    'id':id,
    'email':email,
    'name':name,
    'avatarUrl':avatarUrl,
    'numberFriends':numberFriends,
    'coverImageUrl':coverImageUrl
  };

  UserEntity toEntity() => UserEntity(
    id,
    name,
    email,
    avatarUrl,
    numberFriends,
    coverImageUrl
  );

  // Optional: từ entity về model
  factory UserModel.fromEntity(UserEntity entity) => UserModel(
    entity.id,
    entity.name,
    entity.email,
    entity.avatarUrl,
    entity.numberFriends,
    entity.coverImageUrl
  );
}