import 'package:flutter/material.dart';
import 'package:mind_glow_test/model/post.dart'; // Adjust the import based on your file structure

class UserDetailPage extends StatelessWidget {
  final CommunityUsers user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? 'User Details',),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        user.name?.substring(0, 1) ?? '?',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        user.name ?? 'N/A',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 30, thickness: 1),
                buildDetailItem(Icons.person, 'Username', user.username),
                buildDetailItem(Icons.email, 'Email', user.email),
                buildDetailItem(Icons.phone, 'Phone', user.phone),
                buildDetailItem(Icons.web, 'Website', user.website),
                const Divider(height: 30, thickness: 1),
                const Text(
                  'Company Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                buildDetailItem(Icons.business, 'Company', user.company?.name),
                buildDetailItem(Icons.lightbulb_outline, 'Catch Phrase', user.company?.catchPhrase),
                buildDetailItem(Icons.work_outline, 'Business', user.company?.bs),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailItem(IconData icon, String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 24),
          const SizedBox(width: 16),
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value ?? 'N/A',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
