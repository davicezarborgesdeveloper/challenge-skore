import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skore/data/responses/responses.dart';

class ClassListItem extends StatelessWidget {
  final Discipline discipline;
  final VoidCallback onDelete;

  const ClassListItem(
      {required this.discipline, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(discipline.id!),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        title: Text(
          discipline.name ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Data: ${DateFormat('dd/MM/yyyy').format(discipline.createdAt ?? DateTime.now())}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 2),
            Text(
              'ID: ${discipline.id}',
              style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatusIndicator(),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: onDelete,
              color: Colors.red[300],
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    switch (discipline.status) {
      case DisciplineStatus.completed:
        return const Icon(Icons.check_circle, color: Colors.green);
      case DisciplineStatus.inProgress:
        return SizedBox(
          width: 45,
          child: Text(
            '${discipline.summary?.percentage ?? 0}%',
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case DisciplineStatus.notStarted:
        return const SizedBox(width: 45); // Apenas um espaço vazio
      default:
        return const SizedBox(width: 45);
    }
  }
}
