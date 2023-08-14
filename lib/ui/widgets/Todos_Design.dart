import 'package:flutter/material.dart';
import '../../models/todos.dart';

class CustomWidget extends StatelessWidget {
  final Todos todos;

  const CustomWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    todos.id.toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    todos.todo,
                    style:
                        const TextStyle(fontSize: 10, color: Colors.deepPurple),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    todos.completed.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 120,
            right: 0,
            child: Container(
              height: 10,
              decoration: const BoxDecoration(
                  color: Colors.pink, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 80,
            child: Container(
              height: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.cyan,
                shape: BoxShape.circle,
              ),
              child: Text(
                todos.userId.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
