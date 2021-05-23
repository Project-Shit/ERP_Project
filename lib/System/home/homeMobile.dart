import 'package:erp/widget/drawer/drawer.dart';
import 'package:erp/widget/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:erp/constants.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:footer/footer.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:footer/footer_view.dart';

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: AppBar(
          iconTheme: IconThemeData(
            color: TextColor,
          ),
          backgroundColor: PrimaryColor,
          actions: [
            Image.asset(
              'assets/logo.png',
              width: width * 0.5,
            ),
            SizedBox(
              width: width * 0.22,
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: FooterView(
        flex: 8,
        children: [
          Container(
            width: width,
            height: height * 0.88,
            color: PrimaryColor,
            padding: EdgeInsets.only(
              top: 30,
              right: 10,
              left: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/home.png',
                  width: width * 0.6,
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create your own System \nwith Web Hosting',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TextColor,
                        fontSize: width * 0.075,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.034,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go Serverless and Pay \nonly for what you use',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TextColor,
                        fontSize: width * 0.065,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.064,
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
            padding: EdgeInsets.only(
              top: height * 0.12,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(width, 130),
              ),
              color: HoverColor,
            ),
            width: width,
            height: height,
            child: Column(
              children: [
                Image.asset(
                  'assets/timetable.png',
                  width: width * 0.25,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Keep every thing on schedule '
                  '\nand organize your meeting'
                  '\n and events',
                  style: TextStyle(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Image.asset(
                  'assets/phone.png',
                  width: width * 0.25,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Be Updated all the time and '
                  '\nFollow your company progress '
                  '\nfrom any ware with the '
                  '\nmobile application',
                  style: TextStyle(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Image.asset(
                  'assets/wallet.png',
                  width: width * 0.25,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Select Your Pricing Plane '
                  '\naccording to your company '
                  '\nneeds and save money',
                  style: TextStyle(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: width * 0.65,
              )
            ],
          ),
          Container(
            color: PrimaryColor,
            width: width,
            height: height * 0.8,
            padding: EdgeInsets.only(
              top: height * 0.05,
              right: width * 0.1,
              left: width * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get the Mobile App',
                  style: TextStyle(
                    color: TextColor,
                    fontSize: width * 0.09,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  color: SecondaryColor,
                  padding: EdgeInsets.only(
                    top: 7,
                    bottom: 7,
                    left: 25,
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
                        height: height * 0.07,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Download for Android',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          color: TextColor,
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
                    top: 7,
                    bottom: 7,
                    left: 25,
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
                        height: height * 0.07,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Download for IOS',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          color: TextColor,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About us',
                          style: TextStyle(
                            color: TextColor,
                            fontSize: width * 0.07,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
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
                          height: height * 0.01,
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
                      width: width * 0.15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Services',
                          style: TextStyle(
                            color: TextColor,
                            fontSize: width * 0.07,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
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
                          height: height * 0.01,
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
