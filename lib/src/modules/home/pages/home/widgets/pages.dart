import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/pages/add/add_page.dart';
import 'package:pets/src/modules/feed/pages/feed/feed_page.dart';
import 'package:pets/src/modules/profile/pages/profile/profile_page.dart';
import 'package:pets/src/shared/utils/methods.dart';

List<Widget> appPages = [
  const AddPage(),
  const FeedPage(),
  ProfilePage(uid: getUserUid()),
];
