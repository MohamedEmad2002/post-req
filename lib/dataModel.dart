import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(jsonDecode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel{
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;

  DataModel({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address
});

  factory DataModel.fromJson(Map<String,dynamic> json)=> DataModel(
      name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    address: json["address"],
   );

  Map<String,dynamic> toJson()=>{
    "name":name,
    "email":email,
    "password":password,
    "phone":phone,
    "address":address,
  };
}