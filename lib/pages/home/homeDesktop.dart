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
      body: FooterView(
        flex: 8,
        children: [
          Container(
            child: CustomAppBar(),
            height: 70,
          ),
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
                      width: width * 0.25,
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
                        fontSize: width * 0.026,
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
                        fontSize: width * 0.016,
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
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: height * 0.35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(width, 200),
              ),
              color: HoverColor,
            ),
            width: width,
            height: height,
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
          Container(
            padding: EdgeInsets.only(top: 70),
            height: height * 0.75,
            width: width,
            color: PrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'About us',
                      style: TextStyle(
                        color: TextColor,
                        fontSize: width * 0.022,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    labelButton(
                      'Our Company',
                      () {},
                    ),
                    labelButton(
                      'Contact us',
                      () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    labelButton(
                      'Privacy',
                      () {},
                    ),
                    labelButton(
                      'Security',
                      () {},
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.06,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Services',
                      style: TextStyle(
                        color: TextColor,
                        fontSize: width * 0.022,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    labelButton(
                      'Local Hosting',
                      () {},
                    ),
                    labelButton(
                      'Cloud Hosting',
                      () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    labelButton(
                      'Support',
                      () {},
                    ),
                    labelButton(
                      'Upgrade',
                      () {},
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.30,
                ),
                Column(
                  children: [
                    Text(
                      'Get the Mobile App',
                      style: TextStyle(
                        color: TextColor,
                        fontSize: width * 0.03,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      color: SecondaryColor,
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 35,
                        right: 35,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/android.png',
                            height: 60,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Download for Android',
                            style: TextStyle(
                              fontSize: 30,
                              color: PrimaryColor,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      color: SecondaryColor,
                      padding: EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 35,
                        right: 35,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/ios.png',
                            height: 70,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Download for IOS',
                            style: TextStyle(
                              fontSize: 30,
                              color: PrimaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
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
