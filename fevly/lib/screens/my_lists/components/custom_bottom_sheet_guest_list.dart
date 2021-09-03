import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/general.dart';
import 'package:fevly/models/guest_list.dart';
import 'package:fevly/test/data_guest_list.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomBottomSheetGuestList extends StatelessWidget {
  const CustomBottomSheetGuestList({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ThemeColor themeColor = initThemeColor(context: context);
    return ChangeNotifierProvider(
      create: (context) => TextFieldModelView<GuestList>(),
      child: Consumer<TextFieldModelView<GuestList>>(
        builder: (context, textFieldProvider, child) =>
            Stack(clipBehavior: Clip.none, children: [
          Container(
            alignment: Alignment.center,
            height:
                textFieldProvider.selection ? size.height : size.height * 0.4,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.03),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(69),
                topRight: Radius.circular(69),
              ),
              color: themeColor.kSurfaceLightColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: AutoSizeText(
                    title,
                    maxLines: 1,
                    style: textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (textFieldProvider.selection)
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                if (!textFieldProvider.selection) const Spacer(),
                Focus(
                  onFocusChange: (focus) => textFieldProvider.selection = focus,
                  child: CustomTextField(
                    onChanged: (value) {
                      textFieldProvider.textValue = value;
                    },
                    onSaved: (value) {},
                    validator: (value) {},
                    width: size.width * 0.6,
                    height: 35,
                    decoration: basicInputDecoration(
                        hintStyle: kBottomSheetHintStyle(textTheme: textTheme),
                        hintText: "Nom de la liste"),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: size.width * 0.6,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: themeColor.kSurfaceLightColor,
                      boxShadow: [kShadowBase]),
                  child: DropdownButton<GuestList>(
                    value: textFieldProvider.value,
                    hint: SizedBox(
                      width: size.width * 0.5 - 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            textFieldProvider.value != null
                                ? cast<GuestList>(textFieldProvider.value)!.name
                                : "Dupliquer une liste",
                            maxLines: 1,
                            style: textTheme.headline5,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    icon: const Icon(Icons.expand_more_rounded),
                    elevation: 16,
                    style: textTheme.headline5,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (GuestList? newValue) {
                      textFieldProvider.value = newValue;
                    },
                    items: [...guestListListForDropdown, null]
                        .map<DropdownMenuItem<GuestList>>((GuestList? list) {
                      return DropdownMenuItem<GuestList>(
                        value: list,
                        child: Text(
                            list != null ? list.name : "Dupliquer une liste",
                            style: list == null
                                ? textTheme.headline5
                                    ?.copyWith(color: themeColor.kPrimaryColor)
                                : null),
                      );
                    }).toList(),
                  ),
                ),
                const Spacer(),
                CustomTextButton(
                  press: () {},
                  text: "Ajouter",
                  isActive: textFieldProvider.textValue.isNotEmpty,
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            right: 10,
            child: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close_rounded),
            ),
          ),
        ]),
      ),
    );
  }
}
