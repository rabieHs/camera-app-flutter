// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String id;
  final String email;
  final String username;
  UserModel({
    required this.id,
    required this.email,
    required this.username,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      username: map['name'] as String,
    );
  }
}
