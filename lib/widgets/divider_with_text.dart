import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String dividerText;
  const DividerWithText({Key? key, @required required this.dividerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Divider(),
        )),
        Text(dividerText),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Divider(),
        )),
      ],
    );
  }
}
