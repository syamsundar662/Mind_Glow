import 'package:flutter/material.dart';
import 'package:mind_glow_test/view%20model/resources_provider.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';
import 'package:provider/provider.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  ResourcesPageState createState() => ResourcesPageState();
}

class ResourcesPageState extends State<ResourcesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final commentsProvider =
          Provider.of<CommentsProvider>(context, listen: false);
      commentsProvider.fetchComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    final commentsProvider = Provider.of<CommentsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const SubHeadings(title:  'Educational Resourses')),
      body: commentsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: commentsProvider.comments.length,
              itemBuilder: (context, index) {
                final comment = commentsProvider.comments[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26, // Shadow color
                          blurRadius: 6.0, // Spread radius
                          offset: Offset(0, 3), // Shadow offset
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.all(16.0), // Padding inside the card
                      title: Text(
                        comment.name ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold), // Bold title
                      ),
                      subtitle: Text(comment.body ?? ''),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          commentsProvider.fetchComments();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
