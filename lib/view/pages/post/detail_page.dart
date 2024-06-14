import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    PostController p = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("$id 번째 글, ${u.principal.value.id},"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${p.post.value.title}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Divider(),
                u.principal.value.id == p.post.value.user!.id ? Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        int code = await p.deleteById(p.post.value.id!);
                        if (code == 1) {
                          Get.off(() => HomePage());
                        } else {
                          Get.snackbar("게시글 삭제 시도", "삭제 실패");
                        }

                      },
                      child: Text("삭제"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => UpdatePage());
                      },
                      child: Text("수정"),
                    ),
                  ],
                ) : SizedBox(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text("${p.post.value.content}",),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
