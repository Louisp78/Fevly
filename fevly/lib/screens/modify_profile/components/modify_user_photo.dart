import 'dart:io';

import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/modify_profile/view_model/modify_profile_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/firestorage.dart';
import 'package:fevly/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class ModifyUserPhoto extends StatefulWidget {
  ModifyUserPhoto({required this.isLoading});

  bool isLoading;
  State<ModifyUserPhoto> createState() => _ModifyUserPhotoState();
}

class _ModifyUserPhotoState extends State<ModifyUserPhoto> {
  ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final ModifyProfileViewModel modifyVM =
        Provider.of<ModifyProfileViewModel>(context);

    final appState = Provider.of<ApplicationState>(context);
    final Size size = MediaQuery.of(context).size;
    final User? user = FirebaseAuth.instance.currentUser;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () async {
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          setState(() {
            modifyVM.newImage = File(image.path);
          });
        }
      },
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Builder(
            builder: (context) {
              if (widget.isLoading) {
                return SizedBox(
                  height: size.height * 0.10,
                  width: size.height * 0.10,
                  child: const RiveAnimation.asset(
                    'assets/anim/loading.riv',
                    animations: ['load'],
                  ),
                );
              }
              return Consumer<ModifyProfileViewModel>(
                  builder: (context, modifyVM, _) {
                if (modifyVM.newImage == null) {
                  if (user?.photoURL != null) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(user!.photoURL!),
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
                } else {
                  return CircleAvatar(
                    backgroundImage: FileImage(modifyVM.newImage!),
                    radius: size.width * 0.2,
                  );
                }
              });
            },
          ),
          if (!widget.isLoading)
            Positioned(
              top: -10,
              right: -10,
              child: Icon(Icons.edit_outlined, color: themeColor.onBackground),
            ),
        ],
      ),
    );
  }
}
