import 'package:fevly/screens/modify_profile/modify_profile_screen.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/screens/modify_profile/components/modify_profile_form.dart';
import 'package:fevly/screens/settings/components/custom_lite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Body of the [ModifyProfileScreen]
class Body extends StatefulWidget {
  const Body();

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final appState = Provider.of<ApplicationState>(context);
    final user = appState.userLastInstance;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomLiteAppBar(title: 'Modifer le profile'),
              const ModifyProfileForm(),
            ],
          ),
        ),
      );
    });
  }
}
