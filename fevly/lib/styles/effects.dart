import 'package:flutter/material.dart';

import 'colors.dart';

/// Inner shadow
final BoxShadow kInnerShadow = BoxShadow(
  blurRadius: 10,
  offset: const Offset(0, 4),
  color: Colors.black.withOpacity(0.05),
);

/// Basic Shadow
final BoxShadow kShadowBase = BoxShadow(
  blurRadius: 40,
  offset: const Offset(0, 4),
  color: Colors.black.withOpacity(0.1),
);

/// Shadow for bottom bar
final BoxShadow kShadowBottomBar = BoxShadow(
  blurRadius: 40,
  offset: const Offset(0, -4),
  color: Colors.black.withOpacity(0.1),
);

/// [only for dark theme] Basic Shadow
final BoxShadow kDarkShadowBase = BoxShadow(
  blurRadius: 40,
  offset: const Offset(0, 4),
  color: Colors.black.withOpacity(0.25),
);

/// Shadow for pop up
final BoxShadow kShadowPopup = BoxShadow(
  blurRadius: 40,
  offset: const Offset(0, 4),
  color: Colors.black.withOpacity(0.17),
);

/// Shadow for profile card
final BoxShadow kShadowProfileCard = BoxShadow(
  blurRadius: 15,
  offset: const Offset(0, 7),
  color: kPrimaryColor.withOpacity(0.5),
);
