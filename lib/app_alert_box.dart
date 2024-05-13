import 'package:flutter/material.dart';
class AppAlertDialog extends StatelessWidget {
  final String title, content;
  final Orientation orientation;
  const AppAlertDialog(
      {super.key,
        required this.title,
        required this.content,
        required this.orientation});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style:const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Metropolis'
          )
        ),
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style:const TextStyle(
          fontFamily: 'Metropolis',
          fontSize: 18,
          fontWeight: FontWeight.w600
        )
      ),
      contentPadding: const EdgeInsets.all(40.00),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: (orientation == Orientation.portrait)
              ? MediaQuery.of(context).size.height * 0.06
              : MediaQuery.of(context).size.height * 0.12,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDB3022),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OKAY"),
          ),
        )
      ],
    );
  }
}