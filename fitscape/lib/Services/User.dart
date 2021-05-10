import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  String _email;
  String _password;
  String _username;
  String photoURL;
  String _gender;
  String _phone;
  String weight;
  String height;
  int age;
  int lifestyle;
  String femaleStatus; //pregnant

  void _setProfile({
    String name,
    String email,
    String password,
    String phone,
  }) {
    this._username = name ?? this._username;
    this._email = email ?? this._email;
    this._password = password ?? this._password;
    this._phone = phone ?? this._phone;
  }

  String get name => this._username;
  String get email => this._email;
  String get password => this._password;
  String get phone => this._phone;

  void setPhone(String phone) {
    this._phone = phone;
  }

  void setName(String name) {
    this._username = name;
  }

  void setGender(String gender) {
    this._gender = gender ?? this._gender;
  }

  void fromServer(String json) {
    final res = jsonDecode(json)['data'];
    this._setProfile(
      name: res['name'],
      email: res['email'],
      phone: res['phone'].toString(),
      password: res['password'],
    );
    this.weight = res['weight'];
  }

  void fromFirebase(User firebaseUser) {
    this._setProfile(
      name: firebaseUser.displayName,
      email: firebaseUser.email,
      password: firebaseUser.uid,
      phone: firebaseUser.phoneNumber,
    );
    this.photoURL = firebaseUser.photoURL;
  }

  void fromForm({
    String name,
    String email,
    String password,
    String phone,
  }) {
    _setProfile(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );
  }

  void printUser() {
    print('USER DETAILS');
    print(this._username);
    print(this._email);
    print(this._password);
    print('phone ${this._phone}');
    print(this.photoURL);
    print(this.weight);
    print('DETAILS END');
  }
}
