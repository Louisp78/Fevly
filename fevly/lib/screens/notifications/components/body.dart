import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/custom_notification.dart';
import 'package:flutter/material.dart';
import 'custom_notification_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.listNotifications}) : super(key: key);

  final List<CustomNotification> listNotifications;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 110),
            child: Column(
              children: [
                SizedBox(height: kBasicVerticalPadding(size: size)),
                ...List.generate(listNotifications.length, (index) {
                  final currentNotification = listNotifications[index];
                  return CustomNotificationItem(
                    title: currentNotification.title,
                    subtitle: currentNotification.subtitle,
                    leadingIcon: Icon(
                      currentNotification.leadingIcon,
                      color: Colors.white,
                    ),
                    date: currentNotification.date,
                  );
                })
              ],
            ),
          ),
          CustomBasicAppBar(
            title: "Notifications",
            press: () {},
            subtitleText: "${listNotifications.length} notifications",
          ),
          const Positioned(bottom: 0, child: CustomBottomBar()),
        ],
      ),
    );
  }
}
