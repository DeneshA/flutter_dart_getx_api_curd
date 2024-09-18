import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class HomePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX CRUD App'),
        backgroundColor: Colors.grey.shade300,

      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: postController.posts.length,
            itemBuilder: (context, index) {
              var post = postController.posts[index];
              return ListTile(
                hoverColor: Colors.blue.shade300,
                title: Text(post['title'].toString().toUpperCase() ,style: const TextStyle(fontSize:15),),
                subtitle: Text(post['body'].toString(),textAlign: TextAlign.justify
                  ,style: const TextStyle(fontSize: 10,
                ),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        //call updated post
                        postController.updatePost(
                            post['id'], 'Updated Title', 'Updated Body');
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        //call delete post
                        postController.deletePost(post['id']);
                      },
                    ),
                  ],
                ),
              );

            });

      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //call create post
          postController.createPost(
              'New Post', 'This is the body of the new post');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
