import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/models/user.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.profileOwner}) : super(key: key);

  final User profileOwner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
      body: Body(
        profileOwner: profileOwner,
      ),
    );
  }
}
