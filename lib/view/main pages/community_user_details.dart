import 'package:flutter/material.dart';
import 'package:mind_glow_test/model/post.dart'; // Adjust the import based on your file structure

class UserDetailPage extends StatelessWidget {
  final CommunityUsers user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name ?? 'User Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${user.name ?? 'N/A'}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Username: ${user.username ?? 'N/A'}'),
                SizedBox(height: 10),
                Text('Email: ${user.email ?? 'N/A'}'),
                SizedBox(height: 10),
                Text('Phone: ${user.phone ?? 'N/A'}'),
                SizedBox(height: 10),
                Text('Website: ${user.website ?? 'N/A'}'),
                SizedBox(height: 10),
                Text('Company: ${user.company?.name ?? 'N/A'}'),
                Text('Catch Phrase: ${user.company?.catchPhrase ?? 'N/A'}'),
                Text('BS: ${user.company?.bs ?? 'N/A'}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
