import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/utils/format_date.dart';

class TodoItem extends StatelessWidget {
  final Todo data;

  const TodoItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        alignment: Alignment.center,
        child: Text(
          '${data.id}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(data.title),
      subtitle:
          Text(data.description != '' ? data.description : 'No description'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(FormatDate.format(data.startDate)),
          Text(FormatDate.format(data.endDate)),
        ],
      ),
    );
  }
}
