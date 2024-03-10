// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  String resCode;
  String resMsg;
  List<Data> datas;

  UserInfo({
    required this.resCode,
    required this.resMsg,
    required this.datas,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        resCode: json["res_code"],
        resMsg: json["res_msg"],
        datas: List<Data>.from(json["datas"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "res_code": resCode,
        "res_msg": resMsg,
        "datas": List<dynamic>.from(datas.map((x) => x.toJson())),
      };
}

class Data {
  String id;
  String phoneNumber;
  String firstname;
  String lastname;
  String siteId;
  String siteName;
  String empId;
  String empPosition;
  dynamic image;

  Data({
    required this.id,
    required this.phoneNumber,
    required this.firstname,
    required this.lastname,
    required this.siteId,
    required this.siteName,
    required this.empId,
    required this.empPosition,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        phoneNumber: json["phone_number"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        siteId: json["site_id"],
        siteName: json["site_name"],
        empId: json["emp_id"],
        empPosition: json["emp_position"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone_number": phoneNumber,
        "firstname": firstname,
        "lastname": lastname,
        "site_id": siteId,
        "site_name": siteName,
        "emp_id": empId,
        "emp_position": empPosition,
        "image": image,
      };
}
