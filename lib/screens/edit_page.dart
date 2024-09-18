import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class EditPage extends StatelessWidget {
  //
  final PostController postController = Get.find();
  final int postId;
  final String initialTitle;
  final String initialBody;

  EditPage(
      {super.key, required this.postId,
      required this.initialTitle,
      required this.initialBody});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Set initial values for the text fields
    titleController.text = initialTitle;
    bodyController.text = initialBody;
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                postController.updatePost(
                    postId, titleController.text, bodyController.text);
                Get.back(); //Go back to the previous page after updating
              },
              child: const Text('Update Post'),
            )
          ],
        ),
      ),
    );
  }
}
