import 'package:get/get.dart';

class User {
  String name;
  String email;
  String apiKey;
  String phone;
  String address;

  User(this.name, this.email, this.apiKey, this.phone, this.address);
}

class UserController extends GetxController {
  var user = User("Damar Albaribin", "damaralbaribin.2021@student.uny.ac.id",
          "APIKEYHERE", "08515743688", "JL. Jambon")
      .obs;

  void updateName(String name) {
    user.update((val) {
      val!.name = name;
    });
  }
}
