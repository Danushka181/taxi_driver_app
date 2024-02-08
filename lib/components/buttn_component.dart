import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final Function onButtonPres;
  final btnColor;
  final btnFontWeight;

  const ButtonWidget({Key? key, required this.btnText, required this.onButtonPres, this.btnColor=Colors.white, this.btnFontWeight=FontWeight.w600}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Colors.amber,
      borderRadius: BorderRadius.circular(50),
      child: MaterialButton(
        onPressed: (){
          onButtonPres();
        },
        minWidth: 320,
        height: 60,
        child: Text(
          btnText,
          style:  TextStyle(
            color: btnColor,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: btnFontWeight,
          ),
        ),
      ),
    );
  }
}

