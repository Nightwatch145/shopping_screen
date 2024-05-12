import 'package:flutter/material.dart';
class QuantityButton extends StatelessWidget
{
  final IconData icon;
  final Function onPressed;
  const QuantityButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       decoration:const BoxDecoration(
         color: Colors.white,
         shape: BoxShape.circle,
       ),
        alignment: Alignment.center,
        child: IconButton(
          onPressed: ()=> onPressed(),
          icon: Icon(icon, size: 26, color: Colors.grey)
        )
      )
    );
  }
}