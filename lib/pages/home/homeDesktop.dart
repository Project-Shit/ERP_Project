import 'package:erb/widget/appBar/appBar.dart';
import 'package:flutter/material.dart';
import 'package:erb/constants.dart';

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: CustomAppBar(),
      ),
      body: Container(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
