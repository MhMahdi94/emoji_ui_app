import 'package:emoji_ui_app/foodTabs.dart';
import 'package:emoji_ui_app/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 8, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          //App Header
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6,
                            spreadRadius: 4,
                            offset: Offset(0, 3))
                      ],
                      color: Color(0xffc6e7fe),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.contain,
                      )),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          //   child: Text(
          //     'Search For Recipes',
          //     style: GoogleFonts.antic(fontSize: 28),
          //   ),
          // )

          //search Field
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
            ),
          ),
          //Recommended
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Recommended',
              style: GoogleFonts.roboto(fontSize: 18, color: Colors.black54),
            ),
          ),

          //Items Cards
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  listItemCard(
                      'Burger',
                      'assets/images/burger.png',
                      '5',
                      Colors.grey.withOpacity(0.3),
                      Colors.black.withOpacity(0.6)),
                  listItemCard(
                      'Burger',
                      'assets/images/burger.png',
                      '5',
                      Colors.grey.withOpacity(0.3),
                      Colors.black.withOpacity(0.6)),
                  listItemCard(
                      'Burger',
                      'assets/images/burger.png',
                      '5',
                      Colors.grey.withOpacity(0.3),
                      Colors.black.withOpacity(0.6)),
                  listItemCard(
                      'Burger',
                      'assets/images/burger.png',
                      '5',
                      Colors.grey.withOpacity(0.3),
                      Colors.black.withOpacity(0.6)),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          //Tabs
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700),
              unselectedLabelStyle:
                  GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w500),
              tabs: [
                Tab(child: Text('Featured')),
                Tab(child: Text('Featured')),
                Tab(child: Text('Featured')),
                Tab(child: Text('Featured')),
                Tab(child: Text('Featured')),
                Tab(child: Text('Featured')),
                Tab(child: Text('Featured')),
                Tab(child: Text('Featured')),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450,
            child: TabBarView(
              controller: tabController,
              children: [
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ),
          )
        ],
      )),
    );
  }

  listItemCard(String itemName, String imgPath, String price, Color bgColor,
      Color txtColor) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          print(itemName);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OrderScreen(
                    foodName: itemName,
                    imgPath: imgPath,
                    pricePerItem: price,
                    heroTag: itemName,
                  )));
        },
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //item image
              Hero(
                  tag: itemName,
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        imgPath,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  )),

              SizedBox(
                height: 25,
              ),

              //item text
              Text(
                itemName,
                style: GoogleFonts.roboto(fontSize: 17, color: txtColor),
              ),

              SizedBox(
                height: 25,
              ),

              //item price
              Text(
                price + " \$",
                style: GoogleFonts.roboto(fontSize: 14, color: txtColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
