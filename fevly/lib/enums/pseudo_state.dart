import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

enum PseudoState {
  uninitialized,
  loading,
  success,
  error,
}

Widget? buildPseudoSuffixIcon({
  required PseudoState state,
  required BuildContext context,
}) {
  switch (state) {
    case PseudoState.success:
      return const Padding(
        padding: const EdgeInsets.only(right: 10, top: 4),
        child: Icon(Icons.check_circle_outline_rounded, color: kDoneColor),
      );
    case PseudoState.loading:
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(
            Theme.of(context).colorScheme.onBackground,
          ),
        ),
      );
    case PseudoState.error:
      return Padding(
        padding: const EdgeInsets.only(right: 10, top: 4),
        child: Icon(Icons.cancel, color: Theme.of(context).colorScheme.onError),
      );

    case PseudoState.uninitialized:
      return null;
  }
}
