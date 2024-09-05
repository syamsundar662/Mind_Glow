import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mind_glow_test/model/post.dart';

class UserProvider with ChangeNotifier {
  List<CommunityUsers> _users = [];
  bool _isLoading = true;

  List<CommunityUsers> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      _users = jsonResponse.map((json) => CommunityUsers.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }

    _isLoading = false;
    notifyListeners();
  }
}
