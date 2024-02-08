import 'package:flutter/material.dart';

// DisplayError Messages
errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(text),
        duration: const Duration(seconds: 4),
      )
  );
}

successSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(text),
        duration: const Duration(seconds: 4),
      )
  );
}

showAlertDialog(BuildContext context, String text){
  AlertDialog alert=AlertDialog(
    content: Row(
      children: [
        const SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: Colors.greenAccent,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}