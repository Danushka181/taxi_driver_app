import 'package:flutter/material.dart';

class BorderButtonWidget extends StatelessWidget {
  final String btnText;
  final Function onButtonPres;
  final Color btnColor;
  final FontWeight btnFontWeight;

  const BorderButtonWidget({Key? key, required this.btnText, required this.onButtonPres, this.btnColor=Colors.black, this.btnFontWeight=FontWeight.w600}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.black, // Border color
          width: 2, // Border width
        ),
      ),
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        child: MaterialButton(
          onPressed: () {
            // onButtonPress();
          },
          minWidth: 316,
          height: 58,
          child: Text(
            btnText,
            style: TextStyle(
              color: btnColor,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: btnFontWeight,
            ),
          ),
        ),
      ),
    );

  }
}

