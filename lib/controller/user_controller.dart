import 'dart:ffi';

import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; //ui 가 상태 지켜 보다 자동 업데이트
  final Rx<User> principal = User().obs;

  void logout() {
    isLogin.value = false;
    jwtToken = null;
  }

  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password);

    if (principal.id != null) {
      this.isLogin.value = true;
      this.principal.value = principal;

      return 1;
    } else {
     return -1;
    }
  }
}