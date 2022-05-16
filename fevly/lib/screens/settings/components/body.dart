import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/settings/components/custom_card.dart';
import 'package:fevly/screens/settings/components/custom_lite_app_bar.dart';
import 'package:fevly/screens/settings/components/options.dart';
import 'package:fevly/screens/settings/settings_screen.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/no_glow_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Body of the [SettingsScreen]
class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final Size size = MediaQuery.of(context).size;

    final options = buildOptions(context: context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: size.width,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  appState.signOut(
                    onSuccess: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (Route<dynamic> route) => false,
                    ),
                    onNetworkRequestFailed: () => handleNetworkError(context),
                    onOperationNotAllowed: () =>
                        handleOperationNotAllowed(context),
                    onTooManyRequests: () => handleTooManyRequests(context),
                  );
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
