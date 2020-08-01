import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  AboutSection({this.paragraphs});

  final List<String> paragraphs;
  final style = GoogleFonts.cardo(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    screenWidth *= screenWidth < 800? .8:.4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        spacing: 25,
        children: [
          Container(
            width: screenWidth,
            child: Text(paragraphs[0], style: style),
          ),
          Container(
            width: screenWidth,
            child: Text(paragraphs[1], style: style),
          )
        ],
      ),
    );
  }

}