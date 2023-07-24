import 'package:flutter/material.dart';

class CommonModal extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onClose;
  final VoidCallback onConfirm;

  const CommonModal({
    super.key,
    required this.title,
    required this.content,
    required this.onClose,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onClose,
          child: const Text('Close'),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          onPressed: onConfirm,
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
