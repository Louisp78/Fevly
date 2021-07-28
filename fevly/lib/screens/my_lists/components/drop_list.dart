import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/models/dropdown.dart';

import 'package:fevly/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_header_drop_list.dart';

class DropList extends StatelessWidget {
  const DropList({
    Key? key,
    required this.title,
    required this.iconData,
    required this.listWidget,
    required this.addItemPress,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final List<Widget> listWidget;
  final GestureTapCallback addItemPress;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => Dropdown(isExpanded: false),
      child: Consumer<Dropdown>(
        builder: (context, dropdown, child) => Column(
          children: [
            CustomHeaderDropList(
              dropdown: dropdown,
              title: title,
              press: () => dropdown.expandState = !dropdown.expandState,
              listLen: listWidget.length,
              button: CustomTextButton(
                press: addItemPress,
                text: "Ajouter",
                buttonSize: const CustomTextButtonSize.small(),
                suffixIcon: Icon(
                  iconData,
                  color: kDarkerTextColor,
                  size: 14,
                ),
                backgroundColor: kSurfaceColor,
                textColor: kDarkerTextColor,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            if (dropdown.expandState)
              SingleChildScrollView(
                child: Column(
                  children: listWidget,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
