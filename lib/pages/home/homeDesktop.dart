import 'package:erb/widget/appBar/appBar.dart';
import 'package:erb/widget/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:erb/constants.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:footer/footer.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:footer/footer_view.dart';

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: CustomAppBar(),
      ),
      body: FooterView(
        flex: 8,
        children: [
          Container(
            color: Colors.white,
            width: width,
            height: height,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/home.png',
                      width: width * 0.3,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create your own System with Web Hosting',
                      style: TextStyle(
                        color: TextColor,
                        fontSize: width * 0.03,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go Serverless and Pay only for what you use',
                      style: TextStyle(
                        color: TextColor,
                        fontSize: width * 0.02,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/down.png',
                      width: height * 0.1,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.07,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            width: width,
            height: height,
            child: Row(
              children: [],
            ),
          ),
        ],
        footer: new Footer(
          child: CustomFooter(),
        ),
      ),
    );
  }
}
