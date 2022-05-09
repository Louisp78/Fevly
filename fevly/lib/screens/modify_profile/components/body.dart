import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/screens/modify_profile/components/modify_profile_form.dart';
import 'package:fevly/screens/settings/components/custom_lite_app_bar.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/test_data/data_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body();

  final user = FirebaseAuth.instance.currentUser; // user not null
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const CustomLiteAppBar(title: 'Modifer le profile'),
            if (user!.photoURL != null)
              CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL!),
                radius: size.width * 0.2,
              )
            else
              CustomCircleAvatar(
                press: () => Navigator.pushNamed(
                  context,
                  '/profile',
                  arguments: kCurrentUser,
                ),
                icon: const Icon(
                  Icons.person_rounded,
                  color: kPrimaryColor,
                ),
                backgroundColor: kSurfaceColor,
              ),
            SizedBox(height: kBasicVerticalPadding(size: size) * 2),
            ModifyProfileForm(),
          ],
        ),
      ),
    );
  }
}
