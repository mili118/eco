import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'post_model.dart'; // Import the Post model

class PublicPage extends StatefulWidget {
  @override
  _PublicPageState createState() => _PublicPageState();
}

class _PublicPageState extends State<PublicPage> {
  final List<Post> posts = [
    // Example data
    Post(user: "Alice", task: "Picked up trash in the park", timestamp: DateTime.now().subtract(Duration(hours: 1))),
    Post(user: "Bob", task: "Planted a tree", timestamp: DateTime.now().subtract(Duration(hours: 2))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Tasks', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text('${post.user} completed a task', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.task, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text(DateFormat.yMMMd().add_jm().format(post.timestamp), style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
