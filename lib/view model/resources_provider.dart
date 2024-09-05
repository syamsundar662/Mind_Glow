import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mind_glow_test/model/post.dart';

class CommentsProvider with ChangeNotifier {
  List<Resources> _resourseData = [];
  bool _isLoading = true;

  List<Resources> get comments => _resourseData;
  bool get isLoading => _isLoading;

  Future<void> fetchComments() async {
    _isLoading = true;
    notifyListeners();

    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      _resourseData = jsonResponse.map((json) => Resources.fromJson(json)).toList();
      print(_resourseData);
    } else {
      throw Exception('Failed to load comments');
    }

    _isLoading = false;
    notifyListeners();
  }
}
