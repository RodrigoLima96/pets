import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color kPrimaryColor = Color.fromRGBO(202, 215, 185, 1);
const Color kWhite = Color.fromARGB(255, 255, 255, 255);
const Color kBlack = Color.fromARGB(255, 0, 0, 0);
const kDefaultPadding = 20.0;
const TextStyle textStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: kWhite,
);
NumberFormat price = NumberFormat.currency(locale: 'en_US', name: '\$');
DateFormat date = DateFormat.yMMMd();
