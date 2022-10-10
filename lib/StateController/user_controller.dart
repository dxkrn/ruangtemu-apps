import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Studyprogram {
  BigInt id;

  String name;

  Studyprogram({
    required this.id,
    required this.name,
  });

  factory Studyprogram.fromJson(Map<String, dynamic> json) {
    return Studyprogram(
      id: BigInt.parse(json['id'].toString()),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class User {
  BigInt id;
  String name;
  String email;
  String? avatar;
  bool isAdmin;
  bool isBanned;
  int? generationYear;
  Studyprogram? studyprogram;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.isAdmin,
    required this.isBanned,
    this.generationYear,
    this.studyprogram,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: BigInt.parse(json['id'].toString()),
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      isAdmin: json['is_admin'] == 1,
      isBanned: json['is_banned'] == 1,
      generationYear: json['generation_year'],
      studyprogram:
          json.containsKey('studyprogram') && json['studyprogram'] != null
              ? Studyprogram.fromJson(json['studyprogram'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'is_admin': isAdmin,
      'is_banned': isBanned,
      'generation_year': generationYear,
      'studyprogram': studyprogram?.toJson(),
    };
  }
}

class UserController extends GetxController {
  var user = User(
    id: BigInt.parse('0'),
    name: '',
    email: '',
    avatar: '',
    isAdmin: false,
    isBanned: false,
    generationYear: 0,
    studyprogram: null,
  ).obs;

  final box = GetStorage();

  void setUser(User user) {
    this.user.value = user;
  }

  void clearUser() {
    user.value = User(
      id: BigInt.parse('0'),
      name: '',
      email: '',
      avatar: '',
      isAdmin: false,
      isBanned: false,
      generationYear: 0,
      studyprogram: null,
    );

    box.remove('api_key');
  }

  void setToken(String apiKey) async {
    await box.write('api_key', apiKey);
  }

  String getToken() {
    return box.read('api_key');
  }
}
