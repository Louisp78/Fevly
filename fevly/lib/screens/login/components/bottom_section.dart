import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.width,
      height: size.height * 0.22,
      decoration: const BoxDecoration(
        color: kPrimaryVariantColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(83),
          topRight: Radius.circular(83),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextButton(press: () {}, text: "Connexion"),
          SizedBox(
            height: size.height * 0.025,
          ),
          CustomTextButton(
            press: () {},
            text: "Via Google",
            prefixIcon: SvgPicture.asset(
              "assets/icons/google.svg",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
