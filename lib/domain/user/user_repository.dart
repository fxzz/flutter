import 'package:flutter_blog/controller/dto/cm_response_dto.dart';
import 'package:flutter_blog/controller/dto/login_req_dto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get_connect/http/src/response/response.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공
// json => Dart 오브젝트 변경
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    Response response = await _userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers;
    dynamic body = response.body;

    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      User principal = User.fromJson(cmRespDto.data);

      String token = headers["authorization"];
      jwtToken = token;

      return principal;
    } else {
      return User();
    }
    // if (headers["authorization"] == "Bearer null") {
    //   return "-1";
    // } else {
    //   String token = headers["authorization"];
    //   return token;
    // }
  }
}
