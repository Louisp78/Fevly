import 'package:fevly/test/data_notification.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        listNotifications: listOfNotifications1,
      ),
    );
  }
}
