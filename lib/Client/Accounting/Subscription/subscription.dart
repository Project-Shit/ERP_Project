// @dart=2.9
import 'package:erp/Client/Accounting/Subscription/subscriptionDesktop.dart';
import 'package:erp/Client/Accounting/Subscription/subscriptionMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Subscription extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: SubscriptionMobile(),
      desktop: SubscriptionDesktop(),
    );
  }
}
