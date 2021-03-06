import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.colour, @required this.onPressed, this.logo});

  final Color colour;
  final IconData logo;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 20.0),
      child: Material(
        elevation: 8.0,
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: 42.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0 ,right: 20.0),
                child: Icon(
                  logo,
                  color: Colors.white,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
