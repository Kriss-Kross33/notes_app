import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.isAnonymous,
    this.email,
    this.displayPicture,
    this.username,
  });

  static const UserModel empty = UserModel(id: '', isAnonymous: false);

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  final bool isAnonymous;

  final String id;
  final String? username;
  final String? email;
  final String? displayPicture;
  @override
  List<Object?> get props => [
        id,
        email,
        displayPicture,
        username,
        isAnonymous,
      ];
}
