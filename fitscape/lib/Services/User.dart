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
  int _age;
  int _lifestyle;
  String _femaleStatus; //pregnant
  int _basicCalBurn;

  void _setProfile(
      {String name,
      String email,
      String password,
      String phone,
      String gender}) {
    this._username = name ?? this._username;
    this._email = email ?? this._email;
    this._password = password ?? this._password;
    this._phone = phone ?? this._phone;
    this._gender = gender ?? this._gender;
  }

  void setExtras({
    int age,
    int lifestyle,
    String femaleStatus,
    int basicCalBurn,
  }) {
    this._age = age ?? this._age;
    this._lifestyle = lifestyle ?? this._lifestyle;
    this._femaleStatus = femaleStatus ?? this._femaleStatus;
    this._basicCalBurn = basicCalBurn ?? this._basicCalBurn;
  }

  String get name => this._username;
  String get email => this._email;
  String get password => this._password;
  String get phone => this._phone;
  String get gender => this._gender;
  int get age => _age;
  int get lifestyle => _lifestyle;
  String get femaleStatus => _femaleStatus;
  int get basicCalBurn => _basicCalBurn;

  void fromServer(String json) {
    final res = jsonDecode(json)['data'];
    this._setProfile(
      name: res['user']['name'],
      email: res['user']['email'],
      phone: res['user']['phone']?.toString(),
      password: res['user']['password'],
      gender: res['user']['gender'],
    );
    this.photoURL = res['user']['avatar'];
    this.weight = res['user']['weight'];
    this.height = res['user']['height'];
    setExtras(
      femaleStatus: res['user']['pregnant'],
      lifestyle: res['user']['lifestyle'],
      basicCalBurn: res['user']['basicCalBurn'],
    );
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

  void fromForm(
      {String name,
      String email,
      String password,
      String phone,
      String gender}) {
    _setProfile(
      name: name,
      email: email,
      password: password,
      phone: phone,
      gender: gender,
    );
  }

  void printUser() {
    print('USER DETAILS');
    print(this._username);
    print(this._email);
    print(this._password);
    print('phone ${this._phone}');
    print("pic: ${this.photoURL}");
    print("weight: ${this.weight}");
    print("height: ${this.height}");
    print("Gender: ${this._gender}");
    print('DETAILS END');
  }
}
