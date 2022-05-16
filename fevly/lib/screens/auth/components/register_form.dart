import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/constant/errors_msg.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Form for new user to register
class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.email,
  });
  final String email;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _passwordController = TextEditingController();
  final _pseudoController = TextEditingController();
  final _nameController = TextEditingController();

  String? passwordErrorMsg;
  String? pseudoErrorMsg;

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final AuthViewModel authVM = Provider.of<AuthViewModel>(context);
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  child: AutoSizeText(
                    'Nouveau compte',
                    maxLines: 1,
                    style: textTheme.displayLarge,
                  ),
                ),
                Text(
                  widget.email,
                  style: textTheme.displayMedium!
                      .apply(color: themeColor.onPrimary),
                ),
                const Spacer(),
                CustomTextField(
                  error_msg: pseudoErrorMsg,
                  controller: _pseudoController,
                  hintStyle:
                      textTheme.bodyText1!.copyWith(color: themeColor.surface),
                  hintText: 'Entrer un pseudo',
                  label_text: 'Pseudo',
                  textInputType: TextInputType.name,
                  prefix: Text('@',
                      style: textTheme.headline3!
                          .copyWith(color: themeColor.onBackground)),
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
                  controller: _nameController,
                  hintText: 'Entrer un prénom et un nom',
                  label_text: 'Prénom et nom',
                  textInputType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Kname_error_msg;
                    }
                    return null;
                  },
                ),
                SizedBox(height: kBasicVerticalPadding(size: size)),
                CustomTextField(
                    error_msg: passwordErrorMsg,
                    controller: _passwordController,
                    hintText: 'Entrer un mot de passe',
                    label_text: 'Mot de passe',
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
                SizedBox(height: kBasicVerticalPadding(size: size)),
                SizedBox(
                  width: size.width * 0.8,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/terms_of_use'),
                    child: AutoSizeText(
                      "Voir les conditions d'utilisations",
                      style: textTheme.bodyText2
                          ?.copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: size.width * 0.7,
                    child: CustomLoadingButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          authVM.isLoading = true;
                          await appState.registerAccount(
                            emailAddress: widget.email,
                            name: _nameController.text,
                            pseudo: _pseudoController.text,
                            password: _passwordController.text,
                            onNetworkRequestFailed: () =>
                                handleNetworkError(context),
                            onOperationNotAllowed: () => setState(() {
                              pseudoErrorMsg = Koperation_not_allowed;
                            }),
                            onWeakPassword: () => setState(() {
                              passwordErrorMsg = Kpassword_error_long_msg;
                            }),
                            onTooManyRequests: () => setState(() {
                              pseudoErrorMsg = Ktoo_many_requests_error_msg;
                            }),
                            onSuccess: () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            ),
                          );
                          authVM.isLoading = false;
                        }
                      },
                      maxWidth: size.width * 0.7,
                      text_not_loading:
                          "Accepter les conditions d'utilisations",
                      text_color_is_loading: themeColor.onBackground,
                      background_color_is_loading: themeColor.onSurface,
                      is_loading: authVM.isLoading,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    passwordErrorMsg = null;
    super.dispose();
  }
}
