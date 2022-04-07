class UserModel {
  final String? name;
  final String? picture;
  final String? lastName;
  final String ? email;

  UserModel({this.email, this.name, this.picture, this.lastName});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          picture == other.picture &&
          lastName == other.lastName;

  @override
  int get hashCode => name.hashCode ^ picture.hashCode ^ lastName.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'avatar': this.picture,
      'lastName': this.lastName,
      'email': this.email
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      picture: map['avatar'],
      lastName: map['lastName'],
      email: map['email'],
    );
  }

  UserModel copyWith({
    String? name,
    String? picture,
    String? lastName,
  }) {
    return UserModel(
      name: name ?? this.name,
      picture: picture ?? this.picture,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  String toString() {
    return 'UserModel{name: $name, picture: $picture, lastName: $lastName}';
  }
}
