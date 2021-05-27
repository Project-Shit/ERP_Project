import 'package:flutter/material.dart';

// Footer for main system
class CustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Media query object to make footer responsive
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/copyright.png',
            width: 20,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            'All Right Reserved by Nerd\'s Team',
          ),
        ],
      ),
    );
  }
}
