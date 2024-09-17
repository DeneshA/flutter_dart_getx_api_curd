import 'package:get/get.dart';
import '../services/api_services.dart';

class PostController extends GetxController {
  var posts = [].obs; //Observable list of posts
  var isLoading = true.obs;

  final ApiServices apiServices = ApiServices();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var fetchedPosts = await apiServices.fetchData();
      posts.assignAll(fetchedPosts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch records');
    } finally {
      isLoading(false);
    }
  }

  void createPost(String title, String body) async {
    try {
      await apiServices.createData(title, body);
      fetchPosts(); //refresh data after creation
      Get.snackbar('Success', 'Post created successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to create post');
    }
  }

  void updatePost(int id, String title, String body) async {
    try {
      await apiServices.updateData(id, title, body);
      fetchPosts(); //Refresh records after update
      Get.snackbar('Success', 'Posts updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update post');
    }
  }

  void deletePost(int id) async {
    try {
      await apiServices.deleteData(id);
      fetchPosts(); // Refresh records after deletion
      Get.snackbar('Success', 'Post deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete post');
    }
  }
}
