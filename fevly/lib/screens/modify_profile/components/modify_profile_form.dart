import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/components/snackbar/basic_snackbar.dart';
import 'package:fevly/constant/auth_msg.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/constant/errors_msg.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/model/user_infos.dart';
import 'package:fevly/screens/modify_profile/view_model/modify_profile_view_model.dart';
import 'package:fevly/screens/reauthenticate/reauthenticate_screen.dart';
import 'package:fevly/screens/settings/components/custom_card.dart';
import 'package:fevly/service/application_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModifyProfileForm extends StatelessWidget {
  ModifyProfileForm();

  final _formKey = GlobalKey<FormState>(debugLabel: 'ModifyProfileForm');

  final _displayName = TextEditingController();

  final _pseudo = TextEditingController();

  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final user = appState.userLastInstance;
    final Size size = MediaQuery.of(context).size;
    final ModifyProfileViewModel modifyVM =
        Provider.of<ModifyProfileViewModel>(context);
    final CurrentUserInfos? userInfos = appState.userInfos;
    final textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;

    final String? helperMsg = modifyVM.requestedEmail != null &&
            modifyVM.requestedEmail != user?.email
        ? "Verifier l'email ${modifyVM.requestedEmail}"
        : null;
    _email.text = appState.userLastInstance!.email!;
    _displayName.text = '${appState.userLastInstance?.displayName}';
    _pseudo.text = appState.userInfos!.pseudo;
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
                controller: _pseudo,
                hintText: 'Entrer un pseudo',
                label_text: 'Pseudo',
                prefix: Text('@',
                    style: textTheme.headline3!
                        .copyWith(color: themeColor.onBackground)),
                textInputType: TextInputType.name,
                validator: (value) {
                  // TODO : check if pseudo exist in db
                  if (value!.isEmpty) {
                    return Kpseudo_error_msg;
                  } else if (value.contains('@') || value.contains(' ')) {
                    return Kwrong_pseudo_error_msg;
                  }
                  return null;
                },
              ),
              SizedBox(height: kBasicVerticalPadding(size: size)),
              CustomTextField(
                hintText: 'Email',
                controller: _email,
                helper_msg: helperMsg,
                textInputType: TextInputType.emailAddress,
                label_text: 'Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un email';
                  }
                  return null;
                },
              ),
              SizedBox(height: kBasicVerticalPadding(size: size) * 2),
              if (appState.authProvider == AuthProvider.emailPassword)
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
                        await appState.updateDisplayName(
                          newName: _displayName.text,
                          onSuccess: () => buildBasicSnackbar(
                              context: context,
                              message: 'Votre nom a été mis à jour ✔️'),
                          onNetworkRequestFailed: () =>
                              handleNetworkError(context),
                          onOperationNotAllowed: () =>
                              handleOperationNotAllowed(context),
                          onTooManyRequests: () =>
                              handleTooManyRequests(context),
                        );
                      }
                      // Pseudo update
                      /// check if pseudo is already used and update it
                      if (_pseudo.text != userInfos!.pseudo) {
                        await appState.updatePseudo(
                          userId: user.uid,
                          newPseudo: _pseudo.text,
                          onSuccess: () => buildBasicSnackbar(
                              context: context,
                              message: 'Votre pseudo a été mis à jour ✔️'),
                          onNetworkRequestFailed: () =>
                              handleNetworkError(context),
                          onOperationNotAllowed: () =>
                              handleOperationNotAllowed(context),
                          onTooManyRequests: () =>
                              handleTooManyRequests(context),
                        );
                      }

                      /// Email update
                      /// Must be the last update
                      if (_email.text != user.email) {
                        await appState.updateEmailAddress(
                            onNetworkRequestFailed: () =>
                                handleNetworkError(context),
                            onOperationNotAllowed: () =>
                                handleOperationNotAllowed(context),
                            onTooManyRequests: () =>
                                handleTooManyRequests(context),
                            onRequiresRecentLogin: () => Navigator.pushNamed(
                                  context,
                                  '/reauthenticate',
                                  arguments: {
                                    'type': ReauthenticationType.changeEmail,
                                    'valueStr': _email.text
                                  },
                                ),
                            onEmailAlreadyInUse: () {
                              buildBasicSnackbar(
                                  context: context,
                                  message: kEmailAlreadyInUse);
                              _email.text = user.email!;
                            },
                            onSuccess: () async {
                              buildBasicSnackbar(
                                context: context,
                                message: kEmailValidateToContinue(
                                    newEmail: _email.text),
                              );
                              await appState.sendEmailVerification(
                                onNetworkRequestFailed: () =>
                                    handleNetworkError(context),
                                onTooManyRequests: () =>
                                    handleTooManyRequests(context),
                                onOperationNotAllowed: () =>
                                    handleOperationNotAllowed(context),
                                onSuccess: () =>
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/', (route) => false),
                              );
                            },
                            newEmailAddress: _email.text);
                      }
                    }
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
