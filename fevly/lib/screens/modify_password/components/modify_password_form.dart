import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';
import 'package:fevly/components/snackbar/basic_snackbar.dart';
import 'package:fevly/validator.dart';
import 'package:fevly/screens/reauthenticate/reauthenticate_screen.dart';
import 'package:fevly/constant/auth_msg.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/constant/errors_msg.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:provider/provider.dart';

class ModifyPasswordForm extends StatefulWidget {
  ModifyPasswordForm({Key? key}) : super(key: key);

  @override
  State<ModifyPasswordForm> createState() => _ModifyPasswordFormState();
}

class _ModifyPasswordFormState extends State<ModifyPasswordForm> {
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  String? passwordErrorMsg;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;

    final ApplicationState appState = Provider.of<ApplicationState>(context);

    return Form(
      key: _formKey,
      child: Expanded(
        child: Column(
          children: [
            Spacer(),
            CustomTextField(
                error_msg: passwordErrorMsg,
                controller: _passwordController,
                hintText: 'Entrer un mot de passe',
                label_text: 'Nouveau mot de passe',
                textInputType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Kpassword_empty_error_msg;
                  } else if (passwordValidate(value)) {
                    return Kpassword_error_msg;
                  }
                  return null;
                }),
            SizedBox(height: kBasicVerticalPadding(size: size)),
            CustomTextField(
              hintText: 'Confirmer le mot de passe',
              label_text: 'Confirmer',
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty || value != _passwordController.text) {
                  return Kpassword_unmatch;
                } else {
                  return null;
                }
              },
            ),
            const Spacer(
              flex: 5,
            ),
            CustomLoadingButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  appState.updatePassword(
                      newPassword: _passwordController.text,
                      onNetworkRequestFailed: () => handleNetworkError(context),
                      onOperationNotAllowed: () =>
                          handleOperationNotAllowed(context),
                      onTooManyRequests: () => handleTooManyRequests(context),
                      onRequiresRecentLogin: () => Navigator.pushNamed(
                              context, '/reauthenticate',
                              arguments: {
                                'type': ReauthenticationType.changePassword,
                                'valueStr': _passwordController.text,
                              }),
                      onSuccess: () {
                        buildBasicSnackbar(
                            context: context, message: kPasswordUpdateSuccess);
                        Navigator.pop(context);
                      });
                }
                setState(() {
                  _isLoading = false;
                });
              },
              is_loading: _isLoading,
              text_not_loading: 'Valider',
              text_color_is_loading: themeColor.onBackground,
              background_color_is_loading: themeColor.onSurface,
            ),
            SizedBox(
              height: kBasicHorizontalPadding(size: size),
            ),
          ],
        ),
      ),
    );
  }
}
