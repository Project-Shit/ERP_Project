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
            color: PrimaryColor,
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
            padding: EdgeInsets.only(top: height * 0.15),
            color: HoverColor,
            width: width,
            height: height * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/timetable.png',
                      width: width * 0.16,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      'Keep every thing on schedule '
                      '\nand organize your meeting'
                      '\n and events',
                      style: TextStyle(
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.06,
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/phone.png',
                      width: width * 0.16,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      'Be Updated all the time and Follow '
                      '\nyour company progress from any '
                      '\nware with the mobile application',
                      style: TextStyle(
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.06,
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/wallet.png',
                      width: width * 0.16,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      'Select Your Pricing Plane '
                      '\naccording to your company '
                      '\nneeds and save money',
                      style: TextStyle(
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: width * 0.25,
              )
            ],
          ),
        ],
        footer: new Footer(
          child: CustomFooter(),
        ),
      ),
    );
  }
}
