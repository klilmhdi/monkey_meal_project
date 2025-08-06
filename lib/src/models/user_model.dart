import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
  });

  UserModel copyWith({String? name, String? email, String? password, String? phone, String? address}) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [name, email, password, phone, address];
}
