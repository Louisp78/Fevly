import 'dart:io';

import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/modify_profile/modify_profile_screen.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/firestorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/screens/modify_profile/components/modify_profile_form.dart';
import 'package:fevly/screens/settings/components/custom_lite_app_bar.dart';
import 'package:fevly/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

/// Body of the [ModifyProfileScreen]
class Body extends StatefulWidget {
  const Body();

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ImagePicker _picker = ImagePicker();
    final appState = Provider.of<ApplicationState>(context);
    final user = appState.userLastInstance;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const CustomLiteAppBar(title: 'Modifer le profile'),
            GestureDetector(
              onTap: () async {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    isLoading = true;
                  });

                  /// upload image to firestorage
                  /// and update user photo url
                  await FireStorage.uploadProfilePhoto(
                          FirebaseAuth.instance.currentUser!.uid,
                          File(image.path))
                      .then((imageUrl) => appState.updatePhotoUrl(
                          newPhotoUrl: imageUrl,
                          onNetworkRequestFailed: () =>
                              handleNetworkError(context),
                          onTooManyRequests: () =>
                              handleTooManyRequests(context),
                          onOperationNotAllowed: () =>
                              handleOperationNotAllowed(context)));
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                } else {
                  // Nothing selected
                }
              },
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Builder(
                    builder: (context) {
                      if (isLoading) {
                        return SizedBox(
                          height: size.height * 0.10,
                          width: size.height * 0.10,
                          child: const RiveAnimation.asset(
                            'assets/anim/loading.riv',
                            animations: ['load'],
                          ),
                        );
                      }
                      if (user!.photoURL != null) {
                        return CircleAvatar(
                          backgroundImage: NetworkImage(user.photoURL!),
                          radius: size.width * 0.2,
                        );
                      } else {
                        return CustomCircleAvatar(
                          radius: size.width * 0.2,
                          icon: Icon(
                            Icons.person_rounded,
                            color: kPrimaryColor,
                            size: size.width * 0.15,
                          ),
                          backgroundColor: kSurfaceColor,
                        );
                      }
                    },
                  ),
                  if (!isLoading)
                    Positioned(
                      top: -10,
                      right: -10,
                      child: Icon(Icons.edit_outlined,
                          color: themeColor.onBackground),
                    ),
                ],
              ),
            ),
            SizedBox(height: kBasicVerticalPadding(size: size) * 2),
            ModifyProfileForm(),
          ],
        ),
      ),
    );
  }
}
