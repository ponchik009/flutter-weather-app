import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({Key? key, required this.text, required this.retry})
      : super(key: key);

  final String text;
  final void Function() retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(onPressed: retry, icon: const Icon(Icons.refresh)),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
