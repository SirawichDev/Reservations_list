import 'package:flutter/material.dart';
import './clipper/CustomShapClipper.dart';

void main() => runApp(MaterialApp(
      title: "Flight List",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));
Color fistColor = Colors.orange;
Color secColor = Colors.pink;

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xfff3791a),
  fontFamily: 'Oxygen',
);
List<String> location = ['Songkhla (SK)', 'Phuket (PK)'];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopPart()],
      ),
    );
  }
}
const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white,fontSize: 16.0);
const TextStyle dropDownStyle = TextStyle(color: Colors.black,fontSize: 18.0);
class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var seletedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [fistColor, secColor])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.details,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            seletedIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              location[seletedIndex],
                              style: dropDownLabelStyle),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(location[0],style: dropDownStyle,),
                                value: 0,
                              ),
                                   PopupMenuItem(
                                child: Text(location[1],style: dropDownStyle,),
                                value: 1,
                              )
                            ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
