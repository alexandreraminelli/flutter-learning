import "dart:convert";

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ultimate_flutter_tutorial/views/widgets/hero_widget.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    getData(); // Obter dados da API
    super.initState();
  }

  /// Obter dados da API
  void getData() async {
    var url = Uri.https(
      "https://bored-api.appbrewery.com", // URL da API
      '/random', // endpoint da API
      {'q': '{http}'}, // query parameters (após ?)
    );
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      /* Requisição bem-sucedida */
      var jsonResponse =
          jsonDecode(response.body)
              as Map<String, dynamic>; // converte String de JSON em um Map
      var activity = jsonResponse['activity'];
      print('$activity');
    } else {
      /* Requisição mal-sucedida */
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [HeroWidget(title: "Course")]),
        ),
      ),
    );
  }
}
