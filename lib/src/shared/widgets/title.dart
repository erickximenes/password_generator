import 'package:flutter/material.dart';

class TitleRow extends StatefulWidget {
  String title;
  TitleRow({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _TitleRowState createState() => _TitleRowState();
}

class _TitleRowState extends State<TitleRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
