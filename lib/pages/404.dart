import 'package:flutter/material.dart'
    show BuildContext, Center, Key, Row, StatelessWidget, Text, Widget;

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: const [
          Text("Page Not Found"),
        ],
      ),
    );
  }
}
