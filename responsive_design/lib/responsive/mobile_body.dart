import 'package:flutter/material.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(title: Text("MOBILE")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 16,
          children: [
            // youtube video
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(height: 250, color: Colors.deepPurple[400]),
            ),

            // comment section & recommended videos
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(color: Colors.deepPurple[300], height: 120);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
