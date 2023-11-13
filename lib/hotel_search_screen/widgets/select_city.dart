import 'package:flutter/material.dart';

class SelectCity extends StatelessWidget {
  const SelectCity({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(6),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 3.1),
          hintStyle: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 18,
          ),
          hintText: 'Select City',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
