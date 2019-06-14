import 'package:flight_list/Screen/FlightListScreen/FlightListScreen.dart';
import 'package:flutter/material.dart';
import '../../utils/clipper/CustomShapClipper.dart';
import '../../utils/Colors/Colors.dart';
import '../../utils/DropDowns/DropDown.dart';
import '../../Components/Home/Choices.dart';

class HomeTop extends StatefulWidget {
  @override
  _HomeTopState createState() => _HomeTopState();
}

List<String> locations = ['Songkhla (SK)', 'Phuket (PK)'];
final _searchFieldController = TextEditingController(text: locations[1]);

class _HomeTopState extends State<HomeTop> {
  var seletedIndex = 0;
  var isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 320.0,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [fistColor, secColor, thirdColor])),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
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
                            Text(locations[seletedIndex],
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
                                child: Text(
                                  locations[0],
                                  style: dropDownStyle,
                                ),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(
                                  locations[1],
                                  style: dropDownStyle,
                                ),
                                value: 1,
                              )
                            ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Text(
                  "where would \n you want to go?",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "",
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height:20.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      style: dropDownMenuStyle,
                      controller: _searchFieldController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 26, vertical: 13.0),
                          border: InputBorder.none,
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InheritedFlightList(
                                              fromLocation:
                                                  locations[seletedIndex],
                                              toLocation:
                                                  _searchFieldController.text,
                                              child: FlightListScreen(),
                                            )));
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      child: Choices(
                          Icons.flight_takeoff, "Flights", isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    InkWell(
                      child: Choices(Icons.hotel, "Hotels", !isFlightSelected),
                      onTap: () {
                        setState(() {
                          isFlightSelected = false;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
