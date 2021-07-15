import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
