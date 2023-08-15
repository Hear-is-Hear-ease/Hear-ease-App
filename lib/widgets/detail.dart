import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  final String? babyState;
  const DetailWidget({super.key, required this.babyState});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.84;
    return SizedBox(
      height: containerHeight,
      child: Center(
        child: Text(
          widget.babyState ?? 'Null',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
