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

final List<Map<String, dynamic>> typeItems = [
  {
    'value': 'dog',
    'label': 'Dog',
  },
  {
    'value': 'cat',
    'label': 'Cat',
  },
  {
    'value': 'bird',
    'label': 'Bird',
  },
];

final List<Map<String, dynamic>> genderItems = [
  {
    'value': 'male',
    'label': 'male',
  },
  {
    'value': 'female',
    'label': 'female',
  },
];

final List<Map<String, dynamic>> weightItems = [
  {
    'value': 30.0,
    'label': 30.0,
  },
  {
    'value': 40.0,
    'label': 40.0,
  },
];

final List<Map<String, dynamic>> ageItems = [
  {
    'value': 1,
    'label': 1,
  },
  {
    'value': 2,
    'label': 2,
  },
  {
    'value': 3,
    'label': 3,
  },
];
