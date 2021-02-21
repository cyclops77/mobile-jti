import 'package:flutter/material.dart';

class PopinText extends StatelessWidget {
  final String isi;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextAlign arah;
  final int line;

  PopinText(
      {this.isi,
      this.size,
      this.weight,
      this.color = Colors.black,
      this.arah = TextAlign.start,
      this.line = 1});
  @override
  Widget build(BuildContext context) {
    return Text(isi.toString(),
        maxLines: line,
        overflow: TextOverflow.ellipsis,
        textAlign: arah,
        style: TextStyle(
          fontFamily: "popin",
          fontSize: size,
          color: color,
          letterSpacing: 1,
          fontWeight: weight,
        ));
  }
}
