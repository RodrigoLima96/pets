import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(202, 215, 185, 1);
const Color kWhite = Color.fromARGB(255, 255, 255, 255);
const Color kBlack = Color.fromARGB(255, 0, 0, 0);
const kDefaultPadding = 20.0;
const TextStyle textStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: kWhite,
);

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

List<String> petType = [
  'all',
  'dog',
  'cat',
  'bird',
];
