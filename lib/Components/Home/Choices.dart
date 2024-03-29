import 'package:flutter/material.dart';


class Choices extends StatefulWidget{
  final IconData icon;
  final String text;
  final bool isSelected;

  Choices(this.icon,this.text,this.isSelected);

  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected ? BoxDecoration(
          color: Colors.white.withOpacity(.15),
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),

        ],
      ),
    );
  }
}
