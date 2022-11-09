import 'package:flutter/material.dart';

class FieldInput extends StatelessWidget {
  const FieldInput({
    Key? key,
    required this.textFormField,
  }) : super(key: key);

  final TextFormField textFormField;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            child: Center(
              child: Row(
                children: [
                  Expanded(child: textFormField),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
