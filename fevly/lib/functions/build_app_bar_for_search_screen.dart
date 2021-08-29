import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/models/guest_list.dart';
import 'package:flutter/material.dart';

//$ METHOD
//$ =================================
CustomBasicAppBar buildAppBarForSearchScreen(
    GuestList guestList, BuildContext context) {
  return CustomBasicAppBar(
    title: guestList.name,
    subtitleText: guestList.numberOfGuests > 1
        ? "${guestList.numberOfGuests} invités"
        : "${guestList.numberOfGuests} invité",
    iconData: Icons.arrow_back_ios_rounded,
    press: () => Navigator.pop(context),
  );
}
