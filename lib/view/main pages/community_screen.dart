import 'package:flutter/material.dart';
import 'package:mind_glow_test/view%20model/community_provider.dart';
import 'package:mind_glow_test/view/main%20pages/features%20/community_user_details_screen.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';
import 'package:provider/provider.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final communtyProvider =
          Provider.of<UserProvider>(context, listen: false);
      communtyProvider.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const SubHeadings(
          title: 'Community',
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: userProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text(
                          user.name?.substring(0, 1) ?? '?',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      title: Text(
                        user.name ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.phone ?? 'No phone available'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blueAccent,
                        size: 16,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailPage(user: user),
                          ),
                        );
                      },
                      contentPadding: const EdgeInsets.all(16.0),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userProvider.fetchUsers(); // Fetch users on button press
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
