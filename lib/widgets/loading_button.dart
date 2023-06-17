import 'package:flutter/material.dart';
import 'package:nufish/theme.dart';

Widget loadingButton() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator()
          ),
          const SizedBox(width: 7),
          Text(
            "Loading",
            style: quaternaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16
            ),
          ),
        ],
      ),
    ),
  );
}