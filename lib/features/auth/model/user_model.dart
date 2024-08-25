class UserModel{

  String id;
  String name;
  String email;
  String phone;

  UserModel({this.id='',required this.name,required this.email,required this.phone});

  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "name":name,
      "email":email,
      "phone":phone
    };
  }

  static UserModel fromJson(Map<String,dynamic> json){
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
    );
  }
}