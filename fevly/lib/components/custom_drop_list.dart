import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/view_models/dropdown_model_view.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_header_drop_list.dart';

class CustomDropList extends StatelessWidget {
  const CustomDropList({
    required this.title,
    this.iconData,
    required this.listWidget,
    required this.addItemPress,
    this.displayButton = true,
  }) : assert(
            displayButton && iconData != null ||
                !displayButton && iconData == null,
            "Couldn't display the icon inside the textButton");

  final String title;
  final IconData? iconData;
  final bool displayButton;
  final List<Widget> listWidget;
  final GestureTapCallback addItemPress;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => DropDownModelView(),
      child: Consumer<DropDownModelView>(
        builder: (context, myListsModelView, child) => Column(
          children: [
            CustomHeaderDropList(
              myListsModelView: myListsModelView,
              title: title,
              press: () =>
                  myListsModelView.isExpanded = !myListsModelView.isExpanded,
              listLen: listWidget.length,
              button: displayButton
                  ? CustomTextButton(
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
                    )
                  : null,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            if (myListsModelView.isExpanded)
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
