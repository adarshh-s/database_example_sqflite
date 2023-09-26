import 'package:database_example/db/functions/db_functions.dart';
import 'package:database_example/db/model/data_model.dart';
import 'package:flutter/material.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentsList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentsList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(
                  onPressed: () {
                    if (data.id != null) {
                      deleteItem(data.id!);
                    } else {
                      print('unable to delete item');
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentsList.length,
        );
      },
    );
  }
}
