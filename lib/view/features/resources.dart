import 'package:flutter/material.dart';
import 'package:mind_glow_test/view%20model/resources_provider.dart';
import 'package:provider/provider.dart';

class ResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final commentsProvider = Provider.of<CommentsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Comments')),
      body: commentsProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: commentsProvider.comments.length,
              itemBuilder: (context, index) {
                final comment = commentsProvider.comments[index];
                return ListTile(
                  title: Text(comment.name ?? ''),
                  subtitle: Text(comment.body ?? ''),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          commentsProvider.fetchComments();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
