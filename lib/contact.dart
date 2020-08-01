import 'package:flutter/material.dart';
import 'package:swedish_apaches/widgets.dart';



class ContactSection extends StatelessWidget {
  const ContactSection();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    screenWidth *= screenWidth < 800? .8:.4;
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text('Contact',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceAround,
            //spacing: 30,
            runSpacing: 50,
            children: [
              Container(
                width: screenWidth,
                padding: const EdgeInsets.only(left: 50, top: 25),
                child: Column(
                  children: [
                    const InfoField(Icons.location_on, 'Strandvägen 1, Stockholm, Sweden'),
                    const InfoField(Icons.phone, '+46 (722) 03 4216'),
                    const InfoField(Icons.mail, 'theswedishapaches@gmail.com'),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: const Text('Leave us a message'),
                    ),
                    const MyTextField('name', 350),
                    const MyTextField('email', 350),
                    const MyTextField('message', 350),
                    FlatButton(
                      color: Colors.amberAccent,
                      child: Text('SEND'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}

class InfoField extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoField(this.icon, this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Text(text),
          ),
        ),
      ],
    );
  }

}