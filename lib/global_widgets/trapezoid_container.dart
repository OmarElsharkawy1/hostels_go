import 'package:flutter/material.dart';

class TrapozoidText extends StatelessWidget {
  final String text;
  const TrapozoidText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        TrapezoidContainer(
          width: MediaQuery.of(context).size.width / 2,
          height: 60.0,
          slantHeight: 70.0,
        ),
        //Text Hotel Search
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class TrapezoidContainer extends StatelessWidget {
  final double width;
  final double height;
  final double slantHeight;

  const TrapezoidContainer({
    super.key,
    required this.width,
    required this.height,
    required this.slantHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TrapezoidClipper(width, height, slantHeight),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.white, width: 3),
            ),
            color: Colors.indigo),
        width: width,
        height: height,
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  final double width;
  final double height;
  final double slantHeight;

  TrapezoidClipper(this.width, this.height, this.slantHeight);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, height);
    path.lineTo(width, height);
    path.lineTo(width - slantHeight, 0.0);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
