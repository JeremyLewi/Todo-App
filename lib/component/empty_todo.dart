import 'package:flutter/material.dart';

class EmptyTodo extends StatelessWidget {
  const EmptyTodo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.edit_calendar_outlined,
            size: 80,
            color: Colors.blue,
          ),
          SizedBox(height: 12),
          Text(
            'No todos yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text('Add a new todo')
        ],
      ),
    );
  }
}
