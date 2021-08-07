import 'package:fevly/view_models/dropdown_model_view.dart';
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
      create: (context) => DropDownModelView(),
      child: Consumer<DropDownModelView>(
        builder: (context, dropdown, child) => Column(
          children: [
            CustomHeaderDropList(
              dropdown: dropdown,
              title: title,
              press: () => dropdown.isExpanded = !dropdown.isExpanded,
              listLen: listWidget.length,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            if (dropdown.isExpanded)
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
