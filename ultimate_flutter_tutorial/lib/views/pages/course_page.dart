import "dart:convert";

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ultimate_flutter_tutorial/data/classes/activity_class.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  Activity? _activity;

  @override
  void initState() {
    _fetchNewActivity(); // Obter dados da API
    super.initState();
  }

  /// Obter dados da API
  Future<Activity> getData() async {
    var url = Uri.https(
      "bored-api.appbrewery.com", // URL da API
      '/random', // endpoint da API
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Activity.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception("Failed to load activity.");
    }
  }

  /// Buscar nova atividade e atualizar o estado
  Future<void> _fetchNewActivity() async {
    try {
      final activity = await getData();
      setState(() {
        _activity = activity;
      });
    } catch (e) {
      setState(() {
        _activity = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random Activity Viewer")),
      body: _activity == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Activity: ${_activity!.activity}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 16),
                    Text("Type: ${_activity!.type}"),
                    Text("Participants: ${_activity!.participants}"),
                    Text("Price: ${_activity!.price}"),
                    Text("Availability: ${_activity!.availability}"),
                    Text("Accessibility: ${_activity!.accessibility}"),
                    Text("Duration: ${_activity!.duration}"),
                    Text("Kid-Friendly: ${_activity!.kidFriendly}"),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _fetchNewActivity,
                      child: Text("Fetch Another Activity"),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
