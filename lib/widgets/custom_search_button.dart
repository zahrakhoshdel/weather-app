// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

class customSearchButton extends StatelessWidget {
  Future<void> Function() onPress;
  customSearchButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(40.0, 40.0),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
      ),
      // style: buttonStyle1.copyWith(
      //   minimumSize: MaterialStateProperty.all(
      //     Size(40.0, 40.0),
      //   ),
      // ),
      onPressed: onPress,

      child: const Icon(Icons.location_on_outlined),
    );
  }
}
