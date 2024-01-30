import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

enum TodoStatus { open, inProgress, completed }

class Todo {
  final String title;
  final String description;
  final TodoStatus status;

  const Todo({
    required this.title,
    required this.description,
    required this.status,
  });

  @override
  String toString() {
    return 'Todo(title: $title, description: $description, status: $status)';
  }

  @override
  bool operator ==(Object other) => other is Todo && other.title == title;

  @override
  int get hashCode => title.hashCode;
}

class DataTableScreen extends StatelessWidget {
  const DataTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SPAppBar(title: 'Data Table'),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SPText.title2('Data Table Example'),
            ),
            SizedBox(height: AppTheme.of(context).spacing.regular),
            Expanded(
              child: SPDataTable<Todo>(
                columns: [
                  SPDataTableColumn(
                    headerText: 'Title',
                    cellText: (todo, _) => todo.title,
                  ),
                  SPDataTableColumn(
                    headerText: 'Description',
                    cellText: (todo, _) => todo.description,
                  ),
                  SPDataTableColumn(
                    headerText: 'Status',
                    cellText: (item, index) => item.status.toString(),
                    cellWidgetBuilder: (item, index) {
                      if (item.status == TodoStatus.open) {
                        return const Icon(Icons.query_builder);
                      }

                      if (item.status == TodoStatus.inProgress) {
                        return const Icon(Icons.run_circle, color: Colors.blue);
                      }

                      return const Icon(Icons.done, color: Colors.green);
                    },
                  ),
                ],
                rows: const [
                  Todo(
                    title: 'Todo 1',
                    description: 'Description 1',
                    status: TodoStatus.open,
                  ),
                  Todo(
                    title: 'Todo 2',
                    description: 'Description 2',
                    status: TodoStatus.inProgress,
                  ),
                  Todo(
                    title: 'Todo 3',
                    description: 'Description 3',
                    status: TodoStatus.completed,
                  )
                ],
                emptyItemBuilder: (context) {
                  return Column(children: [
                    const SPText.title2('No data'),
                    SizedBox(height: AppTheme.of(context).spacing.regular),
                    SPButtonPrimary(title: 'Ajouter une tache', onTap: () {}),
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
