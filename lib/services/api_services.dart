

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  // Fetch data (Read operation)
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load records");
    }
  }

  //Create a new post (Create operation)
  Future<void> createData(String title, String body) async {
    final response = await http.post(Uri.parse('$baseUrl/posts'),
        body: json.encode({"title": title, "body": body, "userId": 1,}),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },);
    if (response.statusCode == 201) {
      print('Post created successfully: ${response.body}');
    } else {
      print('Failed to create post: ${response.statusCode}, ${response.body}');
      throw Exception("Failed to create data");
    }
  }
  //Update a post (Update operation)
  Future<void> updateData(int id,String title,String body) async{

    final response = await http.put(Uri.parse('$baseUrl/posts/$id'),
    body: json.encode({"id":id,
    "title":title,
    "body":body,
    "userId":1}),
    headers: {"content-type":"application/json; charset=UTF-8",},);
    if(response.statusCode != 200){
      throw Exception("failed to update record");
    }
  }

//Delete a post (Delete operation)
  Future<void> deleteData(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/posts/$id'));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete data");
    }
  }
}
