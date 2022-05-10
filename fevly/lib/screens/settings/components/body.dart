import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/dialog/delete_account.dart';
import 'package:fevly/components/dialog/disconnect.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/model/option_item.dart';
import 'package:fevly/screens/reauthenticate/reauthenticate_screen.dart';
import 'package:fevly/screens/settings/components/custom_card.dart';
import 'package:fevly/screens/settings/components/custom_lite_app_bar.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/no_glow_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme themeColor = Theme.of(context).colorScheme;

    final List<OptionItem> options = [
      OptionItem(
        title: 'Politique de confidentialité',
        prefixWidget: const Icon(Icons.lock),
        onTap: () {},
      ),
      OptionItem(
        title: "Conditions d'utilisation",
        prefixWidget: const Icon(Icons.person_search_rounded),
        onTap: () => Navigator.pushNamed(context, '/terms_of_use'),
      ),
      OptionItem(
        title: 'Aide',
        prefixWidget: const Icon(Icons.help_outline_rounded),
        onTap: () {},
      ),
      OptionItem(
        title: 'Confidentialité du compte',
        prefixWidget: const Icon(Icons.admin_panel_settings_outlined),
        onTap: () {},
      ),
      OptionItem(
        title: 'Signaler un problème',
        prefixWidget: const Icon(Icons.bug_report_rounded),
        onTap: () {},
      ),
      OptionItem(
          title: 'Se déconnecter',
          prefixWidget: const Icon(Icons.logout_rounded),
          onTap: () => buildDisconnectDialog(context: context)),
      OptionItem(
        title: 'Supprimer le compte',
        prefixWidget: const Icon(Icons.delete_forever_rounded),
        onTap: () => buildDeleteAccountDialog(
          context: context,
          onRequiresRecentLogin: () => Navigator.pushNamed(
            context,
            '/reauthenticate',
            arguments: ReauthenticationType.deleteAccount,
          ),
        ),
      ),
    ];

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: size.width,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  appState
                      .signOut()
                      .then((value) => Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (Route<dynamic> route) => false,
                          ));
                },
                child: const CustomLiteAppBar(
                  title: 'Paramètres',
                ),
              ),

              // Custome Tile
              Expanded(
                child: SizedBox(
                  width: size.width * 0.85,
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: ListView.separated(
                      padding: EdgeInsets.only(
                          bottom: 60 + kBasicVerticalPadding(size: size)),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: size.height * 0.04),
                      itemCount: options.length,
                      itemBuilder: (context, index) => CustomCard(
                        title: options[index].title,
                        prefixWidget: options[index].prefixWidget,
                        suffixWidget: const Icon(Icons.arrow_forward_rounded),
                        onTap: options[index].onTap,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const CustomBottomBar(),
      ],
    );
  }
}
