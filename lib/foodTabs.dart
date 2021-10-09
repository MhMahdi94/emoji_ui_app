import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem(
              'Delecious Burger', 4, '6', 'assets/images/burger.png'),
          _buildListItem(
              'Delecious Burger', 4, '6', 'assets/images/burger.png'),
          _buildListItem(
              'Delecious Burger', 4, '6', 'assets/images/burger.png'),
          _buildListItem(
              'Delecious Burger', 4, '6', 'assets/images/burger.png'),
          _buildListItem(
              'Delecious Burger', 4, '6', 'assets/images/burger.png'),
        ],
      ),
    );
  }

  _buildListItem(
      String description, double rating, String price, String imgPath) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210,
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      style: GoogleFonts.roboto(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      price.toString() + " \$",
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.7)),
                    ),
                  ],
                )
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.grey.withOpacity(0.5),
            heroTag: description,
            mini: true,
            child: Center(child: Icon(Icons.add)),
          )
        ],
      ),
    );
  }
}
