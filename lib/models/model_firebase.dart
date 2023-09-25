import 'package:cloud_firestore/cloud_firestore.dart';

class Userr {
  String? id;
  String? email;
  String? nama;
  String? password1;
  String? password2;

  Userr({this.id, this.email, this.nama, this.password1, this.password2});

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'nama': nama,
    'password1': password1,
    'password2': password2,
  };

  static Userr fromJson(Map<String, dynamic> json) => Userr(
        id: json['id'],
        email: json['email'],
        nama: json['nama'],
        password1: json['password1'],
        password2: json['password2'],
      );
}
