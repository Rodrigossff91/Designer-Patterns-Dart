import 'package:compositepatterndart/feed/ifeed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Feed implements IFeed {
  final String text;
  final DateTime date;

  Feed({
    required this.text,
  }) : date = DateTime.now();

  @override
  Widget render() {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: renderContent(),
    );
  }

  @override
  Widget renderContent() {
    return Column(
      children: [Text(text), renderBottom()],
    );
  }

  @override
  Widget renderBottom() {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Text("Enviado em ${DateFormat('dd/MM/yyyy').format(date)}")
      ],
    );
  }
}
