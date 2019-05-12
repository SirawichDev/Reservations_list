import 'package:flight_list/utils/clipper/CustomShapClipper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/Colors/Colors.dart';

class FlightListScreen extends StatefulWidget {
  _FlightListScreenState createState() => _FlightListScreenState();
}

final formatCurrency = NumberFormat.simpleCurrency();

class _FlightListScreenState extends State<FlightListScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: GradientA(
//        title: Text(
//            "Flight List",
//        ),
//        centerTitle: true,
//        leading: InkWell(
//          child: Icon(Icons.arrow_back),
//          onTap: () {
//            Navigator.pop((context));
//          },
//        ),
//        backgroundColor: bo,
//      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            GradientAppbar(),
            FligtListTop(),
            FlightListBottom()
          ],
        ),
      ),
    );
  }
}

class GradientAppbar extends StatelessWidget {
  final double barHeight = 120.0;

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: new EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            new Text(
              "Search Result",
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            SizedBox(
              width: 30,
            )
          ]),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [fistColor, secColor])),
    );
  }
}

class FligtListTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 155,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [fistColor, secColor])),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 23.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Songkhla (SK)",
                            style: TextStyle(fontSize: 17.0),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 20.0,
                          ),
                          Text(
                            "Phuket (PK)",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.import_export,
                          color: Colors.black,
                          size: 35.0,
                        ))
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class FlightListBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Best Deal for you",
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              FlightListCard(),
              FlightListCard(),
              FlightListCard()
              ,FlightListCard(),
              FlightListCard(),
              FlightListCard()
            ],
          ),
        ],
      ),
    );
  }
}

class FlightListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              border: Border.all(color: Colors.white)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '${formatCurrency.format(23334)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 23.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '${formatCurrency.format(1333)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
                Wrap(
                  spacing: 0.0,
                  children: <Widget>[
                    FlightButtomCardIcon(Icons.calendar_today, "Jan 2019"),
                    FlightButtomCardIcon(Icons.flight_takeoff, "Air Asia"),
                    FlightButtomCardIcon(Icons.star, "3.4")
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          right: 5.0,
          child: Container(
            child: Text(
              "44%",
              style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w800),
            ),
          ),
        )
      ],
    );
  }
}

class FlightButtomCardIcon extends StatelessWidget {
  final IconData iconData;
  final String label;

  FlightButtomCardIcon(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawChip(
      label: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      labelStyle: TextStyle(color: Colors.black, fontSize: 14.0),
      backgroundColor: Colors.transparent,
      avatar: Icon(
        iconData,
        size: 14.0,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
