import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget text;
  final Color color;
  final Function onPressed;
  const Button({
    Key key,
    @required this.text,
    @required this.color,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Theme.of(context).primaryColor)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: text,
      ),
    );
  }
}
