import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/functions/create_new_from.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/profile/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.profileOwner}) : super(key: key);

  final User profileOwner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
      body: ChangeNotifierProvider(
        create: (context) => createNewUserFrom(source: profileOwner),
        child: Consumer<User>(
          builder: (context, user, child) => Body(
            profileOwner: user,
          ),
        ),
      ),
    );
  }
}
