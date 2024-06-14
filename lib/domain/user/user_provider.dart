import 'package:get/get.dart';

const host = "http://172.21.192.1:8080";

//통신
class UserProvider extends GetConnect {
  Future<Response> login(Map data) => post("$host/login", data);


}
