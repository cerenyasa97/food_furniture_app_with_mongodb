import 'package:food_furniture_app/core/base/base_model.dart';

class User extends BaseModel{
  User({this.userID, this.email, this.password, this.name, this.surname});

  String? userID;
  String? email;
  String? password;
  String? name;
  String? surname;

  @override
  fromJson(Map<String, dynamic> json) => User(
    userID: json["user_id"],
    name: json["name"],
    surname: json["surname"],
    password: json["password"],
    email: json["email"]
  );

  @override
  Map<String, dynamic> toJson() => {
    "user_id" : userID,
    "name": name,
    "surname": surname,
    "password": password,
    "email": email
  };
}