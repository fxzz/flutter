import 'package:flutter_blog/controller/dto/cm_response_dto.dart';
import 'package:flutter_blog/controller/dto/login_req_dto.dart';
import 'package:flutter_blog/controller/dto/save_or_update_req_dto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공
// json => Dart 오브젝트 변경
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<Post> save(String title, String content) async {
    SaveOrUpdateReqDto saveReqDto = SaveOrUpdateReqDto(title, content);
    Response response = await _postProvider.save(saveReqDto.toJson());
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      print("성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      print("실패");
      return Post();
    }
  }


  Future<Post> updateById(int? id, String title, String content) async {
    SaveOrUpdateReqDto updateReqDto = SaveOrUpdateReqDto(title, content);
    Response response = await _postProvider.updateById(updateReqDto.toJson(), id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      print("성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      print("실패");
      return Post();
    }
  }


  Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    return cmRespDto.code!;

  }

  Future<Post> findById(int? id) async {
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return List<Post>.of([]);
    }
  }
}
