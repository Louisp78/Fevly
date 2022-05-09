import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/components/snackbar/basic_snackbar.dart';
import 'package:fevly/constant/auth_msg.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/screens/modify_profile/view_model/modify_profile_view_model.dart';
import 'package:fevly/screens/reauthenticate/reauthenticate_screen.dart';
import 'package:fevly/screens/settings/components/custom_card.dart';
import 'package:fevly/service/application_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModifyProfileForm extends StatelessWidget {
  ModifyProfileForm();

  final _formKey = GlobalKey<FormState>(debugLabel: 'ModifyProfileForm');

  final _displayName = TextEditingController();

  final _pseudo = TextEditingController(
    text: 'llouisp78',
  );

  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final user = appState.userLastInstance;
    final Size size = MediaQuery.of(context).size;
    final ModifyProfileViewModel modifyVM =
        Provider.of<ModifyProfileViewModel>(context);

    String? helper_msg = modifyVM.requestedEmail != null &&
            modifyVM.requestedEmail != user?.email
        ? "Verifier l'email ${modifyVM.requestedEmail}"
        : null;
    _email.text = '${appState.userLastInstance?.email}';
    _displayName.text = '${appState.userLastInstance?.displayName}';
    print('user from firebase instance: ${FirebaseAuth.instance.currentUser}');
    return Form(
      key: _formKey,
      child: Expanded(
        child: SizedBox(
          width: size.width * 0.8,
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Prénom et nom',
                controller: _displayName,
                label_text: 'Prénom et nom',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre prénom et nom';
                  }
                  return null;
                },
              ),
              SizedBox(height: kBasicVerticalPadding(size: size)),
              CustomTextField(
                hintText: 'Pseudo',
                controller: _pseudo,
                label_text: 'Pseudo',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre pseudo';
                  }
                  return null;
                },
              ),
              SizedBox(height: kBasicVerticalPadding(size: size)),
              CustomTextField(
                hintText: 'Email',
                controller: _email,
                helper_msg: helper_msg,
                label_text: 'Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un email';
                  }
                  return null;
                },
              ),
              SizedBox(height: kBasicVerticalPadding(size: size) * 2),
              CustomCard(
                title: 'Changer de mot de passe',
                onTap: () =>
                    Navigator.pushNamed(context, '/profile/modify/password'),
                prefixWidget: const Icon(Icons.lock_outline_rounded),
                suffixWidget: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              const Spacer(),
              CustomTextButton(
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      // Display name update
                      if (_displayName.text != user!.displayName) {
                        print('update display name : $_displayName');
                        await appState
                            .updateDisplayName(newName: _displayName.text)
                            .then((value) => buildBasicSnackbar(
                                context: context,
                                message: 'Votre nom a été mis à jour ✔️'));
                      }
                      // Pseudo update
                      /// TODO : check if pseudo is already used and update it

                      // Email update
                      if (_email.text != user.email) {
                        print('update email : $_email');
                        await appState.updateEmailAddress(
                            onRequiresRecentLogin: () => Navigator.pushNamed(
                                  context,
                                  '/reauthenticate',
                                  arguments: {
                                    'type': ReauthenticationType.changeEmail,
                                    'valueStr': _email.text
                                  },
                                ),
                            onEmailAlreadyInUse: () => buildBasicSnackbar(
                                context: context, message: kEmailAlreadyInUse),
                            onSucess: () {
                              buildBasicSnackbar(
                                context: context,
                                message: kEmailValidateToContinue(
                                    newEmail: _email.text),
                              );
                              modifyVM.requestedEmail = _email.text;
                            },
                            newEmailAddress: _email.text);
                      }

                      // Password update
                      /*if (_password.text.isNotEmpty) {
                        print('update password : $_password');
                        await appState.updatePassword(
                            newPassword: _password.text,
                            onRequiresRecentLogin: () =>
                                Navigator.pushNamed(
                                    context, '/reauthenticate',
                                    arguments: ReauthenticationType
                                        .changePassword),
                            onSuccess: () => buildBasicSnackbar(
                                context: context,
                                message: kPasswordUpdateSuccess));
                      }*/
                    } else {}
                  },
                  text: 'Sauvegarder'),
              SizedBox(height: kBasicVerticalPadding(size: size)),
            ],
          ),
        ),
      ),
    );
  }
}
