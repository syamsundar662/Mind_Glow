import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mind_glow_test/model/post.dart';

class CommentsProvider with ChangeNotifier {
  List<Comments> _comments = [];
  bool _isLoading = true;

  List<Comments> get comments => _comments;
  bool get isLoading => _isLoading;

  Future<void> fetchComments() async {
    _isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      _comments = jsonResponse.map((json) => Comments.fromJson(json)).toList();
      print(_comments);
    } else {
      throw Exception('Failed to load comments');
    }

    _isLoading = false;
    notifyListeners();
  }
}
