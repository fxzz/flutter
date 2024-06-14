import 'dart:ffi';

import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {

  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> save(String title, String content) async {
    Post post = await _postRepository.save(title, content);
    if (post.id != null) {
      //처음 0번째 추가
      this.posts.insert(0, post);

      //마지막 인덱스에 추가
      //this.posts.add(post);
    }
  }

  Future<void> updateById(int? id, String title, String content) async {
   Post updatedPost = await _postRepository.updateById(id, title, content);
   if (updatedPost.id != null) {
      this.post.value = updatedPost;
      int index = this.posts.indexWhere((post) => post.id == updatedPost.id);
      if (index != -1) {
        this.posts[index] = updatedPost;
      } else {
        print("오류");
      }
   }

  }

  Future<int> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);
    if (result == 1) {
      List<Post> result = posts.where((post) => post.id != id).toList();
      this.posts.value = result;
    }

    return result;
  }


  Future<void> findAll() async {
   List<Post> posts = await _postRepository.findAll();
   this.posts.value = posts;
  }

  Future<void> findById(int? id) async {
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }


}