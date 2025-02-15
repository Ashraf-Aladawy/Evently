class UserModel {
  String id;
  String name;
  String email;


  UserModel({required this.id, required this.name, required this.email});

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(id: json["id"], name: json["name"], email: json["email"]);
  }

  static Map<String, dynamic> toJson(UserModel user) {
    return {"id": user.id, "name": user.name, "email": user.email};
  }
}
