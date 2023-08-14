import 'package:flutter/material.dart';
import 'package:task_2/ui/widgets/Todos_Design.dart';
import 'package:http/http.dart' as http;
import '../../models/todos.dart';
import 'dart:convert' as convert;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<Todos>> getData() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/todos'));
    List<Todos> todosesList = [];

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      for (var item in jsonResponse['todos']) {
        todosesList.add(Todos.fromJson(item));
      }
    }
    return todosesList;
  }

  List<Todos> todoses = [];
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      var data = await getData();
      setState(() {
        todoses = data;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: GridView.builder(
                      itemCount: todoses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomWidget(todos: todoses[index]);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    )),
              ));
  }
}
