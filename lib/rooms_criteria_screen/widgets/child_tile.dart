import 'package:flutter/material.dart';

class ChildTile extends StatelessWidget {
  final int index;
  const ChildTile({required this.index, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListTile(
        leading: Text(
          'Age of child $index',
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        trailing: const Text(
          '14 years old',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
