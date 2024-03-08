// To parse this JSON data, do
//
//     final getInfo = getInfoFromJson(jsonString);

import 'dart:convert';

getInfo getInfoFromJson(String str) => getInfo.fromJson(json.decode(str));

String getInfoToJson(getInfo data) => json.encode(data.toJson());

class getInfo {
  String resCode;
  String resMsg;
  List<Data> datas;

  getInfo({
    required this.resCode,
    required this.resMsg,
    required this.datas,
  });

  factory getInfo.fromJson(Map<String, dynamic> json) => getInfo(
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
  String itmId;
  List<String> productImage;
  String itmChar;
  String itmDesc1;
  String itmMemo;
  String itmMemoPublic;

  Data({
    required this.id,
    required this.itmId,
    required this.productImage,
    required this.itmChar,
    required this.itmDesc1,
    required this.itmMemo,
    required this.itmMemoPublic,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        itmId: json["Itm_id"],
        productImage: List<String>.from(json["Product_image"].map((x) => x)),
        itmChar: json["Itm_Char"],
        itmDesc1: json["Itm_Desc1"],
        itmMemo: json["Itm_Memo"],
        itmMemoPublic: json["Itm_Memo_Public"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Itm_id": itmId,
        "Product_image": List<dynamic>.from(productImage.map((x) => x)),
        "Itm_Char": itmChar,
        "Itm_Desc1": itmDesc1,
        "Itm_Memo": itmMemo,
        "Itm_Memo_Public": itmMemoPublic,
      };
}
