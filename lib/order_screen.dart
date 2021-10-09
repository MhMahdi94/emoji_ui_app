import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cool_alert/cool_alert.dart';

class OrderScreen extends StatefulWidget {
  //const OrderScreen({Key? key}) : super(key: key);
  final imgPath, foodName, pricePerItem, heroTag;
  OrderScreen({this.imgPath, this.foodName, this.pricePerItem, this.heroTag});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            //Screen Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  child: Icon(Icons.shopping_cart),
                )
                // Container(
                //   height: 50,
                //   width: 50,
                //   decoration: BoxDecoration(),
                // )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              // child: Center(
              //   child: Text(
              //     widget.foodName.toString().toUpperCase(),
              //     style: GoogleFonts.roboto(
              //       fontSize: 28,
              //     ),
              //   ),
              // ),
              child: Container(
                //width: 200,
                padding: EdgeInsets.all(15),
                //height: 200,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // height: 350,
                      //width: 150,

                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Image.asset(
                        widget.imgPath,
                        fit: BoxFit.cover,
                        //height: 350,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(
                        widget.foodName.toString(),
                        style: GoogleFonts.roboto(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Price
                        Text(
                          "Price: " + widget.pricePerItem.toString() + "\$",
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),

                        //Cart Counter
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.withOpacity(0.7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 18,
                                  )),
                              Container(
                                //margin: EdgeInsets.symmetric(horizontal: 3),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.grey.withOpacity(0.1)),
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24),
                                ),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  )),
                            ],
                          ),
                        ),
                        //Text('btn'),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //Featured
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8),
              child: Text(
                'Featured',
                style: GoogleFonts.roboto(fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _listItem(widget.imgPath.toString(), "Extra Cheese", 3),
                      _listItem(widget.imgPath.toString(), "Extra Beef", 3),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                padding: EdgeInsets.all(15),
                child: OutlinedButton(
                    onPressed: () {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        //text: "Successfully",
                      );
                    },
                    child: Text(
                      'Process',
                      style:
                          GoogleFonts.roboto(fontSize: 18, color: Colors.grey),
                    )))
          ],
        ),
      ),
    );
  }

  _listItem(String imgPath, String description, double price) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            child: Image.asset(imgPath),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  price.toString() + "\$",
                  style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
