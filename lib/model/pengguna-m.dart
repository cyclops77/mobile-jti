// To parse this JSON data, do
//
//     final penggunaModel = penggunaModelFromJson(jsonString);

import 'dart:convert';

List<PenggunaModel> penggunaModelFromJson(List str) =>
    List<PenggunaModel>.from(str.map((x) => PenggunaModel.fromJson(x)));

String penggunaModelToJson(List<PenggunaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PenggunaModel {
  PenggunaModel({
    this.id,
    this.nama,
    this.usia,
    this.kota,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String nama;
  String usia;
  String kota;
  DateTime createdAt;
  DateTime updatedAt;

  factory PenggunaModel.fromJson(Map<String, dynamic> json) => PenggunaModel(
        id: json["id"],
        nama: json["nama"],
        usia: json["usia"],
        kota: json["kota"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "usia": usia,
        "kota": kota,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
