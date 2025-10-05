import "dart:convert";

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ultimate_flutter_tutorial/data/classes/activity_class.dart';
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
  Future getData() async {
    var url = Uri.https(
      "bored-api.appbrewery.com", // URL da API
      '/random', // endpoint da API
      {'q': '{http}'}, // query parameters (após ?)
    );
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      /* Requisição bem-sucedida */
      return Activity.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      /* Requisição mal-sucedida */
      throw Exception("Failed to ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getData(), // obter dados da API antes de renderizar
        builder: (context, AsyncSnapshot snapshot) {
          // Tela de carregamento enquanto página não for carregada
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // Exibir os dados na página (sucesso)
          else if (snapshot.hasData) {
            Activity activity = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    HeroWidget(title: "Course"),

                    Text("Informações da atividade:"),
                    Text("Nome: ${activity.activity}"),
                    Text("Availability: ${activity.availability}")
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
