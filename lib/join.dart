import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swedish_apaches/widgets.dart';

class JoinSection extends StatefulWidget {
  final Function(String) onSubscribePressed;
  JoinSection({this.onSubscribePressed});
  @override
  _JoinSectionState createState() => _JoinSectionState();
}

class _JoinSectionState extends State<JoinSection> {
  final style = TextStyle(
      fontSize: 28,
      color: Colors.white
  );

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    screenWidth *= screenWidth < 900? .8:.25;
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(30),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 10,
        spacing: 25,
        children: [
          Icon(Icons.mail, color: Colors.white, size: 45),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('JOIN OUR NEWSLETTER',
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
          MyTextField('email', screenWidth,
            controller: _textEditingController,
          ),
          FlatButton(
            hoverColor: Colors.lightGreen,
            padding: const EdgeInsets.all(15),
            color: Colors.grey,
            child: Text('SUBSCRIBE', style: style),
            onPressed: () => widget.onSubscribePressed(_textEditingController.text),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}