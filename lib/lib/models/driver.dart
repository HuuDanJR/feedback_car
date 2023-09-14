// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());

class Driver {
    final bool status;
    final String message;
    final int totalResult;
    final List<Datum> data;

    Driver({
        required this.status,
        required this.message,
        required this.totalResult,
        required this.data,
    });

    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        status: json["status"],
        message: json["message"],
        totalResult: json["totalResult"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalResult": totalResult,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final String id;
    final String datumId;
    final String name;
    final String code;
    final String image;
    final DateTime createdAt;
    final int v;

    Datum({
        required this.id,
        required this.datumId,
        required this.name,
        required this.code,
        required this.image,
        required this.createdAt,
        required this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        datumId: json["id"],
        name: json["name"],
        code: json["code"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": datumId,
        "name": name,
        "code": code,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}
