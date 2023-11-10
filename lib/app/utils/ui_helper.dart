import 'package:flutter/material.dart';

const Widget horizontalSpacingTiny = SizedBox(width: 6);
const Widget horizontalSpacingSmall = SizedBox(width: 18);
const Widget horizontalSpacingRegular = SizedBox(width: 24);
const Widget horizontalSpacingMedium = SizedBox(width: 32);
const Widget horizontalSpacingLarge = SizedBox(width: 40);
const Widget horizontalSpacingExtraLarge = SizedBox(width: 48);

const Widget verticalSpacingTiny = SizedBox(height: 6);
const Widget verticalSpacingSmall = SizedBox(height: 18);
const Widget verticalSpacingRegular = SizedBox(height: 24);
const Widget verticalSpacingMedium = SizedBox(height: 32);
const Widget verticalSpacingLarge = SizedBox(height: 40);
const Widget verticalSpacingExtraLarge = SizedBox(height: 48);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightInPercentage(BuildContext context,
        {double percentage = 1}) =>
    screenHeight(context) * percentage;
double screenWidthInPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;
