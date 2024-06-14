import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://172.21.192.1:8080";

//통신
class PostProvider extends GetConnect {
  Future<Response> findAll() => get("$host/post", headers: {"Authorization" : jwtToken ?? ""});

  Future<Response> findById(int? id) => get("$host/post/$id", headers: {"Authorization" : jwtToken ?? ""});

  Future<Response> deleteById(int? id) => delete("$host/post/$id", headers: {"Authorization" : jwtToken ?? ""});

  Future<Response> updateById(Map data, int? id) => put("$host/post/$id", data ,headers: {"Authorization" : jwtToken ?? ""}, );

  Future<Response> save(Map data) => post("$host/post", data ,headers: {"Authorization" : jwtToken ?? ""}, );

}
