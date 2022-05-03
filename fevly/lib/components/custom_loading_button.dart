import 'package:flutter/material.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:rive/rive.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton(
      {required this.onPressed,
      required this.is_loading,
      required this.text_not_loading,
      required this.background_color_is_loading,
      this.background_color_not_loading,
      required this.text_color_is_loading,
      this.text_color_not_loading,
      this.text_is_loading = 'Chargement',
      this.maxWidth = double.infinity});

  final GestureTapCallback onPressed;
  final bool is_loading;
  final String text_is_loading;
  final String text_not_loading;
  final Color? background_color_is_loading;
  final Color? background_color_not_loading;
  final Color? text_color_is_loading;
  final Color? text_color_not_loading;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomTextButton(
      press: onPressed,
      text: is_loading ? text_is_loading : text_not_loading,
      textColor: is_loading ? text_color_is_loading : text_color_not_loading,
      backgroundColor: is_loading
          ? background_color_is_loading
          : background_color_not_loading,
      suffixIcon: is_loading
          ? SizedBox(
              height: size.height * 0.03,
              width: size.height * 0.03,
              child: const RiveAnimation.asset(
                'assets/anim/loading.riv',
                animations: ['load'],
              ),
            )
          : null,
      maxWidth: maxWidth,
    );
  }
}
