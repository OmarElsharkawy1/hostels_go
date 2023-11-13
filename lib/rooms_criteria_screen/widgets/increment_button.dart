import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {
  final int counter;
  final Function increaseCounter;
  final Function decreaseCounter;
  const IncrementButton(
      {required this.counter,
      required this.increaseCounter,
      required this.decreaseCounter,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            // alignment: Alignment.topCenter,
            width: 40,
            height: 30,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => decreaseCounter(),
              icon: const Icon(
                Icons.remove,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Text(
            '$counter',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            // alignment: Alignment.topCenter,
            width: 40,
            height: 30,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => increaseCounter(),
              icon: const Icon(
                Icons.add,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
