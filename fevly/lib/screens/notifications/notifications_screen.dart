import 'package:fevly/screens/notifications/components/body.dart';
import 'package:fevly/test_data/data_notification.dart';
import 'package:flutter/material.dart';

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
