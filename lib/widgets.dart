import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final double size;
  const LogoImage([this.size = 125]);
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(size),
      child: const Image(
        image: const AssetImage('images/logo.png'),
      ),
    );
  }
}


const HOME_IMAGE =  "/assets/images/home-icon.svg";

class HomeImage extends StatelessWidget {
  const HomeImage();
  @override
  Widget build(BuildContext context) {
    return Image.network(
      '$HOME_IMAGE',
      width: 28,
      height: 28,
      fit: BoxFit.cover,
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.placeHolder, this.width, {this.controller});

  final String placeHolder;
  final double width;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(10);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: radius,
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: radius,
          ),
          labelText: placeHolder,
        ),
      ),
      width: width,
    );
  }

}
