// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants/asset.dart';
import 'components/app_bar.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isAndroid || Platform.isIOS ? null : AuthAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.pagenotfound,
            ),
            const SizedBox(height: 24.0),
            const Text(
              '404 Page Not Found',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
