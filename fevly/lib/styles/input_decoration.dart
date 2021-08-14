import 'package:fevly/constant.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration basicInputDecoration(
        {required TextStyle hintStyle, required String hintText}) =>
    InputDecoration(
      filled: true,
      hintText: hintText,
      fillColor: kSurfaceLightColor,
      hintStyle: hintStyle,
      contentPadding: const EdgeInsets.only(
        bottom: 5.0,
        left: 20.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: kPrimaryColor,
          width: 3.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: kErrorColor,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: kErrorColor,
          width: 3.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: kTextColor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

InputDecoration smallSearchInputDecoration(
        {required TextStyle hintStyle,
        required Size size,
        required String hintText}) =>
    InputDecoration(
      filled: true,
      prefixIcon: const Icon(
        Icons.search_rounded,
        color: kTextColor,
        size: kSmallIconSize,
      ),
      hintText: hintText,
      fillColor: kSurfaceColor,
      hintStyle: hintStyle,
      contentPadding: EdgeInsets.only(
        left: size.width * 0.045,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: kPrimaryColor,
          width: 3.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: kErrorColor,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: kErrorColor,
          width: 3.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: kTextColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    );

InputDecoration searchInputDecoration(
        {required TextStyle hintStyle,
        required Size size,
        required String hintText}) =>
    InputDecoration(
      filled: true,
      prefixIcon: const Icon(
        Icons.search_rounded,
        color: kTextColor,
        size: kSmallIconSize,
      ),
      hintText: hintText,
      fillColor: kSurfaceColor,
      hintStyle: hintStyle,
      contentPadding: EdgeInsets.only(
        left: size.width * 0.045,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: kPrimaryColor,
          width: 3.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: kErrorColor,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: kErrorColor,
          width: 3.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    );
