import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeBottom extends StatefulWidget {
  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Current Watched Country",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text("View all(20)",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                    fontWeight: FontWeight.w600))
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          height: 230.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: countryCards,
          ),
        )
      ],
    );
  }
}

List<CountryCard> countryCards = [
  CountryCard(
      "Surat", "20%", 1300, 1000, "assets/images/surat.jpg", "Feb 2019"),
  CountryCard(
      "Krabi", "30%", 2000, 1400, "assets/images/krabi2.jpg", "May 2019"),
  CountryCard("Bangkok", "5%", 3000, 1900, "assets/images/bkk.jpg", "Jan 2019")
];
final formatCurrency = NumberFormat.simpleCurrency();

class CountryCard extends StatelessWidget {
  final String countryName, discount, imgPath, monthYear;
  final int oldPrice, newPrice;
  CountryCard(this.countryName, this.discount, this.oldPrice, this.newPrice,
      this.imgPath, this.monthYear);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210.0,
                  width: 160.0,
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                      decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black12]),
                  )),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(countryName,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          Text(
                            monthYear,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 3.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Text(discount,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 13.0)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Text(
                '${formatCurrency.format(newPrice)}',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '(${formatCurrency.format(oldPrice)})',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
