// To parse this JSON data, do
//
//     final getModel = getModelFromJson(jsonString);

import 'dart:convert';

GetModel getModelFromJson(String str) => GetModel.fromJson(json.decode(str));

String getModelToJson(GetModel data) => json.encode(data.toJson());

class GetModel {
    int userId;
    int id;
    String title;
    String body;

    GetModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory GetModel.fromJson(Map<String, dynamic> json) => GetModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
